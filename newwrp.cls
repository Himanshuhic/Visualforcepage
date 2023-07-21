public with sharing class newwrp {
	List<Account> acclst = new List<Account>();
	List<Opportunity> oppolst = new List<Opportunity>();
   public List<wrapper> wrplst = new List<wrapper>();
	public List<wrapper> getLstwrapperIntString() {
		acclst = [select Name,Phone from Account];
		oppolst = [select CreatedById,Name from Opportunity];
		
		for(Integer i=0;i<oppolst.size();i++){
			wrplst.add(new wrapper(acclst[i].Name,acclst[i].Phone,oppolst[i].CreatedById,oppolst[i].Name));
		}

		return wrplst;
	}

	public class wrapper{

		public String Accname{get;set;}
		public String Accphone{get;set;}
		public String Oppcreated{get;set;}
		public String Oppname{get;set;}
		public wrapper(String Accname,String Accphone,String Oppcreated,String Oppname){
			this.Accname=Accname;
			this.Accphone=Accphone;
			this.Oppcreated=Oppcreated;
			this.Oppname=Oppname;
		}

	}

}