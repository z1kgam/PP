package admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberBean;
import member.MemberDAO;
import noticeboard.NoticeboardBean;
import noticeboard.NoticeboardDAO;


@WebServlet("/admin/*")
public class AdminController extends HttpServlet{

	AdminDAO adminDAO = new AdminDAO();
	AdminBean adminBean = new AdminBean();
	NoticeboardBean noticebean = new NoticeboardBean();
	NoticeboardDAO noticeDAO = new NoticeboardDAO();
	
	
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
			String action = request.getPathInfo();  
			System.out.println("action : " + action);
			
			//디스패처 방식, 리다이렉트 방식 결정
			int checkPage =0;
			List<AdminBean> articlesList = null;
			
			if(action.equals("/adminPage.do")) { 
				
				nextPage = "/admins/adminMain.jsp";
				
			//회원정보 전체 조회
			} else if(action.equals("/MemberManager.do")) {
				
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
				int blocksize = 3; // 페이징 네비 사이즈
				int totalPage = total / pageSize + (total%pageSize==0? 0:1); // 총 페이지 수
				int blockfirst = ((nowPage/blocksize)-(nowPage%blocksize==0?1:0)) * blocksize + 1; // 페이징 네비 첫번째 번호
				int blocklast = blockfirst+blocksize-1; // 페이징 네비 마지막 번호
				if(blocklast > totalPage) { // 총 페이지수보다 블럭라스터값이 더 클때 totalPage(총 페이지 수)가 blocklast로된다.
					blocklast = totalPage;
				}
				
				List<AdminBean> list = null;
				
				//회원 전체 정보 조회
				//list에 멤버정보를 담음
				if(selectserach == null) {
					list = adminDAO.getAllmember(startRow, endRow, search);
				} else {
					list = adminDAO.getAllmember(startRow, endRow, search, selectserach);
				}
				
				System.out.println("널맞네");
				System.out.println(list);
				String id = "test";
				
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
			
			//회원 삭제 요청 (관리자 페이지)
			} else if(action.equals("/MemberDel.do")) {
				
				String[] id = request.getParameterValues("check"); //getParameterValues는 배열값을 받아올때 사용한다 .
				for (int i=0; i<id.length; i++) {
					System.out.println(id[i]);
					adminDAO.MemberDelete(id[i]);
					
				}
				
				nextPage= "/admin/MemberMananger.do";
				
			} else if(action.equals("/AMemberView.do")) {
				
				String id =request.getParameter("id");
				String nowpage = request.getParameter("nowpage"); 
//				System.out.println(nowpage);
//				System.out.println(id);
				adminBean = adminDAO.MemberView(id);
				
//				System.out.println(adminBean.getEmail());
//				System.out.println(adminBean.getId());
				request.setAttribute("memberInfo", adminBean);
				request.setAttribute("nowpage", nowpage);
				nextPage = "/admins/AmemberView.jsp";
			
			//회원 정보 수정 관리 요청
			} else if(action.equals("/MemberUpdate.do")) {
				
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
				
				nextPage= "/admin/MemberModify.do";
			} else if(action.equals("/MemberDelete.do")) {
				int result = 0;
				String id = request.getParameter("id");
				result = adminDAO.MemberDelete(id);
				
				nextPage= "/admin/MemberManager.do";
				
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
			
			//문의 답변 페이지 이동
			} else if(action.equals("/Answer.do")) {
				
				nextPage = "/admins/Answer.jsp";
				
				
			} else if (action.equals("/MemberJoinCount.do")) {
				
				nextPage = "/admins/MemberJoinCount.jsp";
			
			//관리자 페이지 고객센터 관리 페이지 이동 
			} else if (action.equals("/ANoticeMain.do")) {
				
				
				String n_cate = request.getParameter("n_cate");
				String n_title = request.getParameter("n_title");
				String n_date = request.getParameter("n_date");

				int total = noticeDAO.getAllNotice();
				System.out.println(total);

				if(n_cate != null)total = noticeDAO.getAllnotice(n_cate);
				System.out.println(total);			
				
				int pageSize = 5;
				int nowPage = 1;
				if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
				
				int pageFirst = (nowPage-1) * pageSize;
				int totalPage = total/pageSize + (total%pageSize==0?0:1);
				int blockSize = 10;
				int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
				int blockLast = blockFirst + blockSize -1;
				
				if(blockLast>totalPage) blockLast=totalPage;
				
				List<NoticeboardBean> noticeList = noticeDAO.noticeList(pageFirst, pageSize);
				
				if(n_cate != null)noticeList = noticeDAO.noticeList(n_cate, pageFirst, pageSize);
					request.setAttribute("noticeList", noticeList);
					request.setAttribute("blockSize", blockSize);
					request.setAttribute("blockFirst", blockFirst);
					request.setAttribute("blockLast", blockLast);
					request.setAttribute("totalPage", totalPage);
					request.setAttribute("nowPage", nowPage);
					request.setAttribute("n_cate", n_cate);
					
					System.out.println(n_cate);
				
				nextPage = "/admins/ANoticeMain.jsp";
				
			//관리자 페이지 공지사항 작성페이지 이동	
			} else if(action.equals("/ANoticeWritep.do")) {
				
					nextPage = "/admins/ANoticeWritep.jsp";
					
			//관리자 페이지 글 추가
			} else if(action.equals("/ANoticewrite.do")) {
			
				String n_cate = request.getParameter("n_cate");
				String n_title = request.getParameter("n_title");
				String n_content = request.getParameter("n_content");
				checkPage = 1;
				noticebean.setN_cate(n_cate);
				noticebean.setN_title(n_title);
				noticebean.setN_content(n_content);
				noticebean.setN_date(new Timestamp(System.currentTimeMillis()));
				
				noticeDAO.insertNoticeboard(noticebean);
				
				nextPage = "/admin/ANoticeMain.do";
			
			//관리자 페이지 공지 글 상세보기
			} else if(action.equals("/AviewNotice.do")) {
				
				String n_num = request.getParameter("n_num");
				
				noticebean = noticeDAO.viewNotice(Integer.parseInt(n_num));
				request.setAttribute("notice", noticebean);
				
				nextPage = "/admins/AviewNotice.jsp";
				
			//관리자 페이지 글 수정 페이지 이동
			} else if(action.equals("/AmodNoticePage.do")) {
				String n_num = request.getParameter("n_num");
				noticebean = noticeDAO.viewNotice(Integer.parseInt(n_num));
				request.setAttribute("notice", noticebean);
				
				nextPage = "/admins/AmodNotice.jsp";
				
			//관리자 페이지 공지사항 글 수정	
			} else if(action.equals("/AmodNotice.do")) {
				
				int n_num = Integer.parseInt(request.getParameter("n_num"));
				System.out.println(n_num);
				
				String n_title = request.getParameter("n_title");
				System.out.println(n_title);
				
				String n_cate = request.getParameter("n_cate");
				System.out.println(n_cate);	
				
				String n_content = request.getParameter("n_content");
				System.out.println(n_content);
				
				NoticeboardBean NoticeVO = new NoticeboardBean();
				
				NoticeVO.setN_num(n_num);
				NoticeVO.setN_title(n_title);
				NoticeVO.setN_cate(n_cate);
				NoticeVO.setN_content(n_content);
				
				int result = noticeDAO.modNotice(NoticeVO);
				
				System.out.println(result);
				
//				if(result == 0) { // 수정실패
//					PrintWriter pw = response.getWriter();
//					pw.print("<script>");
//					pw.print("alert('수정실패 !')");
//					pw.print("history.go(-1);");
//					pw.print("</script>");
//				}else { // 수정성공
//					
//					PrintWriter pw = response.getWriter();
//					pw.print("<script>");
//					pw.print("alert('수정성공 !')");
//					pw.print("</script>");
//				}
//				
				nextPage = "/admin/ANoticeMain.do";
			
			//관리자 페이지 공지사항 글 삭제
			} else if(action.equals("/AdeleteNotice.do")) {
				
				int n_num = Integer.parseInt(request.getParameter("n_num")); 
				System.out.println(n_num);
				noticeDAO.deleteNoticeboard(n_num);
				
				nextPage = "/admin/ANoticeMain.do";
				
			}
			
			
			//디스패치 방식으로 포워딩 (재요청)
			if(checkPage == 0) {
				request.getRequestDispatcher(nextPage).forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+nextPage); //물어보기 이 상태로 request에 보낸값들 들고 갈수있는지
			}
			
		}// doHandle END
		
				
	
	
}
