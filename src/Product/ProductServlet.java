package Product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@SuppressWarnings("serial")
@WebServlet("/Proser/*")
public class ProductServlet extends HttpServlet {

	ProductService productService;
	ProductBean productBean;
	DetailBean Bean;
	ReplyVO vo;

	public void init(ServletConfig config) throws ServletException {
		productService = new ProductService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String action = request.getPathInfo();
		System.out.println(action);
		int checkPage = 0;
		try {

			if (action.equals("/imcontact.do")) {

				
				/*
				 * int count = productService.getCount();
				 * 
				 * int pageSize = 6;
				 * 
				 * String pageNum = request.getParameter("pageNum");
				 * 
				 * if(pageNum == null){ pageNum = "1"; }
				 * 
				 * int currentPage = Integer.parseInt(pageNum);
				 * 
				 * int startRow = (currentPage - 1) * pageSize;
				 */
				  
				  //List<ProductBean> list = productService.getList(startRow,pageSize);
				  
				/*
				 * if(count > 0){
				 * 
				 * list = productService.getList(startRow,pageSize); }
				 * 
				 * request.setAttribute("count", count); request.setAttribute("pageSize",
				 * pageSize); request.setAttribute("pageNum",Integer.parseInt(pageNum));
				 * request.setAttribute("currentPage",currentPage);
				 */
				  //request.setAttribute("startRow",startRow);
				List<ProductBean> list = productService.getList();
				request.setAttribute("List",list);

				nextPage = "/product/imcontact.jsp";

			} else if (action.equals("/write.do")) {
				nextPage = "/product/write.jsp";
			} else if (action.equals("/writePro.do")) {
				String realFolder = request.getServletContext().getRealPath("consert");
				int max = 100 * 1024 * 1024;

				MultipartRequest multi = new MultipartRequest(request, realFolder, max, "UTF-8",
						new DefaultFileRenamePolicy());

				Enumeration e = multi.getFileNames();

				ArrayList saveFiles = new ArrayList();

				ArrayList originFiles = new ArrayList();

				while (e.hasMoreElements()) {
					String filename = (String) e.nextElement();

					saveFiles.add(multi.getFilesystemName(filename));

					originFiles.add(multi.getOriginalFileName(filename));

				}

				String name = multi.getParameter("name");
				String genre = multi.getParameter("genre");
				String cla = multi.getParameter("cla");
				int minute = Integer.parseInt(multi.getParameter("minute"));
				int price = Integer.parseInt(multi.getParameter("price"));
				Date startdate = Date.valueOf(multi.getParameter("startdate"));
				Date enddate = Date.valueOf(multi.getParameter("enddate"));

				String image = "";
				String content = "";
				if (saveFiles != null) {
					for (int i = 0; i < saveFiles.size(); i++) {
						if (i == 0) {
							content = (String) saveFiles.get(i);
						} else {
							image = (String) saveFiles.get(i);
						}
					}
				}

				productBean = new ProductBean();
				productBean.setName(name);
				productBean.setGenre(genre);
				productBean.setCla(cla);
				productBean.setMinute(minute);
				productBean.setPrice(price);
				productBean.setStartdate(startdate);
				productBean.setEnddate(enddate);
				productBean.setImage(image);
				productBean.setContent(content);

				productService.insert(productBean);

				PrintWriter pw = response.getWriter();
				pw.print("<script>" + "  alert('제품을 추가했습니다.');" + " location.href='" + request.getContextPath()
						+ "/Proser/imcontact.do';" + "</script>");

				return;

			} else if (action.equals("/content.do")) {

				int num = Integer.parseInt(request.getParameter("num"));
				//int pageNum = Integer.parseInt(request.getParameter("pageNum"));

				productBean = productService.getBoard(num);
				List<ReplyVO> list = productService.getreply(num);
				List<DetailBean> detail = productService.getdetail(num);

				request.setAttribute("Bean", productBean);
				request.setAttribute("List", list);
				request.setAttribute("detail", detail);
				//request.setAttribute("pageNum", pageNum);

				nextPage = "/product/content.jsp";

			} else if (action.equals("/delete.do")) {
				int num = Integer.parseInt(request.getParameter("num"));
				//int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				String image = request.getParameter("image");
				String content = request.getParameter("content");
				String path = request.getParameter("path");

				File file;
				String del;

				del = request.getServletContext().getRealPath(path) + "/" + image;

				file = new File(del);

				if (file.exists()) {
					file.delete();
				}

				del = request.getServletContext().getRealPath(path) + "/" + content;

				file = new File(del);

				if (file.exists()) {
					file.delete();
				}

				productService.delete(num);
				productService.replydelete(num);

				//request.setAttribute("pageNum", pageNum);

				PrintWriter pw = response.getWriter();
				pw.print("<script>" + " location.href='" + request.getContextPath() + "/Proser/imcontact.do';"
						+ "</script>");

				return;
			} else if (action.equals("/details.do")) {

				int num = Integer.parseInt(request.getParameter("num"));
				//int pageNum = Integer.parseInt(request.getParameter("pageNum"));

				productBean = productService.getBoard(num);

				request.setAttribute("Bean", productBean);
				//request.setAttribute("pageNum", pageNum);

				nextPage = "/product/details.jsp";
			} else if (action.equals("/detailsPro.do")) {

				int num = Integer.parseInt(request.getParameter("num"));
				//int pageNum = Integer.parseInt(request.getParameter("pageNum"));

				String place = request.getParameter("place");
				int seat = Integer.parseInt(request.getParameter("seat"));
				int reserved = 0;
				Date date = Date.valueOf(request.getParameter("date"));
				String time = request.getParameter("time");

				Bean = new DetailBean();
				Bean.setNum(num);
				Bean.setPlace(place);
				Bean.setSeat(seat);
				Bean.setReserved(reserved);
				Bean.setDate(date);
				Bean.setTime(time);

				productService.insertDetail(Bean);

				//request.setAttribute("pageNum", pageNum);
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + " location.href='" + request.getContextPath() + "/Proser/imcontact.do';"
						+ "</script>");

				return;

			}else if(action.equals("/reply.do")){
				int pronum = Integer.parseInt(request.getParameter("pronum"));
				int parentsnum = Integer.parseInt(request.getParameter("parentsnum"));
				String id = request.getParameter("id");
				String content = request.getParameter("content");
				checkPage = 1;
				vo = new ReplyVO();
				vo.setProductnum(pronum);
				vo.setParentsnum(parentsnum);
				vo.setId(id);
				vo.setContent(content);
				
				productService.insertReply(vo);
				
				nextPage = "/Proser/content.do?num="+pronum;
				
			}else if(action.equals("/replydelete.do")) {
				
				int pronum = Integer.parseInt(request.getParameter("pronum"));
				int replynum = Integer.parseInt(request.getParameter("replynum"));
				
				productService.deleteReply(replynum);
				
				nextPage = "/Proser/content.do?num="+pronum;
			}else if(action.equals("/alldelete.do")) {
				
				int pronum = Integer.parseInt(request.getParameter("pronum"));
				int replynum = Integer.parseInt(request.getParameter("replynum"));
				
				productService.doudelete(replynum);
				productService.deleteReply(replynum);
				
				nextPage = "/Proser/content.do?num="+pronum;
				
			}else if(action.equals("/updatereply.do")) {
				int pronum = Integer.parseInt(request.getParameter("pnum"));
				int replynum = Integer.parseInt(request.getParameter("replynum"));
				String content = request.getParameter("upcontent");
				
				productService.updatereply(replynum,content);
				
				nextPage = "/Proser/content.do?num="+pronum;
			}
			if(checkPage == 0) {
				request.getRequestDispatcher(nextPage).forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+nextPage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
