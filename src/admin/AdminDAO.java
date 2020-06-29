package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//DB연결
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/pp");
		Connection con = ds.getConnection();
		ResultSet rs = null;
		return con;
		
	}
	
	//전체 회원 조회 메소드
	public List<AdminBean> getAllmember(int startRow, int endRow) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DataSource ds=null;
		String sql = "";
		List<AdminBean> memberlist = new ArrayList<AdminBean>();
		try {
			// 디비 이름순으로 뽑아올수있으려나 ?
			//1,2 디비연결 후 커넥션을 얻어옵니다.
			con=getConnection();
			sql = "select * from users order by reg_date desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				AdminBean aBean = new AdminBean();
				aBean.setId(rs.getString("id"));
				aBean.setPassword(rs.getString("password"));
				aBean.setName(rs.getString("name"));
				aBean.setEmail(rs.getString("email"));
				aBean.setStatus(rs.getInt("status"));
				aBean.setIs_admin(rs.getInt("is_admin"));
				aBean.setZipcode(rs.getString("zipcode"));
				aBean.setAddress1(rs.getString("address1"));
				aBean.setAddress2(rs.getString("address2"));
				aBean.setPhone(rs.getString("phone"));
				aBean.setPoint(rs.getInt("point"));
				aBean.setReg_date(rs.getTimestamp("reg_date"));
				
				memberlist.add(aBean);
			}
			
		} catch (Exception e) {
			System.out.println("getAllmember 메소드 내부에서 오류 :" + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
			return memberlist; //전체 회원정보 memberlist 리턴
	}
	
	//회원 수 조회 메소드
	public int AllMemberCount() {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DataSource ds=null;
		String sql = "";
		int count = 0;
		
		try {
			con=getConnection();
			sql = "select * from users ";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				count++;
			}
		} catch (Exception e) {
			System.out.println("AllMemberCount 메소드 내부에서 오류 : " + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
			return count;
	}
	
	public void MemberDelete(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "delete from users where id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemberDelter 메소드 내부에서 오류 :" + e);
		} finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}

	public AdminBean MemberView(String id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select * from users where ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);		
			rs=pstmt.executeQuery();
			
			AdminBean aBean2 = new AdminBean();
			
			if(rs.next()) {
			aBean2.setId(rs.getString("id"));
			aBean2.setPassword(rs.getString("password"));
			aBean2.setName(rs.getString("name"));
			aBean2.setEmail(rs.getString("email"));
			aBean2.setStatus(rs.getInt("status"));
			aBean2.setIs_admin(rs.getInt("is_admin"));
			aBean2.setZipcode(rs.getString("zipcode"));
			aBean2.setAddress1(rs.getString("address1"));
			aBean2.setAddress2(rs.getString("address2"));
			aBean2.setPhone(rs.getString("phone"));
			aBean2.setPoint(rs.getInt("point"));
			aBean2.setReg_date(rs.getTimestamp("reg_date"));
			}
			
			return aBean2;
			
			
			
			
		} catch (Exception e) {
			System.out.println("MemberView 메소드 내부에서 오류  : " + e);
		}finally {
			try {
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		
		
		
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


















