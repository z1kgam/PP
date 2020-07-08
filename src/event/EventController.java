package event;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/event/*")
public class EventController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		//클라이언트의 웹브라우저로 응답할 데이터 유형 설정
		response.setContentType("text/html;charset=utf-8");
		//MVC 중 View이름을 저장할 변수
		String nextPage = "";
		
		//요청 URL중 2단계 요청 주소를 알아내온다
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		
		EventBean eventBean = new EventBean();
		EventDAO eventDAO = new EventDAO();
		HttpSession session = request.getSession();
		
		//디스패처 방식, 리다이렉트 방식 결정
		int checkPage = 0;
		
		if(action.equals("/events.do")) {
			System.out.println("왔는데 ?");
			nextPage = "/events/event.jsp";
			
		}
		
		
		
		
		
		request.getRequestDispatcher(nextPage).forward(request, response);
		
	}// doHandle 끝
	
}// EventController 끝
