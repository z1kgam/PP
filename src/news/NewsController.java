package news;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

@WebServlet("/News/*")
public class NewsController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
						throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
						throws ServletException, IOException {

		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
						throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		String pageNext = "";
		
		if(action.equals("/news.do")) {
			String url = "https://ticket.melon.com/ranking/index.htm";
			Document doc = null;
			String[] list = new String[10];
			
			try {
				doc = Jsoup.connect(url).get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			Elements element = doc.select("list_main_concert tapping on");
			Iterator<Element> ie1 = element.select("li").iterator();
			
			for(int i=0; i<list.length; i++) {
				list[i] = ie1.next().html()+"<br>";
				element.next();
			}
			request.setAttribute("list", list);
			
			pageNext = "/rank/rank.jsp";
			
			request.getRequestDispatcher(pageNext).forward(request, response);
		}
		
	}
	
}
