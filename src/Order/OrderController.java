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
			
			int detailnum = Integer.parseInt(request.getParameter("detailnum"));
			int reserved = Integer.parseInt(request.getParameter("count"));
			int totalprice = Integer.parseInt(request.getParameter("totalprice"));
			String id = request.getParameter("id");

			DetailBean DVO = Pservice.getdetails(detailnum);

			int sub = DVO.getTotalreserved() + reserved;
			
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
			vo.setReserved(reserved);
			vo.setTotalprice(totalprice);
			
			Orservice.insertOrder(vo);

			nextPage = "/Proser/imcontact.do";
			
		}
		
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
}
