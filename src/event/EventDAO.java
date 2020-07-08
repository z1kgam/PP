package event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class EventDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/pp");
		Connection con = ds.getConnection();
		ResultSet rs = null;
		return con;
		
	}
	
	
	
	
	
}
