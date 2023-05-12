import { LightningElement, api } from 'lwc';
import { OmniscriptBaseMixin } from 'vlocity_cmt/omniscriptBaseMixin';
import { OmniscriptActionCommonUtil } from 'vlocity_cmt/omniscriptActionUtils';


export default class InternalObjectAnalysis extends OmniscriptBaseMixin(LightningElement) {

    columnHeader = ['Profile', 'DefaultRecordType','Agent_Patner_PortaL_Lead','Alt_Channel_OTM', 'Alt_Channel_SMB_D2D','Commercial_SMB_Lead','Community_Connection_MDU', 'Customer_Referral_Lead','DCI_Lead','Default_Lead','Frontier_com_Lead','Lead_Demo','MDU_MTU_Lead','Test_Lead','TTL_Lead','USAC_Leads_eRate'];

    @api
    set htmlValue(value) {
        if (this.attachmentPoint) {
            this.attachmentPoint.innerHTML = value;
        }
        this._htmlValue = value;
    }

    get htmlValue() {
        return this._htmlValue;
    }

    renderedCallback() {
        this.attachmentPoint = this.template.querySelector('div[ishtmlcontainer=true]');
        this.attachmentPoint.innerHTML = this.htmlValue;
    }

    connectedCallback() {
        this.htmlValue = "";
        
        this.sRecordTypes = {};
        console.log(this.sRecordTypes);
        for (let i = 0; i < this.columnHeader.length; i++) {
            if(i < 2){
                this.sRecordTypes[this.columnHeader[i]] = "";
            } else {
                this.sRecordTypes[this.columnHeader[i]] = false;
            }
        }

        this.getProfiles();


    }

    handleClick(){
        this.textAreaValue = [this.template.querySelector("lightning-textarea").value];
        this.inputJsonFormatt = JSON.parse(this.textAreaValue);
        this.sRecordTypesList = [];

        for (let i = 0; i < this.nameProfilesArr.length; i++) {
            if(this.inputJsonFormatt[this.nameProfilesArr[i]]){
                let sRecordTypes = {};
                for (let j = 0; j < this.columnHeader.length; j++) {

                    if(j == 0){
                        sRecordTypes[this.columnHeader[j]] = this.nameProfilesArr[i];
                    } else {
                        if(this.inputJsonFormatt[this.nameProfilesArr[i]] && this.inputJsonFormatt[this.nameProfilesArr[i]].recordTypeVisibilities){
                            this.inputJsonFormatt[this.nameProfilesArr[i]].recordTypeVisibilities.forEach(record => {
                                let sObjectLabel = 'Lead';
                                let fixRecordType = record.recordType.split('.');
                                if(fixRecordType[fixRecordType.length-1] == this.columnHeader[j]){

                                    let values = { 'visible': false, 'default': false }
                                    values.default = record.default;
                                    values.visible = record.visible;
                                    sRecordTypes[this.columnHeader[j]] = record.visible;
                                    if(record.default){
                                        sRecordTypes[this.columnHeader[1]] = this.columnHeader[j];
                                    }

                                }

                            });
                        }

                    }

                }

                this.sRecordTypesList.push(sRecordTypes);
            }
        }
        
        console.log("this.sRecordTypesList: ", this.sRecordTypesList),

        this.getExportData(this.sRecordTypesList);

    }

