public class DGF_Utilities {
    public class UNI_BW_Properties {
        public Integer Speed { get; set; }
        public Integer Oversubscription { get; set; }
        public Integer EVC_Aggregate_BW { get; set; }
        public Integer Adjusted_BW { get; set; }
        public Id Physical_Site { get; set; }
        public Boolean IsOverrun { 
            get { 
                return this.Adjusted_BW == 0 ? true : (this.Adjusted_BW > (this.Speed * this.Oversubscription)); 
            } 
        }

        public UNI_BW_Properties() {
            this.Speed = 0;
            this.Oversubscription = 0;
            this.EVC_Aggregate_BW = 0;
            this.Adjusted_BW = 0;
        }
    }
    
    public static Void DeleteOldEvcUniJunctions() {
        List<EVC_UNI_Association__c> junctions = [SELECT Id FROM EVC_UNI_Association__c WHERE EVC__c = '' OR UNI__c = '' OR DGF_Id__c = ''];
        delete junctions;
    }
    
    public static Integer getSiteCnlSpeed(Physical_Site__c ps) {
        List<EVC_UNI_Association__c> junctions = getAllEvcUniJunctionsForDgf(ps.DGF__c);
        Map<Id, UNI_BW_Properties> uniProps = GetMapFromEvcUniJunctions(junctions);
        Set<Id> uniIds = uniProps.keySet();
        Integer res = 0;
        for (Id uid : uniIds) {
            UNI_BW_Properties uProps = uniProps.get(uid);
            if (uProps.Physical_Site == ps.Id) res += uProps.Adjusted_BW;
        }
        return res;
    }
    
    public static Integer getSiteCnlSpeed(Id psId, Map<Id, UNI_BW_Properties> uniProps, Set<Id> uniIds) {
        Integer res = 0;
        for (Id uid : uniIds) {
            UNI_BW_Properties uProps = uniProps.get(uid);
            if (uProps.Physical_Site == psId) res += uProps.Adjusted_BW;
        }
        return res;
    }

    @TestVisible private Static Set<Id> getSiteIdsForEvc(EVC__c evc) {
        Set<Id> siteIds = new Set<Id>();
        List<EVC_UNI_Association__c> junctions = [SELECT UNI__r.Physical_Site__c FROM EVC_UNI_Association__c WHERE EVC__c = :evc.Id];
        for (EVC_UNI_Association__c j : junctions){
            siteIds.add(j.UNI__r.Physical_Site__c);
        }
        return siteIds;
    }
    
    public static Void updateAllCnlSpeedsInDgf(Id DgfId) {
        List<EVC_UNI_Association__c> junctions = getAllEvcUniJunctionsForDgf(DgfId);
        Map<Id, UNI_BW_Properties> uniProps = GetMapFromEvcUniJunctions(junctions);
        Set<Id> uniIds = uniProps.keySet();
        List<Physical_Site__c> sites = [SELECT Id, CNL_Speed_2__c FROM Physical_Site__c WHERE DGF__c = :DgfId];
        for (Physical_Site__c s : sites) {
            s.CNL_Speed_2__c = getSiteCnlSpeed(s.Id, uniProps, uniIds);
        }
        update sites;
    }
    
    public static Map<Id, UNI_BW_Properties> GetMapFromEvcUniJunctions(List<EVC_UNI_Association__c> junctions) {
        Map<Id, UNI_BW_Properties> res = new Map<Id, UNI_BW_Properties>();
        for (EVC_UNI_Association__c j : junctions) {
            UNI_BW_Properties uniProps = res.get(j.UNI__c);
            if (uniProps == null) {
                uniProps = new UNI_BW_Properties();
                uniProps.Speed = j.UNI__r.Speed_Value__c.intValue();
                uniProps.Oversubscription = j.UNI__r.Oversubscription_Value__c.intValue();
                uniProps.EVC_Aggregate_BW = j.EVC__r.Bandwidth_Value__c != null ? j.EVC__r.Bandwidth_Value__c.intValue() : 1;
                uniProps.Adjusted_BW = computeUNIRateAdjustedBW(uniProps.EVC_Aggregate_BW, uniProps.Speed);
                uniProps.Physical_Site = j.UNI__r.Physical_Site__c;
                res.put(j.UNI__c, uniProps);
            } else {
                uniProps.EVC_Aggregate_BW += j.EVC__r.Bandwidth_Value__c != null ? j.EVC__r.Bandwidth_Value__c.intValue() : 1;
                uniProps.Adjusted_BW = computeUNIRateAdjustedBW(uniProps.EVC_Aggregate_BW, uniProps.Speed);
            }
        }
        return res;
    }
    
    public static Integer computeUNIRateAdjustedBW(Integer evcAggregate, Integer uniSpeed) {
        if (uniSpeed < 10000) {
            Integer[] vals = new Integer[]{2,4,5,8,10,20,50,60,70,80,90,100,200,300,400,500,600,700,800,900,1000};
            for (Integer i = 0, n = vals.size(); i < n; i++) {
                if (vals[i] >= evcAggregate) {
                    return vals[i];
                }
            }
        } else {
            for (Integer i = 1000; i < 10001; i+=1000) {
                if (i >= evcAggregate) {
                    return i;
                }
            }
        }
        return evcAggregate;
    }
    
