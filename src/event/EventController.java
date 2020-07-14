package event;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		
		if(action.equals("/events.do")) { //이벤트 페이지
			
			int total = eventDAO.getAllEvent();
			
			int pageSize = 5;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			
			if(blockLast>totalPage) blockLast = totalPage;
			
			List<EventBean> list = eventDAO.getList(pageFirst, pageSize);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("blockFirst", blockFirst);
			request.setAttribute("blockLast", blockLast);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowPage", nowPage);
			
			nextPage = "/events/event.jsp";
			
		}else if(action.equals("/eventWriteForm.do")) { //이벤트 등록 페이지 가기
			
			String check = request.getParameter("check");
	         
	        request.setAttribute("check", check);
	        
			nextPage = "/events/eventWrite.jsp";
			
		}else if(action.equals("/eventWrite.do")) { //이벤트 등록 글작성
			
			String realFolder = request.getServletContext().getRealPath("upload");
			int max = 100 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(request, realFolder, max, "UTF-8",
					new DefaultFileRenamePolicy());

			Enumeration<String> e = multi.getFileNames();

			ArrayList<String> saveFiles = new ArrayList<String>();

			ArrayList<String> originFiles = new ArrayList<String>();

			while (e.hasMoreElements()) {
				String filename = (String) e.nextElement();

				saveFiles.add(multi.getFilesystemName(filename));

				originFiles.add(multi.getOriginalFileName(filename));

			}
			
			String title = multi.getParameter("title");
			Date startdate = Date.valueOf(multi.getParameter("startdate"));
			Date enddate = Date.valueOf(multi.getParameter("enddate"));
			String content = multi.getParameter("content");
			String image = "";
			String timage = "";
			if(saveFiles != null) {
				for (int i = 0; i < saveFiles.size(); i++) {
					if (i == 0) {
						timage = (String) saveFiles.get(i);
					} else {
						image = (String) saveFiles.get(i);
					}
				}
			}
						
			eventBean.setEvent_title(title);
			eventBean.setEvent_startdate(startdate);
			eventBean.setEvent_enddate(enddate);
			eventBean.setEvent_content(content);
			eventBean.setEvent_image(image);
			eventBean.setEvent_timage(timage);
			
			eventDAO.insertevent(eventBean);
			
			nextPage = "/event/events.do";
			
		}else if(action.equals("/eventInfo.do")) { //이벤트 상세 정보
			
			int event_num = Integer.parseInt(request.getParameter("event_num"));
			
			eventBean = eventDAO.eventInfo(event_num);
			
			request.setAttribute("eventBean", eventBean);
			
			nextPage = "/events/eventInfo.jsp";
			
		}else if(action.equals("/eventUpdateForm.do")) { //이벤트 상세 정보 수정폼
			
			int event_num = Integer.parseInt(request.getParameter("event_num"));
			
			eventBean = eventDAO.getEventNum(event_num);
			
			request.setAttribute("eventBean", eventBean);
			
			nextPage = "/events/eventUpdate.jsp";
			
		}else if(action.equals("/eventUpdate.do")) {
			
			int event_num = Integer.parseInt(request.getParameter("event_num"));
			
			String realFolder = request.getServletContext().getRealPath("upload");
			int max = 100 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(request, realFolder, max, "UTF-8",
					new DefaultFileRenamePolicy());

			Enumeration<String> e = multi.getFileNames();

			ArrayList<String> saveFiles = new ArrayList<String>();

			ArrayList<String> originFiles = new ArrayList<String>();

			while (e.hasMoreElements()) {
				String filename = (String) e.nextElement();

				saveFiles.add(multi.getFilesystemName(filename));

				originFiles.add(multi.getOriginalFileName(filename));

			}
			
			String title = multi.getParameter("title");
			Date startdate = Date.valueOf(multi.getParameter("startdate"));
			Date enddate = Date.valueOf(multi.getParameter("enddate"));
			String content = multi.getParameter("content");
			String image = "";
			String timage = "";
			if(saveFiles != null) {
				for (int i = 0; i < saveFiles.size(); i++) {
					if (i == 0) {
						timage = (String) saveFiles.get(i);
					} else {
						image = (String) saveFiles.get(i);
					}
				}
			}
						
			eventBean.setEvent_num(event_num);
			eventBean.setEvent_title(title);
			eventBean.setEvent_startdate(startdate);
			eventBean.setEvent_enddate(enddate);
			eventBean.setEvent_content(content);
			eventBean.setEvent_image(image);
			eventBean.setEvent_timage(timage);
			
			eventDAO.eventUpdateProc(eventBean);
			
			nextPage = "/event/eventInfo.do";
			
		} else if(action.equals("/eventDelete.do")) {
			
			int event_num = Integer.parseInt(request.getParameter("event_num"));
			
			eventDAO.eventDelete(event_num);
			
			nextPage = "/event/events.do";
			
		}
		
		
		
		
		
		request.getRequestDispatcher(nextPage).forward(request, response);
		
	}// doHandle 끝
	
}// EventController 끝
