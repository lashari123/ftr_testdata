global class Iterator_sObject implements iterable<Schema.SObjectType>{
	
	global string ExecutionType;
	
	global Iterator_sObject(String Execution_Type){
		ExecutionType = Execution_Type;
	}
   
   global Iterator<Schema.SObjectType> Iterator(){
   	return new Iterable_sObject(ExecutionType);
   }
}