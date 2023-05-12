global class Iterable_sObject implements Iterator<Schema.SObjectType>{
	List<Schema.SObjectType> sObjects {get;set;} 
	Integer i {get;set;}
	String ExecutionType {get;set;}
	
	public Iterable_sObject(String Execution_Type){ 		
		sObjects = new List<Schema.SObjectType>();
		for(Schema.SObjectType SOT : Schema.getGlobalDescribe().values()){
			sObjects.add(SOT);
		}
		ExecutionType = Execution_Type;
		i = 0;
	}
	
	global boolean hasNext(){
		if(ExecutionType == 'Processing'){ 
			if(i >= sObjects.size()){
				return false; 
			}else{
				return true; 
			}
		}else if(ExecutionType == 'Testing'){ 
			if(i >= 1){
				return false; 
			}else{
				return true; 
			}
		}else{
			return false;
		}			
	}    

	global Schema.SObjectType next(){  
		i++; 
		return sObjects[i-1]; 
	}
	 
}