package bank;

public class Loan {
    // Loan types:
	public static final int TwoWheeler= 0;
    public static final int FourWheeler=1;
	public static final int Personal=2;
	public static final int Education=3;
	public static final int Home=4;
    public static String[] types = {"TwoWheeler", "Fourwheeler","Personal","Education","Home"};
    public int balance=0;
	rando random=new rando();
	//public java.util.Date date = new java.util.Date();
    // Transaction types:
	public String LoanType;
    public String L_id=random.getAlphaNumericString(15);
        // Constructor:
    public Loan(Acc account,String loanType, int amount,int balance) {
        this.accn = account.getAccountNumber();
        this.LoanType = loanType;
        this.amount = amount;
        this.balance=balance;
    }

    public  int  getAccn() {
        return accn;
    }
    public int getbal() {
    	return balance;
    }


    public String getLoanType() {
        return LoanType;
    }
    /*public String getLtype() {
    	String a=null;
    	if(LoanType==0) {
    		a="TwoWheeler";
    	}
    	if(LoanType==1) {
    		a="FourWheeler";
    	}
    	if(LoanType==2) {
    		a="Personal";
    	}
    	if(LoanType==3) {
    		a="Education";
    	}
    	if(LoanType==4){
    		a="Home";
    	}
    	return a;
    }*/
    
    public int getAmount() {
        return amount;
    }
    public String getLid() {
    	return L_id;
    }

    /*public String toString() {
        return types[loanType] + " A//C: " + ": $" + amount;
    }*/

    private  int  accn;
    private  int amount;
}