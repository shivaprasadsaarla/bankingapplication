package bank;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class loandao {
	public static void createloan(Loan loan)throws SQLException{
		Connection con =Db.connect();
		Date date = new Date();
		Timestamp timestamp =new Timestamp(date.getTime()) ; 
		String query="INSERT into Loans(L_id,accn,Loantype,amount,date,balance) values (?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString( 1,loan.getLid());
		ps.setInt(2,loan.getAccn());
		ps.setString( 3,loan.getLoanType());
		ps.setInt( 4,loan.getAmount());
		ps.setTimestamp( 5,timestamp);
		ps.setInt( 6,loan.getbal());
		ps.executeUpdate();
		ps.close();
	}
	public static void creditloan(int accn,int amt)throws SQLException{
		Connection con =Db.connect();
		String query="UPDATE accounts set balance=balance + ? where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		//ps.setInt(1,account.getBalance());
		ps.setInt(1,amt);
		ps.setInt(2, accn);
		ps.executeUpdate();
		ps.close();
	}

	public static void incrementnoofCredits(int accn)throws SQLException
	{
		Connection con =Db.connect();
		String query="UPDATE accounts set no_of_credits=no_of_credits+1 where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		//ps.setInt(1,account.getBalance());
		ps.setInt(1,accn);
		ps.executeUpdate();
		ps.close();
		
	}
	
	public static void incrementCreditamount(int accn,int amt)throws SQLException
	{	
		Connection con =Db.connect();
		String query="UPDATE accounts set t_c_amt=t_c_amt+? where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1,amt);
		ps.setInt(2,accn);
		ps.executeUpdate();
		ps.close();
	}
	
	
}