package bank;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.Timestamp;
import java.util.Date;
public class transactiondao {
	public static void createtransaction(Transaction transaction)throws SQLException{
		Connection con =Db.connect();
		Date date = new Date();
		Timestamp timestamp =new Timestamp(date.getTime()) ;
		 
		String query="INSERT into transactions(t_id,accn,transactiontype,amount,date,balance) values (?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString( 1,transaction.gettid());
		ps.setInt(2,transaction.getAccn());
		ps.setString( 3,transaction.getttype());
		ps.setInt( 4,transaction.getAmount());
		ps.setTimestamp( 5,timestamp);
		ps.setInt( 6,transaction.getbal());
		ps.executeUpdate();
		ps.close();
	}
}
