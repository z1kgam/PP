package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LikeDAO {
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
	
	// 사용자와 게시글
	public int getTotal(int n_num, String id) {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		try {
			con=getConnection();
			sql="SELECT count(*) FROM likeboard WHERE n_num = ? and id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			pstmt.setString(2, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTotal Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return count;
	}//getTotal END
	
	
	public List<LikeBean> getLikeList(String id, int pageFirst, int pageSize){
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		List<LikeBean> likeList = new ArrayList<LikeBean>();
		
		try {
			con = getConnection();
			sql = "SELECT * FROM likeboard WHERE id = ? ORDER BY likenum limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				LikeBean likeBean = new LikeBean();
				likeBean.setId(rs.getString("id"));
				likeBean.setN_num(rs.getInt("n_num"));
				likeBean.setLikenum(rs.getInt("likenum"));
				likeList.add(likeBean);
				
			}
		} catch (Exception e) {
			System.out.println("getLikeList inner err :" +e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return likeList;
	}
	
	//찜하기
	public void addLike(int n_num, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		try {
			con=getConnection();
			sql="INSERT INTO likeboard(n_num, id) VALUES (?, ?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, n_num);			
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("addLike Inerr Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	} // addLike END
	
	//좋아요 판별
	public boolean checkLike(int n_num, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		boolean result= false;	
		try {
			con=getConnection();
			sql="SELECT * FROM likeboard where n_num = ? and id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()) result = true;
		} catch (Exception e) {
		
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return result;
	} // checkLike END
	
	//이미 좋아요 된상태(true)라면 ? 좋아요를 삭제함
	public void delLike(int n_num, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		try {
			con = getConnection();
			sql = "DELETE FROM likeboard WHERE n_num = ? and id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delLike Inner Err : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	} // delLike END
	
	
	//해당 게시글의 총 좋아요 개수
	public int getProductTotalLike(int n_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		String sql = "";
		int likeCount = 0;
		try {
			con=getConnection();
			sql = "SELECT count(*) FROM likeboard where n_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				likeCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getProductTotalLike Inner Err : " + e);
		} finally {
				try {
					if(con!=null)con.close();
					if(pstmt!=null)pstmt.close();
					if(rs!=null)rs.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		return likeCount;		
	} // getProductTotalLike END
}
