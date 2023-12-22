package bank;

import java.util.Random;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter; 

public class Transaction {
	public static final int DEBIT = 0;
    public static final int CREDIT = 1;
    public static String[] types = { "Debit", "Credit"};
	rando random=new rando();
	//public java.util.Date date = new java.util.Date();
    // Transaction types:
	public int transactionType;
    public String t_id=random.getAlphaNumericString(10);
    
    public int balance=0;
    // Constructor:
    public Transaction(Acc account, int transactionType, int amount,int balance) {
    	this.accn=account.getAccountNumber();
        this.transactionType = transactionType;
        this.amount = amount;
        this.balance=balance;
    }

    public int getAccn() {
        return accn;
    }
    public int getbal() {
    	return balance;
    }

    public int getTransactionType() {
        return transactionType;
    }
    public String getttype() {
    	String a=null;
    	if(transactionType==1) {
    		a="CREDIT";
    	}
    	else {
    		a="DEBIT";
    	}
    	return a;
    }

    public int getAmount() {
        return amount;
    }
    public String gettid() {
    	return t_id;
    }
    /*public java.util.Date gettime(){
    	return date;
    }*/

    /*public String toString() {
        return types[transactionType] + " A//C: " + ": $" + amount;
    }*/

    private int accn;
    private int amount;
}
