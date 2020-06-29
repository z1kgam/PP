package team.qnaboard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.faqboard.faqBean;
import team.faqboard.faqDao;

@WebServlet("/qboard/*")
public class qnaBoardController extends HttpServlet{
	
	qnaBean Bean;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		qnaDao qnaDao = new qnaDao();
		qnaBean qnaBean = new qnaBean();
		
		//MVC �� View�̸��� ������ ����
		String nextPage = "";
		//�ѱ�ó��
		request.setCharacterEncoding("utf-8");
		//Ŭ���̾�Ʈ�� ���������� ������ ������ ���� ����
		response.setContentType("text/html;charset=utf-8");
		//��û URL�� 2�ܰ� ��û �ּҸ� �˾Ƴ��´�
		String action = request.getPathInfo();  //  
		System.out.println("action : " + action);
		
		
		
		if(action.equals("/qwriteForm.do")) { // 1:1�����ϱ� ��ư Ŭ����
			 
			nextPage = "/board/qna_write.jsp";
			
		}else if(action.equals("/qnaWrite.do")) { // 1:1�۾��� ��ư Ŭ����
			
			String Rcate = request.getParameter("cate");
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			
			qnaBean.setQna_cate(Rcate);
			qnaBean.setQna_title(title);
			qnaBean.setQna_contents(contents);
			
			qnaDao.insertfboard(qnaBean);			
			
			nextPage = "/qboard/qnaList.do";

			
		}else if(action.equals("/qnaList.do")) {
			
//			String num = request.getParameter("qna_num");
//			String status = request.getParameter("qna_status");
//			String title = request.getParameter("qna_title");
//			String date = request.getParameter("qna_date");

			int total = qnaDao.getAllNotice();
			int pageSize = 5;
			int nowPage = 1;
			if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
			
			int pageFirst = (nowPage-1) * pageSize;
			int totalPage = total/pageSize + (total%pageSize==0?0:1);
			int blockSize = 10;
			int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
			int blockLast = blockFirst + blockSize -1;
			
			if(blockLast>totalPage) blockLast=totalPage;
			List<qnaBean> qnaList = qnaDao.qnaList(pageFirst, pageSize);
			request.setAttribute("qnaList", qnaList);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("blockFirst", blockFirst);
			request.setAttribute("blockLast", blockLast);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowPage", nowPage);

			nextPage = "/board/qna_my.jsp";

			
		}
		


	//����ġ ������� ������ (���û)
	request.getRequestDispatcher(nextPage).forward(request, response);
		
	}//doHandle

}//qnaBoardController
