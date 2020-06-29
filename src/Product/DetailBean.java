package Product;

import java.sql.Date;
import java.sql.Time;

public class DetailBean {
	private int pronum, num, seat, reserved;
	private String place, time;
	Date date;
	
	public DetailBean() {
		
	}

	public DetailBean(int pronum, int num, int seat, int reserved, String place, Date date, String time) {
		this.pronum = pronum;
		this.num = num;
		this.seat = seat;
		this.reserved = reserved;
		this.place = place;
		this.date = date;
		this.time = time;
	}

	public int getPronum() {
		return pronum;
	}

	public void setPronum(int pronum) {
		this.pronum = pronum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	public int getReserved() {
		return reserved;
	}

	public void setReserved(int reserved) {
		this.reserved = reserved;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	
}
