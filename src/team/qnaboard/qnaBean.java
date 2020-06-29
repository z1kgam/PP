package team.qnaboard;

import java.util.Date;

public class qnaBean {
	
	private int qna_num;
	private String userId; 
	private String qna_cate; 
	private String qna_title; 
	private String qna_contents; 
//	private String qna_file; 
	private Date qna_date;
	private int qna_status;
	
	public qnaBean() {
		
	}
	
	//getter, setter �޼ҵ� ����
	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQna_cate() {
		return qna_cate;
	}

	public void setQna_cate(String qna_cate) {
		this.qna_cate = qna_cate;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_contents() {
		return qna_contents;
	}

	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}

//	public String getQna_file() {
//		return qna_file;
//	}
//
//	public void setQna_file(String qna_file) {
//		this.qna_file = qna_file;
//	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public int getQna_status() {
		return qna_status;
	}

	public void setQna_status(int qna_status) {
		this.qna_status = qna_status;
	}
	
	

}