    getProfiles() {
        let input = "TCIPartner-TotalCommunications,ABSAuditor,ABSCustomerServiceAnalyst,ABSCustomerServiceSupervisor,ABSSolutionEngineerSupervisor,ABSVicePres-SalesInsight,AccountExec,AdCommAccountExec,AlternateChannel-CommunityConnectionsAE,AlternateChannel-CommunityConnectionsSales,AlternateChannelLeadership,AlternateChannelManager,AlternateChannel-SalesSupport,AlternateChannelVP,BAM-BusinessAccountManager,CommercialSMBSales,CPEAccountExec,CPEOverlayAE,CPERegionalSalesMgr,CTFAccountExec,CTFAccountExec-SalesInsight,CTFCustomerServiceAnalyst,CTFCustomerServiceAnalyst-SalesInsight,CTFRegionalSalesMgr,CTFRegionalSalesMgr-SalesInsight,CTFSmallBusinessManager,CTFSmallBusinessUser,CTF-SupportTeamManager,CTFTestAnalyst,CustomerServiceAnalyst,CustomerService-DirectoryListing-CaseAssigner,CustomerService-DirectoryListing-CaseSubmitter,CustomerService-DirectoryListing-CaseWorker,DealDeskFinanceApprover,Federal&E-RateManager,HotCutServiceConsultants,HotCutSupervisor,MarketingManager,MTU,OrderEngineeringDesk,P10AccountExec,Pilot_AccountExec-NoNewAccounts,ProjectManager,ProjectManager-SupervisorLevel,Provisioning,ProvisioningSupervisor,PSSExecutive,RegionalSalesMgr,NRevanaAccountExec,SalesEngineer,SalesEngineerSupervisor,SalesSupportRep,SalesSupportSupervisor,SolutionArchitect-Commercial,SolutionEngineerLeadership,SolutionEngineerSupervisor,TCIAccountExec,Trainer,AccountExecTestProfile,Frontier System Administrator,Agents,AltChannelSMB-B2B,AltChannelSMBD2D,AltChannelSMBOTM,AltChannelSMB-OTM,AltChannelSMBOTMSupervisor,AnalyticsCloudIntegrationUser,AnalyticsCloudSecurityUser,API-Clari,API-FrontierMarketing,API-Integration,API-Massini,API-Spotfire,API-Xactly,CarrierAccountExecutive,CarrierSalesManager,CarrierSE,CarrierSESupervisor,CarrierSSC,CCTESTUser,ContentUser,ContractManager,CustomerServiceSupervisor,DataAnalyst-DPI,DirectSalesSupport,DirectSalesSupportAdmin,EnterprisePartnerPortalUser,ERATECustomerServiceAnalyst,FrontierAuditor,FrontierCommissionsTeam,FrontierCSAUser,FrontierManageQuota,FrontierPartnerPortalUser,FrontierPortalUser,FrontierSalesUser,FrontierSecureAccountExecutiveUpdated,FrontierSupportUser,FrontierSystemAdministrator,FrontierSystemAdminw/SalesInsight,GoldPartnerUser,IMO-Integration,InternalAlternateChannelExecutives,ITPortfolio,LeadDevelopmentRep(LDR),Marketing,Marketing-SalesInsight,MarketingUser,MarketingUser-Level1,MarketoSync,NMinimumAccess-Salesforce,MinimumAccess-Salesforce,OfflinePromo,Partner-AgentTools,PartnerCommunityUser,PartnerSupportChannelManager,PartnerSupportTeam,PremierSupportUser,ProductManager,PruebaCTFRegionalSalesMgr,ReadOnly,RestrictedPartnerPortalUser,RevanaAccountExec,RFPCoordinator,SalesforceIQIntegrationUser,SalesInsightsIntegrationUser,SalesOperations,SmallBusinessUser,SmallBusinessUserHC,SolutionManager,StandardUser,SubAgents,SystemAdministrator,SystemAnalyst,SystemAnalystw/SalesInsight,TCIAccountExecutive,TestCustomerServiceAnalyst,TestCustomerServiceAnalystDelKE,Vendor-SBI,VicePres-SalesInsight,zzz_AccountExec-CT,zzz_FrontierReadOnlyUser,zzz_FrontierSalesManager,zzz_FrontierSalesUser,zzz_FrontierSecureAccountExecutive,zzz_ServiceConsoleTestingSupervisor,zzz_Testingdocusign,zzz_Testingteam"
        this.nameProfilesArr = input.split(',');
    }

    getExportData(data){
        console.log("getExportData", data);
        // Prepare a html table
        let doc = '<table>';
        // Add styles for the table
        doc += '<style>';
        doc += 'table, th, td {';
        doc += '    border: 1px solid black;';
        doc += '    border-collapse: collapse;';
        doc += '}';          
        doc += '</style>';
        // Add all the Table Headers
        doc += '<tr>';
        this.columnHeader.forEach(element => {            
            doc += '<th>'+ element +'</th>'           
        });
        doc += '</tr>';
        // Add the data rows

        data.forEach(record => {

            doc += '<tr>';
            for (let i = 0; i < this.columnHeader.length; i++) {

                doc += '<th>'+record[this.columnHeader[i]]+'</th>'; 
                
            }
            doc += '</tr>';
 
        });

        doc += '</table>';
        this.htmlValue = doc;
        //var element = 'data:application/vnd.ms-excel,' + encodeURIComponent(doc);
        //let downloadElement = document.createElement('a');
        //downloadElement.href = element;
        //downloadElement.target = '_self';
        // use .csv as extension on below line if you want to export data as csv
        //downloadElement.download = 'Analysis Data.xls';
        //document.body.appendChild(downloadElement);
        //downloadElement.click();
    }

}