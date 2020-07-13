package event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class EventDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//DB연결
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/pp");
		Connection con = ds.getConnection();
		ResultSet rs = null;
		return con;
		
	}
	
	public void insertevent(EventBean eventBean) {
		String sql = "";
		int event_num = 0;
		
		try {
			con = getConnection();
			
			sql = "select max(event_num) from event";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				event_num = rs.getInt("max(event_num)") + 1;
			}else {
				event_num = 1;
			}
			
			sql = "insert into event(event_num,event_title,event_image,event_timage,"
					+ "event_content,event_startdate,event_enddate) "
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			pstmt.setString(2, eventBean.getEvent_title());
			pstmt.setString(3, eventBean.getEvent_image());
			pstmt.setString(4, eventBean.getEvent_timage());
			pstmt.setString(5, eventBean.getEvent_content());
			pstmt.setDate(6, eventBean.getEvent_startdate());
			pstmt.setDate(7, eventBean.getEvent_enddate());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertevent에서 예외 발생" + e);
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
	} //insertevent 메소드 끝
	
	public EventBean eventInfo(int event_num) {
		
		EventBean bean = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select * from event where event_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bean = new EventBean();
				bean.setEvent_num(rs.getInt(1));
				bean.setEvent_title(rs.getString(2));
				bean.setEvent_image(rs.getString(3));
				bean.setEvent_timage(rs.getString(4));
				bean.setEvent_content(rs.getString(5));
				bean.setEvent_startdate(rs.getDate(6));
				bean.setEvent_enddate(rs.getDate(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return bean;
	}//eventInfo 메소드 끝
	
	
	
	public List<EventBean> getList() {
		String sql = "";
		List<EventBean> list = new ArrayList<EventBean>();
		
		try {
			con = getConnection();
			
			sql = "select * from event";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EventBean bean = new EventBean();
				bean.setEvent_num(rs.getInt("event_num"));
				bean.setEvent_title(rs.getString("event_title"));
				bean.setEvent_image(rs.getString("event_image"));
				bean.setEvent_timage(rs.getString("event_timage"));
				bean.setEvent_content(rs.getString("event_content"));
				bean.setEvent_startdate(rs.getDate("event_startdate"));
				bean.setEvent_enddate(rs.getDate("event_enddate"));
				
				list.add(bean);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		return list;
	}//getList메소드 끝
	
	public EventBean getEventNum(int event_num) {
		
		String sql = "";
		
		EventBean eBean = new EventBean();
		
		try {
			con = getConnection();
			
			sql = "select * from event where event_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				eBean.setEvent_num(rs.getInt("event_num"));
				eBean.setEvent_title(rs.getString("event_title"));
				eBean.setEvent_image(rs.getString("event_image"));
				eBean.setEvent_timage(rs.getString("event_timage"));
				eBean.setEvent_content(rs.getString("event_content"));
				eBean.setEvent_startdate(rs.getDate("event_startdate"));
				eBean.setEvent_enddate(rs.getDate("event_enddate"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return eBean;
	}//getEventNum 메소드 끝
	
	
	public void eventUpdateProc(EventBean eventBean) {
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "update event set event_title=?, event_image=?, event_timage=?"
				+ ", event_content, event_startdate, event_enddate where event_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, eventBean.getEvent_title());
			pstmt.setString(2, eventBean.getEvent_image());
			pstmt.setString(3, eventBean.getEvent_timage());
			pstmt.setString(4, eventBean.getEvent_content());
			pstmt.setDate(5, eventBean.getEvent_startdate());
			pstmt.setDate(6, eventBean.getEvent_enddate());
			pstmt.setInt(7, eventBean.getEvent_num());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
	}//
	
	public void eventDelete(int event_num) { //이벤트 삭제 메소드
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "delete from event where event_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
		}
		
	}// eventDelete 메소드 끝
	
	
}
