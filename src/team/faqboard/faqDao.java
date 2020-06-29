package team.faqboard;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class faqDao {
	
	//DB연결
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
	
	//자원해제 메소드
	public void freeResource(){
	if(con != null){try{con.close();}catch(Exception err){}}
	if(rs != null){try{rs.close();}catch(Exception err){}}
	if(pstmt != null){try{con.close();}catch(Exception err){}}
	}
	

		
	public List<faqBean> getFaqList(String search, int startrow, int endrow) {
		String sql = "";
		List<faqBean> poolList = new ArrayList<faqBean>();
		
		try {

			con = getConnection();
					
			sql = "select * from faqboard where faq_cate like ? or faq_title like ? order by faq_date desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, endrow);						
			rs = pstmt.executeQuery();

			while (rs.next()) {
				faqBean fBean = new faqBean();

				fBean.setFaq_num(rs.getInt("faq_num"));
				fBean.setFaq_cate(rs.getString("faq_cate"));
				fBean.setFaq_title(rs.getString("faq_title"));
				fBean.setFaq_contents(rs.getString("faq_contents"));
				fBean.setFaq_date(rs.getDate("faq_date"));

				poolList.add(fBean);
			}

		} catch (Exception e) {
			System.out.println("getPoolList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return poolList;
	}// getPoolList
	
	

	public int getfaqCount(String search) {
		
		String sql = "";
		int count = 0;

		try {

			con = getConnection();			

			sql = "select * from faqboard where faq_cate like ? or faq_title like ?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				count++;
			}

		} catch (Exception e) {
			System.out.println("getPoolCount()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return count;
		
	}// getPoolCount끝

	
	

}


