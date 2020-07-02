package Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DetailDAO {
	
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

	public void insertDetail(DetailBean bean) {
		String sql = "";
		int pronum =0;
		try {
			con = getConnection();

			sql = "select max(pronum) from details"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pronum =  rs.getInt("max(pronum)") + 1;		 
			}else {		
				pronum = 1; 
			}
			
			sql ="insert into details(pronum,num,place,seat,reserved,"
					+ "date,time) "
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pronum);
			pstmt.setInt(2, bean.getNum());
			pstmt.setString(3, bean.getPlace());
			pstmt.setInt(4, bean.getSeat());
			pstmt.setInt(5, bean.getReserved());
			pstmt.setDate(6, bean.getDate());
			pstmt.setString(7, bean.getTime());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertDetail메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
	}

	public void delete(int num) {
		String sql="";

		try {
			con = getConnection();

			sql = "delete from details where num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}

	public List<DetailBean> getdetail(int num) {
		String sql="";
		List<DetailBean> detail = new ArrayList<DetailBean>();

		try {
			con = getConnection();

			sql = "select * from details where num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				DetailBean bean = new DetailBean();
				bean.setPronum(rs.getInt("pronum"));
				bean.setNum(rs.getInt("num"));
				bean.setPlace(rs.getString("place"));
				bean.setTime(rs.getString("time"));
				bean.setSeat(rs.getInt("seat"));
				bean.setReserved(rs.getInt("reserved"));
				bean.setDate(rs.getDate("date"));
				detail.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getdetail메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		return detail;
	}
	
	public DetailBean getdetails(int detail) {
		DetailBean bean = new DetailBean();
		String sql="";
		
		try {
			con = getConnection();

			sql = "select * from details where pronum=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, detail);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				bean.setPronum(rs.getInt("pronum"));
				bean.setNum(rs.getInt("num"));
				bean.setPlace(rs.getString("place"));
				bean.setTime(rs.getString("time"));
				bean.setSeat(rs.getInt("seat"));
				bean.setReserved(rs.getInt("reserved"));
				bean.setDate(rs.getDate("date"));
			}
		} catch (Exception e) {
			System.out.println("details메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
		
		return bean;
	}

	public void UpdateSeat(int num, int sub) {
		String sql = "";
		
		try {
			con = getConnection();

			sql = "update details set reserved=? where pronum=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sub);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("UpdateSeat메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
		
	}
}
