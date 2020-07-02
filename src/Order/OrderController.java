package Order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String action = request.getPathInfo();
		
		if (action.equals("/order.do")) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			int count = Integer.parseInt(request.getParameter("count"));
			int totalprice = Integer.parseInt(request.getParameter("totalprice"));
			String id = request.getParameter("id");

			DetailBean DVO = Pservice.getdetails(num);

			int sub = DVO.getReserved() + count;
			
			Pservice.UpdateSeat(num,sub);
			
			OrderVO vo = new OrderVO(num, count, totalprice, id);
			
			Orservice.insertOrder(vo);

			nextPage = "/Proser/imcontact.do";
			
		}
		
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
}
