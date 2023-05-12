public class uploadAllAttachement {
    
    public Opportunity opp {get;set;} //Opportunity object
    
    //constructor
    public uploadAllAttachement(ApexPages.StandardController standardPageController) {
        opp = (Opportunity)standardPageController.getRecord(); //instantiate the Opportunity object for the current record
    }
    
    //method called from the Visualforce's action attribute
    public PageReference attachPDF() {
        if(opp.id != null){
            Opportunity opport = new Opportunity();
            opport = [select id,Contract_Term_Years__c,Types_of_Product__c from Opportunity where id =: opp.id limit 1];
            Boolean stopRecursion = true;
            list<Attachment> attList = new list<Attachment>();
            list<Attachment> attList2 = new list<Attachment>();
            
            attList = [select id,Name,ParentID from Attachment where ParentID =: opp.id];
            if(opport.Types_of_Product__c == 'Frontier Anyware'){
                
                List<Folder>  folderRecord = new List<Folder>();
                List<Document> documnetlst = new List<Document>();
                List<Attachment> attachList = new List<Attachment>();
                List<Attachment> attachlst = new List<Attachment>();
                List<Marketing_Document__c> market = new List<Marketing_Document__c>();
                Blob pdfBlob2; 
                
                market = [select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: opp.Id limit 1];
                attachlst = [select id,Name,ParentID from Attachment where ParentID =: market[0].id];
                folderRecord = [Select id,Name from Folder where Name =: 'Marketing UCaaS documents' limit 1];
                System.debug('===folderRecord=='+folderRecord[0].id);
                
                if(folderRecord != null && !folderRecord.isEmpty()){
                    documnetlst = [select id,Name,Body,FolderId from Document where FolderId =: folderRecord[0].id]; 
                }
                
                if(attachlst != null && !attachlst.isEmpty()){
                    for(Attachment a : attachlst){
                        if(documnetlst != null && !documnetlst.isEmpty() && market != null && !market.isEmpty()){
                            
                        }
                    }
                    
                }else{
                    if(documnetlst != null && !documnetlst.isEmpty() && market != null && !market.isEmpty()){
                        for(Document doc : documnetlst){
                            System.debug('===market[0].id===='+market[0].id);
                            Attachment attach2 = new Attachment();
                            pdfBlob2 = doc.Body;
                            attach2.parentId = market[0].id;
                            attach2.Name = doc.Name;
                            attach2.Body = pdfBlob2;
                            attachList.add(attach2);
                        }
                    }
                }
                //Loas
                List<Folder>  LoaFolder = new List<Folder>();
                List<Document> documnetLoa = new List<Document>();
                List<Attachment> attachLoaList = new List<Attachment>();
                List<Attachment> attachLoalst = new List<Attachment>();
                List<LOAs__c> loa = new List<LOAs__c>();
                Blob pdfBlob4; 
                
                loa = [select id,Opportunity__c from LOAs__c where Opportunity__c =: opp.Id limit 1];
                attachLoalst = [select id,Name,ParentID from Attachment where ParentID =: loa[0].id];
                LoaFolder = [Select id,Name from Folder where Name =: 'LOAs' limit 1];
                
                
                if(LoaFolder != null && !LoaFolder.isEmpty()){
                    documnetLoa = [select id,Name,Body,FolderId from Document where FolderId =: LoaFolder[0].id]; 
                }
                
                if(attachLoalst != null && !attachLoalst.isEmpty()){
                    list<Attachment> loaList = new list<Attachment>();
                    list<Attachment> updateloaList = new list<Attachment>();
                    Boolean Letter = True;
                    for(Attachment a : attachLoalst){
                        if(a.Name.contains('Letter_Of_Agency')){
                            Letter = false;
                            PageReference pdfPage4 = Page.Letter_Of_Agency; 
                            Blob pdfBlob;  
                            if (!Test.isRunningTest()) {  
                                pdfPage4.getParameters().put('Id', opp.Id);
                                pdfBlob = pdfPage4.getContent();  
                            } else {  
                                pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                            }
                            a.Body = pdfBlob;
                            updateloaList.add(a);
                        }
                        if(documnetLoa != null && !documnetLoa.isEmpty() && loa != null && !loa.isEmpty()){
                            
                        }
                    }
                    if(Letter){
                        PageReference pdfPage4 = Page.Letter_Of_Agency;  
                        Blob pdfBlob;  
                        if (!Test.isRunningTest()) {  
                            pdfPage4.getParameters().put('Id', opp.Id);
                            pdfBlob = pdfPage4.getContent();  
                        } else {  
                            pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                        }
                        Attachment attach4 = new Attachment(parentId = loa[0].id, Name = 'Letter_Of_Agency.pdf', body = pdfBlob,contentType = 'application/pdf'); //create the attachment object
                        loaList.add(attach4);
                    }
                    try{
                        insert loaList;
                        update updateloaList;
                    }
                    catch(Exception e){
                        
                    }
                    
                }else{
                    PageReference pdfPage4 = Page.Letter_Of_Agency;  
                    Blob pdfBlob;  
                    if (!Test.isRunningTest()) {  
                        pdfPage4.getParameters().put('Id', opp.Id);
                        pdfBlob = pdfPage4.getContent();  
                    } else {  
                        pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                    }
                    Attachment attach4 = new Attachment(parentId = loa[0].id, Name = 'Letter_Of_Agency.pdf', body = pdfBlob,contentType = 'application/pdf'); //create the attachment object
                    try{
                        insert attach4;
                    }
                    catch(Exception e){
                        
                    }
                    
                    if(documnetLoa != null && !documnetLoa.isEmpty() && loa != null && !loa.isEmpty()){
                        for(Document doc : documnetLoa){
                            Attachment attach2 = new Attachment();
                            pdfBlob4 = doc.Body;
                            attach2.parentId = loa[0].id;
                            attach2.Name = doc.Name;
                            attach2.Body = pdfBlob4;
                            attachLoaList.add(attach2);
                        }
                    }
                }
                
                //order document 
                List<Folder>  folderOrderRecord = new List<Folder>();
                List<Document> documnetOrderlst = new List<Document>();
                List<Attachment> attachOrderList = new List<Attachment>();
                List<Attachment> attachOrderlst = new List<Attachment>();
                List<Order_Document__c> OrderDoc = new List<Order_Document__c>();
                Blob pdfBlob5; 
                
                OrderDoc = [select id,Opportunity__c from Order_Document__c where Opportunity__c =: opp.Id limit 1];
                attachOrderlst = [select id,Name,ParentID from Attachment where ParentID =: OrderDoc[0].id];
                folderOrderRecord = [Select id,Name from Folder where Name =: 'Order Document' limit 1];
                System.debug('===folderOrderRecord=='+folderOrderRecord[0].id);
                
                if(folderOrderRecord != null && !folderOrderRecord.isEmpty()){
                    documnetOrderlst = [select id,Name,Body,FolderId from Document where FolderId =: folderOrderRecord[0].id]; 
                }
                
                if(attachOrderlst != null && !attachOrderlst.isEmpty()){
                    for(Attachment a : attachOrderlst){
                        if(documnetOrderlst != null && !documnetOrderlst.isEmpty() && OrderDoc != null && !OrderDoc.isEmpty()){
                        }
                    }
                    
                }else{
                    if(documnetOrderlst != null && !documnetOrderlst.isEmpty() && OrderDoc != null && !OrderDoc.isEmpty()){
                        for(Document doc : documnetOrderlst){
                            System.debug('===OrderDoc[0].id===='+OrderDoc[0].id);
                            Attachment attach2 = new Attachment();
                            pdfBlob5 = doc.Body;
                            attach2.parentId = OrderDoc[0].id;
                            attach2.Name = doc.Name;
                            attach2.Body = pdfBlob5;
                            attachOrderList.add(attach2);
                        }
                    }
                }
                
                List<Folder>  folderRecord2 = new List<Folder>();
                List<Document> documnetlst2 = new List<Document>();
                list<Legal__c> legaldoc = new list<Legal__c>();
                List<Attachment> legalattachlist = new List<Attachment>();
                List<Attachment> legalattachlst = new List<Attachment>();
                List<Attachment> legallst = new List<Attachment>();
                List<Attachment> legalList = new List<Attachment>();
                Blob pdfBlob3; 
                legaldoc = [select id,Opportunity__c from Legal__c where Opportunity__c =: opp.Id limit 1];
                legalattachlist = [select id,Name,ParentID from Attachment where ParentID =: legaldoc[0].id];
                folderRecord2 = [Select id,Name from Folder where Name =: 'Legal' limit 1];
                
                if(folderRecord2 != null && !folderRecord2.isEmpty()){
                    documnetlst2 = [select id,Name,Body,FolderId from Document where FolderId =: folderRecord2[0].id]; 
                }
                if(legalattachlist != null && !legalattachlist.isEmpty()){
                    for(Attachment a : legalattachlist){
                        if(documnetlst2 != null && !documnetlst2.isEmpty() && legaldoc != null && !legaldoc.isEmpty()){
                        }
                    }
                    
                }else{
                    if(documnetlst2 != null && !documnetlst2.isEmpty() && legaldoc != null && !legaldoc.isEmpty()){
                        for(Document doc : documnetlst2){
                            Attachment attach2 = new Attachment();
                            pdfBlob3 = doc.Body;
                            attach2.parentId = legaldoc[0].id;
                            attach2.Name = doc.Name;
                            attach2.Body = pdfBlob3;
                            legalList.add(attach2);
                        }
                    }
                }
                //  contract 
                list<Contract__c> contractList = new list<Contract__c>();
                List<Attachment> contractattachlist = new List<Attachment>();
                List<Attachment> contractattachlst = new List<Attachment>();
                List<Attachment> contractlst = new List<Attachment>();
                // List<Attachment> contractLegalList = new List<Attachment>();
                Blob pdfBlob6; 
                contractList = [select id,Opportunity__c from Contract__c where Opportunity__c =: opp.Id limit 1];
                contractattachlist = [select id,Name,ParentID from Attachment where ParentID =: contractList[0].id];
                
                if(contractattachlist != null && !contractattachlist.isEmpty()){
                    Boolean pdf = true;
                    Boolean doc = true;
                    for(Attachment a : contractattachlist) {
                        if(a.Name.contains('ContractDoc')) {
                            doc = false;
                            PageReference pdfPage = Page.ContractWord;  
                            Blob pdfBlob;  
                            pdfPage.getParameters().put('Id', opp.Id);
                            if (!Test.isRunningTest()) {  
                                pdfBlob = pdfPage.getContent();  
                            } else { 
                                pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                            }
                            a.contentType = 'application/msWord#msword.doc';
                            a.Body = pdfBlob; 
                            contractlst.add(a);
                        }else if(a.Name.contains('ContractPdf')) {
                            pdf = false;
                            PageReference pdfPage = Page.ContractPdf;  
                            Blob pdfBlob;  
                            pdfPage.getParameters().put('Id', opp.Id);
                            if (!Test.isRunningTest()) {  
                                pdfBlob = pdfPage.getContent();  
                            } else { 
                                pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                            }
                            
                            a.Body = pdfBlob; 
                            contractlst.add(a);
                        }
                        else{
                        }
                        
                    }
                    if(pdf){
                        PageReference pdfPage1 = Page.ContractPdf;  
                        Blob pdfBlob1;  
                        pdfPage1.getParameters().put('Id', opp.Id);
                        if (!Test.isRunningTest()) {  
                            pdfBlob1 = pdfPage1.getContentAsPDF();  
                        } else { 
                            pdfBlob1 = Blob.valueOf('Some Text for a boring PDF file...');
                        }
                        Attachment attach1 = new Attachment(parentId = contractList[0].id, Name = 'ContractPdf.pdf', body = pdfBlob1,contentType = 'application/pdf'); //create the attachment object
                        contractattachlst.add(attach1);   
                    }
                    if(doc){
                        PageReference pdfPage = Page.ContractWord;  
                        Blob pdfBlob;  
                        pdfPage.getParameters().put('Id', opp.Id);
                        if (!Test.isRunningTest()) {  
                            pdfBlob = pdfPage.getContent();  
                        } else { 
                            pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                        }
                        Attachment attach = new Attachment(parentId = contractList[0].id, Name = 'ContractDoc.doc', body = pdfBlob,contentType = 'application/msWord#msword.doc'); //create the attachment object
                        contractattachlst.add(attach); 
                    }
                    
                }else{
                    PageReference pdfPage = Page.ContractWord;  
                    Blob pdfBlob;  
                    pdfPage.getParameters().put('Id',opp.Id);
                    if (!Test.isRunningTest()) {  
                        system.debug('====pdfPage.getContent===='+pdfPage.getContent());
                        pdfBlob = pdfPage.getContent(); 
                        system.debug('====pdfPage.pdfBlob===='+pdfBlob);
                    } else { 
                        pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                    }
                    Attachment attach = new Attachment(parentId = contractList[0].id, Name = 'ContractDoc.doc', body = pdfBlob,contentType = 'application/msWord#msword.doc'); //create the attachment object
                    contractattachlst.add(attach);
                    
                    PageReference pdfPage1 = Page.ContractPdf;  
                    Blob pdfBlob1;  
                    pdfPage1.getParameters().put('Id',opp.Id);
                    if (!Test.isRunningTest()) {  
                        pdfBlob1 = pdfPage1.getContentAsPDF();  
                    } else { 
                        pdfBlob1 = Blob.valueOf('Some Text for a boring PDF file...');
                    }
                    Attachment attach1 = new Attachment(parentId = contractList[0].id, Name = 'ContractPdf.pdf', body = pdfBlob1,contentType = 'application/pdf'); //create the attachment object
                    contractattachlst.add(attach1);
                    
                }
                
                try{
                    insert attachList;
                    insert attachOrderList;
                    insert attachLoaList;
                    insert legalList;
                    insert attList2;
                    insert contractattachlst;
                    update contractlst;
                    
                }
                catch(Exception e){
                }
                
            }else if(opport.Types_of_Product__c == 'Smart Voice'){
                
                List<Folder>  folderRecord = new List<Folder>();
                List<Document> documnetlst = new List<Document>();
                List<Attachment> attachList = new List<Attachment>();
                List<Attachment> attachlst = new List<Attachment>();
                List<Marketing_Document__c> market = new List<Marketing_Document__c>();
                Blob pdfBlob2; 
                
                market = [select id,Opportunity__c from Marketing_Document__c where Opportunity__c =: opp.Id limit 1];
                attachlst = [select id,Name,ParentID from Attachment where ParentID =: market[0].id];
                folderRecord = [Select id,Name from Folder where Name =: 'SVoiceMarketing' limit 1];
                System.debug('===folderRecord=='+folderRecord[0].id);
                
                if(folderRecord != null && !folderRecord.isEmpty()){
                    documnetlst = [select id,Name,Body,FolderId from Document where FolderId =: folderRecord[0].id]; 
                }
                
                if(attachlst != null && !attachlst.isEmpty()){
                    for(Attachment a : attachlst){
                        if(documnetlst != null && !documnetlst.isEmpty() && market != null && !market.isEmpty()){
                            
                        }
                    }
                    
                }else{
                    if(documnetlst != null && !documnetlst.isEmpty() && market != null && !market.isEmpty()){
                        for(Document doc : documnetlst){
                            System.debug('===market[0].id===='+market[0].id);
                            Attachment attach2 = new Attachment();
                            pdfBlob2 = doc.Body;
                            attach2.parentId = market[0].id;
                            attach2.Name = doc.Name;
                            attach2.Body = pdfBlob2;
                            attachList.add(attach2);
                        }
                    }
                }
                
                //  contract 
                list<Contract__c> contractList = new list<Contract__c>();
                List<Attachment> contractattachlist = new List<Attachment>();
                List<Attachment> contractattachlst = new List<Attachment>();
                List<Attachment> contractlst = new List<Attachment>();
                // List<Attachment> contractLegalList = new List<Attachment>();
                Blob pdfBlob6; 
                contractList = [select id,Opportunity__c from Contract__c where Opportunity__c =: opp.Id limit 1];
                contractattachlist = [select id,Name,ParentID from Attachment where ParentID =: contractList[0].id];
                 Boolean pdf1 = true;
                    Boolean pdf2 = true;
                
                if(contractattachlist != null && !contractattachlist.isEmpty()){
                    for(Attachment a : contractattachlist){
                        if(a.Name.contains('SmartVoiceContractPdf')) {
                            pdf1 = false;
                            PageReference pdfPage = Page.smartVoiceContractPdf3;  
                            Blob pdfBlob;  
                            pdfPage.getParameters().put('Id', opp.Id);
                            if (!Test.isRunningTest()) {  
                                pdfBlob = pdfPage.getContent();  
                            } else { 
                                pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                            }
                            a.Body = pdfBlob; 
                            contractlst.add(a);
                            System.debug('smart attch update==='+contractlst);
                        }
                    }
                    if(pdf1){
                        PageReference pdfPageSmart3 = Page.smartVoiceContractPdf3;  
                        Blob pdfBlobOfSmart3;  
                        pdfPageSmart3.getParameters().put('Id', opp.Id);
                        if (!Test.isRunningTest()) {  
                            pdfBlobOfSmart3 = pdfPageSmart3.getContentAsPDF();  
                        } else { 
                            pdfBlobOfSmart3 = Blob.valueOf('Some Text for a boring PDF file...');
                        }
                        Attachment attachSmart3 = new Attachment(parentId = contractList[0].id, Name = 'SmartVoiceContractPdf.pdf', body = pdfBlobOfSmart3,contentType = 'application/pdf'); //create the attachment object
                        contractattachlst.add(attachSmart3);  
                    }
                }
                else{
                    PageReference pdfPageSmart3 = Page.smartVoiceContractPdf3;  
                    Blob pdfBlobOfSmart3;  
                    pdfPageSmart3.getParameters().put('Id', opp.Id);
                    if (!Test.isRunningTest()) {  
                        pdfBlobOfSmart3 = pdfPageSmart3.getContentAsPDF();  
                    } else { 
                        pdfBlobOfSmart3 = Blob.valueOf('Some Text for a boring PDF file...');
                    }
                    Attachment attachSmart3 = new Attachment(parentId = contractList[0].id, Name = 'SmartVoiceContractPdf.pdf', body = pdfBlobOfSmart3,contentType = 'application/pdf'); //create the attachment object
                    contractattachlst.add(attachSmart3); 
                }
                
              /*  if(contractattachlist != null && !contractattachlist.isEmpty()){
                    for(Attachment a : contractattachlist){
                        if(a.Name.contains('FirstSmartVoiceContractPdf')) {
                            pdf1 = false;
                            system.debug('anuj sharma1');
                            PageReference pdfPage = Page.smartVoiceContractPdf;  
                            Blob pdfBlob;  
                            pdfPage.getParameters().put('Id', opp.Id);
                            if (!Test.isRunningTest()) {  
                                pdfBlob = pdfPage.getContent();  
                            } else { 
                                pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                            }
                            
                            a.Body = pdfBlob; 
                            contractlst.add(a);
                        }
                         if(a.Name.contains('SecondSmartVoiceContractPdf')){
                            PageReference pdfPage = Page.smartVoiceContractPdf2; 
                             pdf2 = false;
                            Blob pdfBlob;  
                             system.debug('anuj sharma3');
                            pdfPage.getParameters().put('Id', opp.Id);
                            if (!Test.isRunningTest()) {  
                                pdfBlob = pdfPage.getContent();  
                            } else { 
                                pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
                            }
                            
                            a.Body = pdfBlob; 
                            contractlst.add(a);
                        }
                    }
                        if(pdf1){
                            PageReference pdfPageSmart1 = Page.smartVoiceContractPdf;  
                            Blob pdfBlobOfSmart1; 
                             system.debug('anuj sharma2');
                            pdfPageSmart1.getParameters().put('Id', opp.Id);
                            if (!Test.isRunningTest()) {  
                                pdfBlobOfSmart1 = pdfPageSmart1.getContentAsPDF();  
                            } else { 
                                pdfBlobOfSmart1 = Blob.valueOf('Some Text for a boring PDF file...');
                            }
                            Attachment attachSmart1 = new Attachment(parentId = contractList[0].id, Name = 'FirstSmartVoiceContractPdf.pdf', body = pdfBlobOfSmart1,contentType = 'application/pdf'); //create the attachment object
                            contractattachlst.add(attachSmart1);   
                            
                        }
                         
                        if(pdf2){
                            PageReference pdfPageSmart2 = Page.smartVoiceContractPdf2;  
                            Blob pdfBlobOfSmart2;  
                            system.debug('anuj sharma4');
                            pdfPageSmart2.getParameters().put('Id', opp.Id);
                            if (!Test.isRunningTest()) {  
                                pdfBlobOfSmart2 = pdfPageSmart2.getContentAsPDF();  
                            } else { 
                                pdfBlobOfSmart2 = Blob.valueOf('Some Text for a boring PDF file...');
                            }
                            Attachment attachSmart2 = new Attachment(parentId = contractList[0].id, Name = 'SecondSmartVoiceContractPdf.pdf', body = pdfBlobOfSmart2,contentType = 'application/pdf'); //create the attachment object
                            contractattachlst.add(attachSmart2);   
                            
                        }
                    
                    
                }
                else{
                   /* PageReference pdfPageSmart1 = Page.smartVoiceContractPdf;  
                    Blob pdfBlobOfSmart1;  
                    pdfPageSmart1.getParameters().put('Id', opp.Id);
                    if (!Test.isRunningTest()) {  
                        pdfBlobOfSmart1 = pdfPageSmart1.getContentAsPDF();  
                    } else { 
                        pdfBlobOfSmart1 = Blob.valueOf('Some Text for a boring PDF file...');
                    }
                    Attachment attachSmart1 = new Attachment(parentId = contractList[0].id, Name = 'FirstSmartVoiceContractPdf.pdf', body = pdfBlobOfSmart1,contentType = 'application/pdf'); //create the attachment object
                    contractattachlst.add(attachSmart1);   
                    
                    PageReference pdfPageSmart2 = Page.smartVoiceContractPdf2;  
                    Blob pdfBlobOfSmart2;  
                    pdfPageSmart2.getParameters().put('Id', opp.Id);
                    if (!Test.isRunningTest()) {  
                        pdfBlobOfSmart2 = pdfPageSmart2.getContentAsPDF();  
                    } else { 
                        pdfBlobOfSmart2 = Blob.valueOf('Some Text for a boring PDF file...');
                    }
                    Attachment attachSmart2 = new Attachment(parentId = contractList[0].id, Name = 'SecondSmartVoiceContractPdf.pdf', body = pdfBlobOfSmart2,contentType = 'application/pdf'); //create the attachment object
                    contractattachlst.add(attachSmart2);   
                    */
                   /*   PageReference pdfPageSmart3 = Page.smartVoiceContractPdf3;  
                    Blob pdfBlobOfSmart3;  
                    pdfPageSmart3.getParameters().put('Id', opp.Id);
                    if (!Test.isRunningTest()) {  
                        pdfBlobOfSmart3 = pdfPageSmart3.getContentAsPDF();  
                    } else { 
                        pdfBlobOfSmart3 = Blob.valueOf('Some Text for a boring PDF file...');
                    }
                    Attachment attachSmart3 = new Attachment(parentId = contractList[0].id, Name = 'ThirdSmartVoiceContractPdf.pdf', body = pdfBlobOfSmart3,contentType = 'application/pdf'); //create the attachment object
                    contractattachlst.add(attachSmart3);   
                }
                */
                
                
                try{
                    insert attachList;
                    insert contractattachlst;
                    update contractlst;
                    System.debug('==after update=='+contractlst);
                }catch(Exception e){}
            }
            else if(opport.Types_of_Product__c == 'Flex'){
                
            }
        }
        
        PageReference pageWhereWeWantToGo = new ApexPages.StandardController(opp).view();  
        pageWhereWeWantToGo.setRedirect(true);  
        return pageWhereWeWantToGo;  
    }
    
    
}