package member;

public class BasketBean {

	private int basketnum;
	private String id;
	private int num;
	private int numbers;
	private int validity;
	
	
	public BasketBean(int basketnum, String id, int num, int numbers, int validity) {
		super();
		this.basketnum = basketnum;
		this.id = id;
		this.num = num;
		this.numbers = numbers;
		this.validity = validity;
	}
	
	public int getBasketnum() {
		return basketnum;
	}
	public void setBasketnum(int basketnum) {
		this.basketnum = basketnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getNumbers() {
		return numbers;
	}
	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}
	public int getValidity() {
		return validity;
	}
	public void setValidity(int validity) {
		this.validity = validity;
	}
	
	
}
