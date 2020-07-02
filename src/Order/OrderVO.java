package Order;

import java.sql.Date;

public class OrderVO {
	private int num, detailnum, reserved, total;
	private String id;
	private Date orderdate;
	
	public OrderVO(int num, int detailnum, int reserved, int total, String id, Date orderdate) {
		super();
		this.num = num;
		this.detailnum = detailnum;
		this.reserved = reserved;
		this.total = total;
		this.id = id;
		this.orderdate = orderdate;
	}

	public OrderVO(int detailnum, int reserved, int total, String id) {
		super();
		this.detailnum = detailnum;
		this.reserved = reserved;
		this.total = total;
		this.id = id;
	}



	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getDetailnum() {
		return detailnum;
	}

	public void setDetailnum(int detailnum) {
		this.detailnum = detailnum;
	}

	public int getReserved() {
		return reserved;
	}

	public void setReserved(int reserved) {
		this.reserved = reserved;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	
}
