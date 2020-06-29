package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberBean;
import member.MemberDAO;


@WebServlet("/admin/*")
public class AdminController extends HttpServlet{

	AdminDAO adminDAO = new AdminDAO();
	AdminBean adminBean = new AdminBean();
	
	
	
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doHandle(request, response);
		}
		
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doHandle(request, response);
		}
		
		protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			
			
			//MVC 중 View이름을 저장할 변수
			String nextPage = "";
			//한글처리
			request.setCharacterEncoding("utf-8");
			//클라이언트의 웹브라우저로 응답할 데이터 유형 설정
			response.setContentType("text/html;charset=utf-8");
			
			//요청 URL중 2단계 요청 주소를 알아내온다
			String action = request.getPathInfo();  //  /listArticles.do 
			System.out.println("action : " + action);
			
			List<AdminBean> articlesList = null;
			
			if(action.equals("/adminPage.do")) { 
				
				
				nextPage = "/admins/adminMain.jsp";
			
			//회원정보 전체 조회 메소드
			} else if(action.equals("/MemberMan.do")) {
				
				//회원 아이디 검색값 받아오기
				String search = "";
				if(request.getParameter("search")==null) {
					search = "";
				} else {
					search = request.getParameter("search");
				}
				
				String selectserach = request.getParameter("selectserach");
				
				System.out.println(selectserach);
				System.out.println(search);
				AdminDAO adminDAO = new AdminDAO();
				
				//페이징 처리 변수
				//회원 총 수 구해오기
				int total = adminDAO.AllMemberCount(search); //회원 총 수
				int pageSize = 5; // 한 페이지당 출력할 게시물 수
				int nowPage = 1; // 현재 페이지
				if(request.getParameter("nowpage") != null) {
					nowPage = Integer.parseInt(request.getParameter("nowpage"));
				}
				int startRow = (nowPage-1)*pageSize; // 첫 번째 게시물 번호
				int endRow = pageSize; // 마지막 게시물 번호 
				int blocksize = 5; // 페이징 네비 사이즈
				int totalPage = total / pageSize + (total%pageSize==0? 0:1); // 총 페이지 수
				int blockfirst = ((nowPage/blocksize)-(nowPage%blocksize==0?1:0)) * blocksize + 1; // 페이징 네비 첫번째 번호
				int blocklast = blockfirst+blocksize-1; // 페이징 네비 마지막 번호
				if(blocklast > totalPage) { // 총 페이지수보다 블럭라스터값이 더 클때 totalPage(총 페이지 수)가 blocklast로된다.
					blocklast = totalPage;
				}
				
				List<AdminBean> list = null;
				
				//회원 전체 정보 조회
				if(selectserach == null) {
					list = adminDAO.getAllmember(startRow, endRow, search);
				} else {
					list = adminDAO.getAllmember(startRow, endRow, search, selectserach);
				}
				
				
				//list에 멤버정보를 담음
				String id = "test";
				
				//검색한 글정보(응답할 데이터)를  VIEW페이지(listArticles.jsp)로 보내서 출력하기 위해
				//임시로 request저장소에 저장 하여 유지 시킨다
				
				//회원정보
				request.setAttribute("list", list);
				
				//페이징 변수
				request.setAttribute("total", total);
				System.out.println(total);
				request.setAttribute("nowpage", nowPage);
				request.setAttribute("blockfirst", blockfirst);
				request.setAttribute("blocksize", blocksize);
				request.setAttribute("blocklast", blocklast);
				request.setAttribute("totalPage", totalPage);
				
				nextPage = "/admins/adminManager.jsp";
				System.out.println(action);
				
			} else if(action.equals("/MemberDel.do")) {
				
				String[] id = request.getParameterValues("check"); //getParameterValues는 배열값을 받아올때 사용한다 .
				for (int i=0; i<id.length; i++) {
					System.out.println(id[i]);
					adminDAO.MemberDelete(id[i]);
					
				}
				
				nextPage= "/admin/MemberMan.do";
				
			} else if(action.equals("/MemberView.do")) {
				
				String id =request.getParameter("id");
				String nowpage = request.getParameter("nowpage"); 
//				System.out.println(nowpage);
//				System.out.println(id);
				adminBean = adminDAO.MemberView(id);
				
//				System.out.println(adminBean.getEmail());
//				System.out.println(adminBean.getId());
				request.setAttribute("memberInfo", adminBean);
				request.setAttribute("nowpage", nowpage);
				nextPage = "/admins/adminView.jsp";
				
			} else if(action.equals("/MemberUpdate.do")) {
				
//				String id = request.getParameter("id");
//				String password = request.getParameter("password");
//				String name = request.getParameter("name");
//				String phone = request.getParameter("phone");
//				String email = request.getParameter("email");
//				int point = Integer.parseInt(request.getParameter("point"));
//				int status = Integer.parseInt(request.getParameter("status"));
//				int admin = Integer.parseInt(request.getParameter("admin"));
//				
//				System.out.println(id);
//				System.out.println(password);
//				System.out.println(name);
//				System.out.println(phone);
//				System.out.println(email);
//				System.out.println(point);
//				System.out.println(status);
//				System.out.println(admin);
				
				
				
				
				MemberBean memberInfo = new MemberBean();
				int result = 0;
				
				memberInfo.setId(request.getParameter("id"));
				memberInfo.setPassword(request.getParameter("password"));
				memberInfo.setName(request.getParameter("name"));
				memberInfo.setPhone(request.getParameter("phone"));
				memberInfo.setEmail(request.getParameter("email"));
				memberInfo.setPoint(Integer.parseInt(request.getParameter("point")));
				memberInfo.setStatus(Integer.parseInt(request.getParameter("status")));
				memberInfo.setIs_admin(Integer.parseInt(request.getParameter("admin")));
				
				result = adminDAO.MemberUpdate(memberInfo);
				
				
				
				
				System.out.println("왔다아" );
				
				nextPage= "/admin/MemberMan.do";
			} else if(action.equals("/MemberDelete.do")) {
				int result = 0;
				
				String id = request.getParameter("id");
				result = adminDAO.MemberDelete(id);
				
				
				
				nextPage= "/admin/MemberMan.do";
				
			} else if(action.equals("/MemberSearch.do")) {
				
				
				String search = request.getParameter("search");
				System.out.println(search);
				
				AdminDAO adminDAO = new AdminDAO();
				
				nextPage = "/admins/adminManager.jsp";
				
			//상품관리 페이지 이동
			} else if(action.equals("/ProductMan.do")) {
				
				nextPage = "/admins/productManager.jsp";
				
			//이벤트 관리 페이지 이동
			} else if(action.equals("/EventMan.do")) {
				
				nextPage = "/admins/EventManager.jsp";
				
			//고객 관리 페이지 이동
			} else if(action.equals("/CustomerMan.do")) {
				
				nextPage = "/admins/CustomerManager.jsp";
				
			} else if(action.equals("/Answer.do")) {
				
				nextPage = "/admins/Answer.jsp";
			}
			
			
			//디스패치 방식으로 포워딩 (재요청)
			request.getRequestDispatcher(nextPage).forward(request, response);
		
		}// doHandle END
		
				
	
	
}
