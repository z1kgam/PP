package noticeboard;

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

public class NoticeboardDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	private String sql;
	
	//DB연결
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/pp");
		con = ds.getConnection();
		return con;
	}
	//자원해제
	public void freeResource() {
		if(con != null){try{con.close();}catch(SQLException e){e.printStackTrace();}}
		if(rs != null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
		if(pstmt != null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
	}
	
	//공지사항 글 입력
	public void insertNoticeboard (NoticeboardBean VO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "select max(n_num) from noticeboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			int n_num = 0;
			if(rs.next()) {
				n_num = rs.getInt(1) + 1;
			}else {
				n_num = 1;
			}
			
			sql = "insert into noticeboard"
				+ "(n_num, n_code, title, content, n_date)"
				+ "values(?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			pstmt.setString(2, VO.getN_code());
			pstmt.setString(3, VO.getTitle());
			pstmt.setString(4, VO.getContent());
			pstmt.setTimestamp(5, VO.getN_date());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertNoticeboard 메소드 내부에서 오류 : " + e);
		}finally {
			freeResource();
		}
	}
	
	//공지사항 리스트 출력
	public List<NoticeboardBean> noticeList(int pageFirst, int pageSize) {
		List<NoticeboardBean> noticeList = new ArrayList<NoticeboardBean>();
		try {
			con = getConnection();
			String query = "select * from noticeboard order by n_num desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeboardBean vo = new NoticeboardBean();
				vo.setN_num(rs.getInt("n_num"));
				vo.setN_code(rs.getString("n_code"));
				vo.setContent(rs.getString("content"));
				vo.setTitle(rs.getString("title"));
				vo.setN_date(rs.getTimestamp("n_date"));
				
				noticeList.add(vo);

			}		
		}catch (Exception e) {
			System.out.println("noticeList 메소드 내부에서 오류 : e");
		}finally {
			freeResource();
		}
		return noticeList;
	}
	
	public int getAllNotice() {
		int count = 0;
		try {
			con = getConnection();
			sql = "select * from noticeboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println("getAllNotice()메소드에서 예외 발생 : " + e);
		}finally {
			freeResource();
		}
		return count;
	}//getAllNotice()메소드 끝
	
	//공지사항 글 삭제
	public void deleteNoticeboard(int n_num) {
		try {
			con = getConnection();
			sql = "delete from noticeboard where n_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			pstmt.executeUpdate();
		
		}catch (Exception e) {
			System.out.println("deleteNoticeBoard 내부에서 오류 : "+ e);
		}finally { 
			freeResource();
		}
	}
	//공지사항 글 수정하기
	public int modNotice(NoticeboardBean noticeVO) {
		int result = 0;
		try {
			con = getConnection();
			
			sql = "update noticeboard set title=?, content=?, n_code=? where n_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noticeVO.getTitle());
			pstmt.setString(2, noticeVO.getContent());
			pstmt.setString(3, noticeVO.getN_code());
			pstmt.setInt(4, noticeVO.getN_num());
			
			pstmt.executeUpdate();
			
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return result;
	}
	
	//공지사항 글 상세보기
	public NoticeboardBean viewNotice(int n_num) {
		
		NoticeboardBean nvo = new NoticeboardBean();

		try {
			con = getConnection();
			sql = "select * from noticeboard where n_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nvo.setN_num(rs.getInt("n_num"));
				nvo.setTitle(rs.getString("title"));
				nvo.setN_code(rs.getString("n_code"));
				nvo.setContent(rs.getString("content"));
				nvo.setN_date(rs.getTimestamp("n_date"));
			}
	
		} catch (Exception e) {
			System.out.println("viewNotice 메소드 내부에서 오류 : "+ e);
		}finally {
			freeResource();
		}
		return nvo;
	}
	

}