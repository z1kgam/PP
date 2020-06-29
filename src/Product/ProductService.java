package Product;

import java.util.List;

public class ProductService {
	
	ProductDAO dao;
	DetailDAO Ddao;
	
	public ProductService() {
		dao = new ProductDAO();
		Ddao = new DetailDAO();
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
}
