package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BasketDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	//DB연결
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/pp");
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	//장바구니 검색
	ArrayList<BasketBean> basketList(String id){
		ArrayList<BasketBean> baskets = new ArrayList<BasketBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "SELECT * FROM basket WHERE id = ? and validity = 1";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int basketnum = rs.getInt(1);
				id = rs.getString(2);
				int num = rs.getInt(3);
				int numbers = rs.getInt(4);
				int validity = rs.getInt(5);
				baskets.add(new BasketBean(basketnum, id, num, numbers, validity));
			}
			
		} catch (Exception e) {
			System.out.println("basketList Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return baskets;
	} // basketList END
	
	public void basketAdd(String id, int num, int numbers) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con=getConnection();
			sql = "SELECT COUNT(basketnum) FROM basket";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ID = -1;
			rs.next();
			ID = rs.getInt("count(basketnum)");
			ID++;
			
			sql = "INSERT INTO basket values(?,?,?,?,1)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ID);
			pstmt.setString(2, id);
			pstmt.setInt(3, num);
			pstmt.setInt(4, numbers);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("basketAdd Inerr Err : " + e);
		}finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	} // basketAdd END
	
	//장바구니 삭제
	public void basketDel(String id, int basketnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		try {
			con = getConnection();
			sql = "UPDATE basket SET validity = 2 WHERE id = ? and basketnum = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, basketnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("basketDel Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	} // basketDel END
	
	//장바구니 비우기
	public void basketClean(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		try {
			con = getConnection();
			sql = "UPDATE basket SET validity = 2 WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("basketClean Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}
	
}
