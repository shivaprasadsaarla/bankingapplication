package bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class accountdao{
	public static int createaccount(Acc account)throws SQLException{
		Connection con =Db.connect();
		String query="INSERT into accounts(username,accn,password,gender,aadharnumber,balance,address,phonenumber,email, no_of_debits , no_of_credits , t_d_amt , t_c_amt) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString( 1,account.getusername());
		ps.setInt(2,account.getAccountNumber());
		ps.setString( 3,account.getpassword());
		ps.setString( 4,account.getgender());
		ps.setString( 5,account.getaadharnumber());
		ps.setInt( 6,account.getBalance());
		ps.setString( 7,account.getaddress());
		ps.setString( 8,account.getphonenumber());
		ps.setString( 9,account.getemail());
		ps.setInt(10,account.getnumberofDebits());
		ps.setInt(11,account.getnumberofCredits());
		ps.setInt(12,account.gettotalDebits());
		ps.setInt(13,account.gettotalCredits());
		
		int c = ps.executeUpdate();
		return c;
	}
	public static void creditacc(int accn,int amt)throws SQLException{
		Connection con =Db.connect();
		String query="UPDATE accounts set balance=balance + ? where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		//ps.setInt(1,account.getBalance());
		ps.setInt(1,amt);
		ps.setInt(2, accn);
		ps.executeUpdate();
		ps.close();
	}
	public static void debitacc(int accn,int amt)throws SQLException{
		Connection con =Db.connect();
		String query="UPDATE accounts set balance= balance - ? where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		//ps.setInt(1,account.getBalance());
		ps.setInt(1,amt);
		ps.setInt(2,accn);
		ps.executeUpdate();
		ps.close();
	}
	public static int readaccbal(int accn)throws SQLException{
		int b=0;
		try {
			
		Connection con =Db.connect();
		String query="select balance from accounts where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1,accn);
		ResultSet rs = ps.executeQuery();
		
        if (rs.next()) {
            b = rs.getInt("balance");
        }
        rs.close();
        ps.close();
        con.close();
		}
		catch (SQLException e) {
            e.printStackTrace();
        }
		return b;
		
	}
	
	public static void incrementnoofDebits(int accn)throws SQLException
	{
		Connection con =Db.connect();
		String query="UPDATE accounts set no_of_debits=no_of_debits+1 where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		//ps.setInt(1,account.getBalance());
		ps.setInt(1,accn);
		ps.executeUpdate();
		ps.close();
		
		
	}
	public static void incrementDebitamount(int accn,int amt)throws SQLException
	{	
		Connection con =Db.connect();
		String query="UPDATE accounts set t_d_amt=t_d_amt+? where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1,amt);
		ps.setInt(2,accn);
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
	public static int readtdamt(int accn)throws SQLException{
		int b=0;
		try {
			
		Connection con =Db.connect();
		String query="select t_d_amt from accounts where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1,accn);
		ResultSet rs = ps.executeQuery();
		
        if (rs.next()) {
            b = rs.getInt("t_d_amt");
        }
        rs.close();
        ps.close();
        con.close();
		}
		catch (SQLException e) {
            e.printStackTrace();
        }
		return b;
		
	}
	public static int readtcamt(int accn)throws SQLException{
		int b=0;
		try {
			
		Connection con =Db.connect();
		String query="select t_c_amt from accounts where accn=? ";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1,accn);
		ResultSet rs = ps.executeQuery();
		
        if (rs.next()) {
            b = rs.getInt("t_c_amt");
        }
        rs.close();
        ps.close();
        con.close();
		}
		catch (SQLException e) {
            e.printStackTrace();
        }
		return b;
		
	}
}