    public static List<EVC_UNI_Association__c> getAllEvcUniJunctionsForDgf(Id dgfId) {
        return [SELECT Id, 
                    EVC__c, 
                    EVC__r.Bandwidth_Value__c, 
                    UNI__c, 
                    UNI__r.Speed_Value__c, 
                    UNI__r.Oversubscription_Value__c,
                	UNI__r.Physical_Site__c
                FROM EVC_UNI_Association__c 
                WHERE DGF_Id__c = :dgfId
                AND EVC__c != null
                AND UNI__c != null];
    }

    @TestVisible private static List<EVC_UNI_Association__c> getAllEvcUniJunctionsForUnis(List<UNI__c> unis) {
        List<EVC_UNI_Association__c> junctions = getAllEvcUniJunctionsForDgf(unis[0].DGF_Id__c);
        
        List<Id> uniIds = new List<Id>();
        for (UNI__c uni : unis) {
            uniIds.add(uni.Id);
        }
        
        // do not remove this line - unit test fails without it - don't know why
        system.debug('uniIds: ' + uniIds);
        
        List<EVC_UNI_Association__c> uniJunctions = new List<EVC_UNI_Association__c>();
        for (EVC_UNI_Association__c j : junctions) {
            if (uniIds.contains(j.UNI__c)) uniJunctions.add(j);
        }
        return uniJunctions;
    }

    @TestVisible private static List<EVC_UNI_Association__c> getAllEvcUniJunctionsForUni(UNI__c uni) {
        List<EVC_UNI_Association__c> junctions = getAllEvcUniJunctionsForDgf(uni.DGF_Id__c);
        List<EVC_UNI_Association__c> uniJunctions = new List<EVC_UNI_Association__c>();
        for (EVC_UNI_Association__c j : junctions) {
            if (j.UNI__c == uni.Id) uniJunctions.add(j);
        }
        return uniJunctions;
    }

    @TestVisible private static List<EVC_UNI_Association__c> getAllEvcUniJunctionsForEvc(EVC__c evc) {
        List<EVC_UNI_Association__c> junctions = getAllEvcUniJunctionsForDgf(evc.DGF__c);
        List<EVC_UNI_Association__c> evcJunctions = new List<EVC_UNI_Association__c>();
        for (EVC_UNI_Association__c j : junctions) {
            if (j.EVC__c == evc.Id) evcJunctions.add(j);
        }
        return evcJunctions;
    }
    
    public static Integer getOversubscriptionMultiplier (String selectedOverSub) {
        Integer val = 1;
        try {
            val = Integer.valueOf(selectedOverSub.left(1));
        } catch(Exception ex) {
            val = 1;
        }
        return val;
    }

    public static List<SterlingQuoteItem__c> getQuoteItems(ID opportunityId) {
        if (opportunityId == null) return new List<SterlingQuoteItem__c>();
        List<SterlingQuote__c> quote = [SELECT
                                 	Id
                                   ,Name
                                 FROM SterlingQuote__c
                                 WHERE OpportunityId__c = :opportunityId
                                 AND IsSyncing__c = true
                                 LIMIT 1];
        if (quote.size() == 0) {
            return new List<SterlingQuoteItem__c>();
        }
        List<SterlingQuoteItem__c> res = [SELECT Id, Name, Description__c FROM SterlingQuoteItem__c WHERE SterlingQuote__c = :quote[0].Id];
        return res;
    }
    
	// because this is an invocable method, it can only take a list as parameter
	// therefore it expects a list containing a single uni
    @InvocableMethod(label='Set DGF Jumbo Frame Size Flag' description='Sets the Jumbo Frame Size Flag on the parent DGF of a UNI')
    public static Void setDgfJumboFrameSizeFlag(List<Id> uniId) {
        Id dgfId = [SELECT Physical_Site__r.DGF__c FROM UNI__c WHERE Id = :uniId[0] LIMIT 1].Physical_Site__r.DGF__c;
        List<Physical_Site__c> relatedSites = [SELECT Id FROM Physical_Site__c WHERE DGF__c = :dgfId];
        List<Id> relatedSiteIds = new List<Id>();
        for (Physical_Site__c ps : relatedSites) {
            relatedSiteIds.add(ps.Id);
        }
        List<UNI__c> jumboUnis = [SELECT Frame_Size__c FROM UNI__c WHERE Frame_Size__c != '<=1600' AND Physical_Site__c IN :relatedSiteIds];
        DGF__c dgf = [SELECT Jumbo_Frames_Required__c FROM DGF__c WHERE Id = :dgfId LIMIT 1];
        dgf.Jumbo_Frames_Required__c = jumboUnis.size() > 0;
        update dgf;
    }
    
    public static Void handleCreateMultipleSites(Integer numSites, DGF__c dgf) {
        List<Physical_Site__c> sites = new List<Physical_Site__c>();
        Integer currentSiteCount = [SELECT Id FROM Physical_Site__c WHERE DGF__c = :dgf.Id].size() + 1;
        for (Integer i = 0; i < numSites; i++) {
            sites.add(new Physical_Site__c(Name = dgf.Name + ' - Site ' + (i + currentSiteCount), 
                                           Maintenance_Contact__c = dgf.Global_Maintenance_Contact__c, 
                                           Site_Contact__c = dgf.Global_Site_Contact__c,
                                           DGF__c = dgf.Id));
        }
        insert sites;
    }
    
}