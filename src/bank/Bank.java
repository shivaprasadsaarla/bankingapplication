package bank;

//***
//Bank.java
//***
public class Bank {
  // Perform a transaction:
  public void doTransaction(Transaction transaction){
      switch (transaction.getTransactionType()) {
          case Transaction.CREDIT:
                  //System.out.println(
                    //      "Start credit of " + transaction.getAccn() + " amount: " + transaction.getAmount());
                  // Get current balance:
                  //int balance = transaction.getAccn().getBalance();
                  // Credits require require a lot of checks:
                  /*try {
                      Thread.sleep(10);
                      // wait() time reduced to speed things up.
                  } catch (InterruptedException e) {
                      System.out.println(e);
                  }*/
                  try {
                  accountdao.creditacc(transaction.getAccn(),transaction.getAmount());
                  accountdao.incrementnoofCredits(transaction.getAccn());
                  accountdao.incrementCreditamount(transaction.getAccn(),transaction.getAmount());
                  
                  }
                  catch(Exception e){
                	  e.printStackTrace();
                  }
                  // Increment the balance.
                  //transaction.getAccount().setBalance(balance); // Restore account balance.
                  break;
              
          case Transaction.DEBIT:
               
                  //System.out.println(
                  //        "Start debit of " + transaction.getAccn() + " amount: " + transaction.getAmount());
                  // Get current balance
                  //int balance = transaction.getAccn().getBalance();
                  // Debits require even more checks...
                  /*try {
                      Thread.sleep(15); // wait()time reduced to speed things up.
                  } catch (InterruptedException e) {
                      System.out.println(e);
                  }*/
                  try {
                  accountdao.debitacc(transaction.getAccn(),transaction.getAmount());
                  accountdao.incrementnoofDebits(transaction.getAccn());
                  accountdao.incrementDebitamount(transaction.getAccn(),transaction.getAmount());
                  }
                  catch(Exception e){
                	  e.printStackTrace();
                  }
                  // Increment the balance.
                  //transaction.getAccount().setBalance(balance); // Restore account balance.
                  break;
				
          /*default: // We should never get here.
              System.out.println("Invalid transaction");
              System.exit(1);*/
      }
  }
public void doloan(Loan loan) {
		/*try {
            Thread.sleep(10);
            // wait() time reduced to speed things up.
        } catch (InterruptedException e) {
            System.out.println(e);
        }*/
        try { 
        loandao.creditloan(loan.getAccn(),loan.getAmount());
        loandao.incrementnoofCredits(loan.getAccn());
        loandao.incrementCreditamount(loan.getAccn(),loan.getAmount());
        

        }
        catch(Exception e){
      	  e.printStackTrace();
        }
      /*switch (loan.getLoanType()) {
          case Loan.TwoWheelerLoan:
              
                  //System.out.println(
                          //"Start loan of " + loan.getAccount() + " amount: " + loan.getAmount());
                  // Get current balance:
                  //int balance = loan.getAccount().getBalance();
                  // Credits require require a lot of checks:
                  try {
                      Thread.sleep(10);
                      // wait() time reduced to speed things up.
                  } catch (InterruptedException e) {
                      System.out.println(e);
                  }
                  try {
                  accountdao.creditacc(Loan.getAccn(),Loan.getAmount());
                  }
                  catch(Exception e){
                	  e.printStackTrace();
                  }
                  //balance += loan.getAmount();
                  // Increment the balance.
                  //loan.getAccount().setBalance(balance); // Restore account balance.
                  break;
              
          case Loan.FourWheelerLoan:
              synchronized (loan.getAccount()) {
                  System.out.println(
                          "Start loan of " + loan.getAccount() + " amount: " + loan.getAmount());
                  // Get current balance:
                  int balance = loan.getAccount().getBalance();
                  // Credits require require a lot of checks:
                  try {
                      Thread.sleep(10);
                      // wait() time reduced to speed things up.
                  } catch (InterruptedException e) {
                      System.out.println(e);
                  }
                  balance += loan.getAmount();
                  // Increment the balance.
                  loan.getAccount().setBalance(balance); // Restore account balance.
                  break;
              }
			case Loan.PersonalLoan:
              synchronized (loan.getAccount()) {
                  System.out.println(
                          "Start loan of " + loan.getAccount() + " amount: " + loan.getAmount());
                  // Get current balance:
                  int balance = loan.getAccount().getBalance();
                  // Credits require require a lot of checks:
                  try {
                      Thread.sleep(10);
                      // wait() time reduced to speed things up.
                  } catch (InterruptedException e) {
                      System.out.println(e);
                  }
                  balance += loan.getAmount();
                  // Increment the balance.
                  loan.getAccount().setBalance(balance); // Restore account balance.
                  break;
              }
			case Loan.EducationLoan:
              synchronized (loan.getAccount()) {
                  System.out.println(
                          "Start loan of " + loan.getAccount() + " amount: " + loan.getAmount());
                  // Get current balance:
                  int balance = loan.getAccount().getBalance();
                  // Credits require require a lot of checks:
                  try {
                      Thread.sleep(10);
                      // wait() time reduced to speed things up.
                  } catch (InterruptedException e) {
                      System.out.println(e);
                  }
                  balance += loan.getAmount();
                  // Increment the balance.
                  loan.getAccount().setBalance(balance); // Restore account balance.
                  break;
              }
			case Loan.Homeloan:
              synchronized (loan.getAccount()) {
                  System.out.println(
                          "Start loan of " + loan.getAccount() + " amount: " + loan.getAmount());
                  // Get current balance:
                  int balance = loan.getAccount().getBalance();
                  // Credits require require a lot of checks:
                  try {
                      Thread.sleep(10);
                      // wait() time reduced to speed things up.
                  } catch (InterruptedException e) {
                      System.out.println(e);
                  }
                  balance += loan.getAmount();
                  // Increment the balance.
                  loan.getAccount().setBalance(balance); // Restore account balance.
                  break;
              }
          default: // We should never get here.
              System.out.println("Invalid transaction");
              System.exit(1);
      }*/
  }
}