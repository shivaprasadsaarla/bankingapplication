package bank;

import java.util.Random;

public class Acc {
		Random random=new Random();
		public String username;
		int accn = random.nextInt(1000000);
		public String password;
		public String gender;
		public String address;
		public String aadharnumber;
		public String email;
		public String phonenumber;
		public int no_of_debits=0;
		public int no_of_credits=0;
		public int t_d_amt=0;
		public int t_c_amt=0;
		//public String dob;
		public int bal=5000;
	    public Acc(String username, String password,String gender,String address,String aadharnumber,String phonenumber,String email){
	    	this.username=username;
	    	this.aadharnumber=aadharnumber;
	    	this.password=password;
	    	this.gender=gender;
	    	this.address=address;
	    	this.phonenumber=phonenumber;
	    	//this.dob=dob;
	    	this.email=email;
	   }
	    public Acc(int accn,String username, String password,String gender,String address,String aadharnumber,String phonenumber,String email){
	    	this.username=username;
	    	this.aadharnumber=aadharnumber;
	    	this.password=password;
	    	this.gender=gender;
	    	this.address=address;
	    	this.phonenumber=phonenumber;
	    	//this.dob=dob;
	    	this.email=email;
	    	this.accn=accn;
	   }
	   public String getusername() {
		   return username;
	   }
	   public String getaadharnumber() {
		   return aadharnumber;
	   }
	   public String getpassword() {
		   return password;
	   }
	   public String getphonenumber() {
		   return phonenumber;
	   }
	   public String getaddress() {
		   return address;
	   }
	   //public String getdob() {
		  // return dob;
	   //}
	   public String getemail() {
		   return email;
	   }
	   public String getgender() {
		   return gender;
	   }

	    // Return the current balance:
	    public int getBalance() {
	        return bal;

	    }
	    public int gettotalDebits() {
	        return t_d_amt;

	    }
	    public int gettotalCredits() {
	        return t_c_amt;

	    }
	    public int getnumberofCredits() {
	        return no_of_credits;

	    }
	    public int getnumberofDebits() {
	        return no_of_debits;

	    }


	    // Set the current balance:
	    public void setBalance(int balance) {
	        this.bal = balance;
	    }

	    public int getAccountNumber() {
	        return accn;
	    }

	    public String toString() {
	        return "A//C No. " + accn + " : $" + bal;
	    }
}