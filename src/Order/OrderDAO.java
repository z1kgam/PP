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

			sql = "select max(num) from productorder"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num =  rs.getInt("max(num)") + 1;		 
			}else {		
				num = 1; 
			}
			
			sql ="insert into productorder(num,detailnum,name,genre,cla,runtime,price,startdate,enddate,image,content,"
					+ "place,seat,totalreserved,today,starttime,id,reserved,totalprice,orderdate)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, vo.getDetailnum());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGenre());
			pstmt.setString(5, vo.getCla());
			pstmt.setInt(6, vo.getRuntime());
			pstmt.setInt(7, vo.getPrice());
			pstmt.setDate(8, vo.getStartdate());
			pstmt.setDate(9, vo.getEnddate());
			pstmt.setString(10, vo.getImage());
			pstmt.setString(11, vo.getContent());
			pstmt.setString(12, vo.getPlace());
			pstmt.setInt(13, vo.getSeat());
			pstmt.setInt(14, vo.getTotalreserved());
			pstmt.setDate(15, vo.getToday());
			pstmt.setString(16, vo.getStarttime());
			pstmt.setString(17, vo.getId());
			pstmt.setInt(18, vo.getReserved());
			pstmt.setInt(19, vo.getTotalprice());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertOrder메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}
}
