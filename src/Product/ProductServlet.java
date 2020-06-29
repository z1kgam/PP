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
		try {

			if (action == null || action.equals("/imcontact.do")) {

				  int count = productService.getCount();
				  
				  int pageSize = 6;
				  
				  String pageNum = request.getParameter("pageNum");
				  
				  if(pageNum == null){ pageNum = "1"; }
				  
				  int currentPage = Integer.parseInt(pageNum);
				  
				  int startRow = (currentPage - 1) * pageSize;
				  
				  List<ProductBean> list = null;
				  
				  if(count > 0){

					  list = productService.getList(startRow,pageSize); 
				  }
				  
				  request.setAttribute("count", count);
				  request.setAttribute("pageSize", pageSize);
				  request.setAttribute("pageNum",Integer.parseInt(pageNum));
				  request.setAttribute("currentPage",currentPage);
				  request.setAttribute("startRow",startRow); 
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

				//String line = multi.getParameter("line");
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
							content = (String) originFiles.get(i) + "," + (String) saveFiles.get(i);
						} else {
							image = (String) originFiles.get(i) + "," + (String) saveFiles.get(i);
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
				pw.print("<script>" + "  alert('제품이 추가했습니다.');" + " location.href='" + request.getContextPath()
						+ "/Proser/imcontact.do';" + "</script>");

				return;

			}else if(action.equals("/content.do")) {
				
				int num = Integer.parseInt(request.getParameter("num"));
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				
				productBean = productService.getBoard(num);
				
				request.setAttribute("Bean", productBean);
				request.setAttribute("pageNum", pageNum);
				
				nextPage = "/product/content.jsp";
				
			}else if(action.equals("/delete.do")) {
				int num = Integer.parseInt(request.getParameter("num"));
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				String image = request.getParameter("image");
				String content = request.getParameter("content");
				String path = request.getParameter("path");
				
				File file;
				String del;
				
				del = request.getServletContext().getRealPath(path) + "/" + image;
				
				file = new File(del);
				
				if(file.exists()){ 
					file.delete();
				}
				
				del = request.getServletContext().getRealPath(path) + "/" + content;
				
				file = new File(del);
				
				if(file.exists()){ 
					file.delete();
				}
				
				productService.delete(num);
				
				request.setAttribute("pageNum", pageNum);
				
				PrintWriter pw = response.getWriter();
				pw.print("<script>"+" location.href='" + request.getContextPath()
						+ "/Proser/imcontact.do';" + "</script>");

				return;
			}else if(action.equals("/details.do")) {
				
				int num = Integer.parseInt(request.getParameter("num"));
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				
				productBean = productService.getBoard(num);
				
				request.setAttribute("Bean", productBean);
				request.setAttribute("pageNum", pageNum);
				
				nextPage = "/product/details.jsp";
			}else if(action.equals("/detailsPro.do")) {
				
				int num = Integer.parseInt(request.getParameter("num"));
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				
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
				
				request.setAttribute("pageNum", pageNum);
				PrintWriter pw = response.getWriter();
				pw.print("<script>"+" location.href='" + request.getContextPath()
						+ "/Proser/imcontact.do';" + "</script>");

				return;
				
			}else if(action.equals("/winopen.do")) {
				int num = Integer.parseInt(request.getParameter("num"));
				request.setAttribute("num", num);
				
				/*
				 * String p = "<script langauge='javascript'>" +
				 * "window.open('"+request.getContextPath()+
				 * "/product/winopen.jsp','','width=400px,height=400px');" + "opener.focus();" +
				 * "</script>"; PrintWriter out = response.getWriter(); out.write(p);
				 * 
				 * return;
				 */
				//nextPage = "/product/winopen.jsp";
			}

			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
