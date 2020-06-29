package team.faqboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/fboard/*")
public class faqBoardController extends HttpServlet{
	
	faqBean faqBean;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//MVC 중 View이름을 저장할 변수
		String nextPage = "";
		//한글처리
		request.setCharacterEncoding("utf-8");
		//클라이언트의 웹브라우저로 응답할 데이터 유형 설정
		response.setContentType("text/html;charset=utf-8");
		
		//요청 URL중 2단계 요청 주소를 알아내온다
		String action = request.getPathInfo();  //  /listArticles.do 
		System.out.println("action : " + action);
		faqDao faqDao = new faqDao();
		List<faqBean> articlesList = new ArrayList<faqBean>();	
//		
//		String search = "";
		String search = (request.getParameter("search") != null) ? request.getParameter("search") : "";
		String category = (request.getParameter("category") != null) ? request.getParameter("category") : "";
//		
		int total = faqDao.getfaqCount(search);
		int nowpage = 1 ;
		if(request.getParameter("nowpage") !=null) nowpage = Integer.parseInt(request.getParameter("nowpage"));
		int pagesize = 5 ;
		int startrow = (nowpage-1)*pagesize;
		int endrow = pagesize;
		int totalpage = total/pagesize + (total%pagesize==0?0:1);
		int blocksize = 3;
		int blockfirst = ((nowpage/blocksize)-(nowpage%blocksize==0?1:0))*blocksize+1;
		int blocklast = blockfirst + blocksize -1;
		if(blocklast > totalpage) blocklast = totalpage;
		
		
		
/*		
		if(blockfirst != 1) {
			<a>이전</a>
		}
		for(int i = blockfirst ; i <= blocklast ; i ++) {
			<a>i</a>
		}
		if(blocklast != totalpage) {
			<a> 다음</a>
		}
*/		
		
		
		if(action.equals("/faqlist.do")) {//요청명이 null일떄...
			
//			int count = 0;
			//모든 글정보를 검색해서 가져 오기 위해 BoardService객체의 listArticles()메소드 호출!
//			articlesList = faqDao.getFaqList(search, startRow, pageSize);
//			articlesList = boardService.listArticles();
			
			//검색한 글정보(응답할 데이터)를  VIEW페이지(listArticles.jsp)로 보내서 출력하기 위해
			//임시로 request저장소에 저장 하여 유지 시킨다
			
			articlesList = faqDao.getFaqList(search, startrow, endrow);
			System.out.println(articlesList.size());
			int count = total;
			
			request.setAttribute("category", category);
			
			request.setAttribute("articlesList", articlesList);
			request.setAttribute("count", count);
			//페이징
			request.setAttribute("nowpage", nowpage);
			request.setAttribute("blockfirst", blockfirst);
			request.setAttribute("blocklast", blocklast);
			request.setAttribute("blocksize", blocksize);
			request.setAttribute("totalpage", totalpage);
			
			nextPage = "/board/qna_faqboard.jsp";		
			
		}

		
		//디스패치 방식으로 포워딩 (재요청)
		request.getRequestDispatcher(nextPage).forward(request, response);
	
	}	
		
	}