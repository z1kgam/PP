package main;

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

@WebServlet("/main/*")
public class MainController extends HttpServlet{
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
		
		if(action.equals("/main.do")) {
			String url = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=103&sid2=242";
			String url2 = "https://ticket.melon.com/main/index.htm";

			Document doc = null;
			Document doc2 = null;
			
			String[] list = new String[3];
			String[] list2 = new String[3];
			

			try {
				doc = Jsoup.connect(url).get();
				doc2 = Jsoup.connect(url2).get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			Elements element = doc.select("ul.type06_headline");
			Elements element2 = doc2.select("ol.list_ranking");
			Iterator<Element> ie1 = element.select("li").iterator();
//			Iterator<Element> ie2 = element2.select("li").iterator();
			
			
			for(int i=0; i<list.length; i++) {
				list[i] = ie1.next().html()+"<br>";
//				list2[i] = ie2.next().html()+"<br>";
				
				element.next();
				element2.next();
			}
			request.setAttribute("list", list);
//			request.setAttribute("list2", list2);
			
			
//			try {
//				doc2 = Jsoup.connect(url2).get();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			Elements element2 = doc2.select("ol.list_ranking");
//			Iterator<Element> ie2 = element2.select("li").iterator();
//			
//			for(int k=0; k<list.length; k++) {
//				list[k] = ie2.next().html()+"<br>";
//				element2.next();
//			}
//			request.setAttribute("list2", list2);
			
			
			pageNext = "/index/index.jsp";
			
			request.getRequestDispatcher(pageNext).forward(request, response);
		}
		
	}
	
}
