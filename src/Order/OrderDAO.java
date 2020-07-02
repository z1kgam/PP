package Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private Connection getConnection() throws Exception{		
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/pp");
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public void resource() {
		if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
		if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
		if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}		
	}

	public void insertOrder(OrderVO vo) {
		String sql = "";
		int num =0;
		try {
			con = getConnection();

			sql = "select max(num) from prord"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num =  rs.getInt("max(num)") + 1;		 
			}else {		
				num = 1; 
			}
			
			sql ="insert into prord(num,detailnum,id,reserved,total,"
					+ "orderdate) "
					+ "values(?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, vo.getDetailnum());
			pstmt.setString(3, vo.getId());
			pstmt.setInt(4, vo.getReserved());
			pstmt.setInt(5, vo.getTotal());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertDetail메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}
}
