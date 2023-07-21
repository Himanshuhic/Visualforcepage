public with sharing class newwrp {
	 // Declaration of list to store data from Account and Opportunity objects
	List<Account> acclst = new List<Account>();
	List<Opportunity> oppolst = new List<Opportunity>();

	// List to hold the wrapper objects
   public List<wrapper> wrplst = new List<wrapper>();

    // Method to fetch data from Account and Opportunity objects and return a list of wrapper objects
	public List<wrapper> getLstwrapperIntString() {
		try {
			// Query to retrieve the first 10 Account records and store them in 'acclst'
		acclst = [select Name,Phone from Account LIMIT 10];
		// Query to retrieve the first 10 Account records and store them in 'oppolst'
		oppolst = [select CreatedById,Name from Opportunity LIMIT 10];
		
		 // Loop through the Opportunity records to create wrapper objects and add them to 'wrplst'
		for(Integer i=0;i<oppolst.size();i++){
			wrplst.add(new wrapper(acclst[i].Name,acclst[i].Phone,oppolst[i].CreatedById,oppolst[i].Name));
		}

		}
		catch(Exception e) {
			System.debug('An Error Occured:' + e);
		}
		
		// Return the list of wrapper objects
		return wrplst;
	}

	// Inner wrapper class to combine data from Account and Opportunity
	public class wrapper{

		// Properties to hold the data from both objects
		public String accname{get;set;}
		public String accphone{get;set;}
		public String oppcreated{get;set;}
		public String oppname{get;set;}

		// Constructor to set the values when creating a new wrapper object
		public wrapper(String accname,String accphone,String oppcreated,String oppname){
			this.accname=accname;
			this.accphone=accphone;
			this.oppcreated=oppcreated;
			this.oppname=oppname;
		}

	}

}
