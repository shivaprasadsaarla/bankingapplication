package bank;

//*********
//Clerk.java
//*********
import java.util.*;
public class clerk extends Thread
//implements Runnable {
{  Bank theBank;
  // The in-tray holding transactions:
  private List<Transaction> inTray = Collections.synchronizedList(new LinkedList<Transaction>());
	private List<Loan> intray = Collections.synchronizedList(new LinkedList<Loan>());
  private int maxTransactions = 8; // Maximum transactions in the in-tray.
	private int maxloan=2;          //maximum loans
  // Constructor
  public clerk(Bank theBank) {
      this.theBank = theBank; // Who the clerk works for.
  }

  // Receive a transaction:
  synchronized public void doTransaction(Transaction transaction) {
      while (inTray.size() >= maxTransactions) {
          try {
              wait();
          } catch (InterruptedException e) {
              System.out.println(e);
          }
      }
      inTray.add(transaction);
      notifyAll();
  }
	synchronized public void dotransaction(Loan loan) {
      while (intray.size() >= maxloan) {
          try {
              wait();
          } catch (InterruptedException e) {
              System.out.println(e);
          }
      }
      intray.add(loan);
      notifyAll();
  }
  // The working clerk:
  synchronized public void run() {
      while (true) {
          while (inTray.size() == 0 && intray.size()==0) { // No transaction waiting?
              try {
                  wait(); // Then take a break until there is.
              } catch (InterruptedException e) {
                  System.out.println(e);
              }
          }
			if(inTray.size() !=0) {           
			theBank.doTransaction(inTray.remove(0));
			}
			if(intray.size() !=0) {  
			theBank.doloan(intray.remove(0));
			}
          notifyAll(); // Notify other threads locked on this clerk.
      }
  } 
 

  // Busy check:
  synchronized public void isBusy() {
      while (inTray.size() != 0 && intray.size() !=0) { // Is this object busy?
          try {
              wait(); // Yes, so wait for notify call.
          } catch (InterruptedException e) {
              System.out.println(e);
          }
      }
      return; // It is free now.
  }
}
