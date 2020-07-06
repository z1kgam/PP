package Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.mysql.fabric.Response;

import Product.DetailBean;
import Product.ProductBean;

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

	//장바구니에 추가하기
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
					+ "place,seat,totalreserved,today,starttime,id,qty,totalprice,orderdate)"
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
			pstmt.setInt(18, vo.getQty());
			pstmt.setInt(19, vo.getTotalprice());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertOrder메소드 에서 예외발생 : " + e);
		}finally {
			resource();
		}
	}
	
	//해당 id의 전체 장바구니 내역 리스트조회
	public ArrayList<OrderVO> getCartList(String id){
		ArrayList<OrderVO> cartList = new ArrayList<OrderVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "SELECT NUM, ID, NAME, QTY, TOTALPRICE, ORDERDATE FROM PRODUCTORDER WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setNum(rs.getInt("num"));
				orderVO.setId(rs.getString("id"));
				orderVO.setName(rs.getString("name"));
				orderVO.setQty(rs.getInt("qty"));
				orderVO.setTotalprice(rs.getInt("totalprice"));
				orderVO.setOrderdate(rs.getDate("orderdate"));				
				cartList.add(orderVO);
			}
			
		} catch (Exception e) {
			System.out.println("getCartList Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cartList;
	}

	//장바구니 내역삭제
	public void delCart(int num, String id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "DELETE FROM PRODUCTORDER WHERE NUM = ? AND ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delCart Inner Err : " + e);
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	//장바구니 수정
	public int modCart(int num, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int result = 0;
		OrderVO orderVO = new OrderVO();
		try {
			con = getConnection();
			sql = "UPDATE PRODUCTORDER SET QTY = ?, TOTALPRICE = ? WHERE NUM = ? AND ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, orderVO.getQty());
			pstmt.setInt(2, orderVO.getTotalprice());
			pstmt.setInt(3, num);
			pstmt.setString(4, id);
		} catch (Exception e) {
			System.out.println("modCart Inner Err : " + e);
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	//장바구니 갯수 조회
	public int getCountCartList(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="";
		int cartcount = 0;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "SELECT COUNT(*) FROM PRODUCTORDER WHERE ID =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cartcount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getCountCartList Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cartcount;
		
	}

	//장바구니 전체삭제
	public void delAllCart(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "DELETE FROM PRODUCTORDER WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delAllCart Inner Err : " + e);
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//장바구니 전체의 가격 불러오기
	public int getTotalPrice(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int total = 0;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "SELECT SUM(TOTALPRICE) FROM PRODUCTORDER WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTotalPrice Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return total;
	}
	
	public void addPayment(OrderVO orderVO){
		ArrayList<OrderVO> payList = new ArrayList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "INSERT INTO PAYMENT(ID, NAME, QTY, TOTALPRICE, PAYDATE) VALUES(?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderVO.getId());
			pstmt.setString(2, orderVO.getName());
			pstmt.setInt(3, orderVO.getQty());
			pstmt.setInt(4, orderVO.getTotalprice());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("addPayment Inner Err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
}
