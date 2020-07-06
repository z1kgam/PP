package Order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.DetailBean;
import Product.ProductBean;
import Product.ProductService;

@WebServlet("/Order/*")
public class OrderController extends HttpServlet{
	
	ProductService Pservice;
	OrderService Orservice;
	
	public void init(ServletConfig config) throws ServletException {
		Pservice = new ProductService();
		Orservice = new OrderService();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int checkPage = 0;
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		OrderDAO orderDAO = new OrderDAO();
		OrderVO orderVO = new OrderVO();
		HttpSession session = request.getSession();
		String action = request.getPathInfo();
		
		if (action.equals("/order.do")) {			//장바구니에 추가하기
			
			int detailnum = Integer.parseInt(request.getParameter("detailnum"));
			int qty = Integer.parseInt(request.getParameter("count"));
			int totalprice = Integer.parseInt(request.getParameter("totalprice"));
			String id = request.getParameter("id");

			DetailBean DVO = Pservice.getdetails(detailnum);

			int sub = DVO.getTotalreserved() + qty;
			
			Pservice.UpdateSeat(detailnum,sub);
			
			DetailBean Bean = Pservice.getdetails(detailnum);
			
			OrderVO vo = new OrderVO();
			
			vo.setName(Bean.getName());
			vo.setGenre(Bean.getGenre());
			vo.setCla(Bean.getCla());
			vo.setRuntime(Bean.getRuntime());
			vo.setPrice(Bean.getPrice());
			vo.setStartdate(Bean.getStartdate());
			vo.setEnddate(Bean.getEnddate());
			vo.setImage(Bean.getImage());
			vo.setContent(Bean.getContent());
			vo.setPlace(Bean.getPlace());
			vo.setSeat(Bean.getSeat());
			vo.setTotalreserved(Bean.getTotalreserved());
			vo.setToday(Bean.getToday());
			vo.setStarttime(Bean.getStarttime());
			vo.setId(id);
			vo.setDetailnum(detailnum);
			vo.setQty(qty);
			vo.setTotalprice(totalprice);
			
			Orservice.insertOrder(vo);

			session.setAttribute("cartList", vo);
			checkPage = 1;
			PrintWriter pw = response.getWriter();
			pw.write("<script>");
			pw.write("alert('장바구니에 추가되었습니다.');");
			pw.write("location.href='"+request.getContextPath()+"/Order/cartList.do';");
			pw.write("</script>");
			return;
			
		}else if(action.equals("/cartList.do")) {				//장바구니 전체내역 조회

			String id = (String)session.getAttribute("id");
			
			List<OrderVO> cartList = orderDAO.getCartList(id);
			int cartcount =orderDAO.getCountCartList(id);
			int total = orderDAO.getTotalPrice(id);
			session.setAttribute("cartList", cartList);
			session.setAttribute("cartcount", cartcount);
			session.setAttribute("total", total);
			
			nextPage = "/mypage/cartList.jsp";
	
		}else if(action.equals("/delCart.do")) {			//장바구니에서 하나씩 삭제
			
			int num = Integer.parseInt(request.getParameter("num"));
			String id = (String)session.getAttribute("id");
			
			orderDAO.delCart(num, id); 
			
			PrintWriter pw = response.getWriter();
			checkPage = 1;
			pw.write("<script>");
			pw.write("alert('삭제가 완료 되었습니다.');");
			pw.write("location.href='"+request.getContextPath()+"/Order/cartList.do';");
			pw.write("</script>");

			return;
		}else if(action.equals("/delAllCart.do")) {					//장바구니 전체삭제
			
			String id = (String)session.getAttribute("id");
			
			orderDAO.delAllCart(id);
			
			PrintWriter pw = response.getWriter();
			checkPage = 1;
			pw.write("<script>");
			pw.write("alert('장바구니 삭제가 완료 되었습니다.');");
			pw.write("location.href='"+request.getContextPath()+"/Order/cartList.do';");
			pw.write("</script>");
			
			return;
			
		}else if(action.equals("/addPayment.do")) {
			String id = (String)session.getAttribute("id");
			
			orderDAO.addPayment();
		}
		
		if(checkPage == 0) {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+nextPage);
		}
		
	}
}
