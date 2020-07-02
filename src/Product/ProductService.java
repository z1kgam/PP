package Product;

import java.util.List;

public class ProductService {
	
	ProductDAO dao;
	DetailDAO Ddao;
	ReplyDAO Rdao;
	
	public ProductService() {
		dao = new ProductDAO();
		Ddao = new DetailDAO();
		Rdao = new ReplyDAO();
	}
	
	public void insert(ProductBean productBean) {
		dao.insertpro(productBean);
	}

	public int getCount() {
		int count = dao.getCount();
		return count;
	}

	public List<ProductBean> getList(int startRow, int pageSize) {
		List<ProductBean> list = dao.getList(startRow,pageSize);
		return list;
	}

	public ProductBean getBoard(int num) {
		ProductBean Bean = dao.getBoard(num);
		return Bean;
	}

	public void delete(int num) {
		dao.delete(num);
		Ddao.delete(num);
	}

	public void insertDetail(DetailBean bean) {
		Ddao.insertDetail(bean);
		
	}

	public List<ProductBean> getList() {
		List<ProductBean> list = dao.getList();
		return list;
	}

	public List<ReplyVO> getreply(int num) {
		List<ReplyVO> list = Rdao.getreply(num);
		return list;
	}

	public void insertReply(ReplyVO vo) {
		Rdao.insertReply(vo);
	}

	public void deleteReply(int replynum) {
		Rdao.deleteReply(replynum);
	}

	public void doudelete(int replynum) {
		Rdao.doudelete(replynum);
		
	}

	public void updatereply(int replynum, String content) {
		Rdao.updatereply(replynum,content);	
	}

	public void replydelete(int num) {
		Rdao.replydelete(num);
		
	}

	public List<DetailBean> getdetail(int num) {
		List<DetailBean> detail = Ddao.getdetail(num);
		return detail;
	}

	public DetailBean getdetails(int detail) {
		DetailBean Bean = Ddao.getdetails(detail);
		return Bean;
	}

	public void UpdateSeat(int num, int sub) {
		Ddao.UpdateSeat(num,sub);
	}

}
