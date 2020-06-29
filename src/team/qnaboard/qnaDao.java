package team.qnaboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import team.faqboard.faqBean;

public class qnaDao {
	
	
	//DB����
		private Connection con;
		private PreparedStatement pstmt;
		private ResultSet rs;
		private DataSource ds;
		
		//DB����
		private Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/pp");
		Connection con = ds.getConnection();
		return con;
		}
		
		//�ڿ����� �޼ҵ�
		public void freeResource(){
		if(con != null){try{con.close();}catch(Exception err){}}
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{con.close();}catch(Exception err){}}
		}
		
		
		
		//FAQ ����Ʈ ���
		public List<qnaBean> qnaList(int pageFirst, int pageSize) {
			List<qnaBean> qnaList = new ArrayList<qnaBean>();
			try {
				con = getConnection();
				String query = "select * from qnaboard order by qna_num desc limit ?,?";
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, pageFirst);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					qnaBean qbean = new qnaBean();
					qbean.setQna_num(rs.getInt("qna_num"));
					qbean.setUserId(rs.getString("userId"));
					qbean.setQna_cate(rs.getString("qna_cate"));
					qbean.setQna_title(rs.getString("qna_title"));
					qbean.setQna_contents(rs.getString("qna_contents"));
					qbean.setQna_date(rs.getDate("qna_date"));
					qbean.setQna_status(rs.getInt("qna_status"));
					
					qnaList.add(qbean);

				}		
			}catch (Exception e) {
				System.out.println("qnaList에서 오류 : e");
			}finally {
				freeResource();
			}
			return qnaList;
		}
		
		
		
		
		
		//QNA �Խ��� �� �ۼ� �޼ҵ�
		public void insertfboard(qnaBean qnaBean) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "";
			
			try {
				con = getConnection();
				sql = "select max(qna_num) from qnaboard";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();	
				int faq_num = 0;
				if(rs.next()) {
					faq_num = rs.getInt(1) + 1;
				}else {
					faq_num = 1;
				}
				
				sql = "insert into qnaboard(qna_num, userId, qna_cate, qna_title, qna_contents, qna_date, qna_status)"
					+ "values(?,'id',?,?,?,now(),0)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, faq_num);
				pstmt.setString(2, qnaBean.getQna_cate());
				pstmt.setString(3, qnaBean.getQna_title());
				pstmt.setString(4, qnaBean.getQna_contents());
				
				pstmt.executeUpdate();
				
			}catch (Exception e) {
				System.out.println("insertfboard �޼ҵ� ���ο��� ���ܹ߻� : " + e);
			}finally {
				freeResource();
			}
			
		}//insertfboard

		
		//��� �� ��ȸ
		public int getAllNotice() {
			int count = 0;
			String sql = "";
			try {
				con = getConnection();
				sql = "select * from qnaboard";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					count ++;
				}
			} catch (Exception e) {
				System.out.println("getAllNotice()에서 예외발생 : " + e);
			}finally {
				freeResource();
			}
			return count;
		}//getAllNotice()�޼ҵ� ��



}
