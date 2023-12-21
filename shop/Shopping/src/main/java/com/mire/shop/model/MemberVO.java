package com.mire.shop.model;


public class MemberVO {
	private int no;
	private String id;
	private String passwd;
	private String name;
	private String phone;
	private String regDate;
	
	
	
	
	public int getNo() {
		return no;
	}




	public void setNo(int no) {
		this.no = no;
	}




	public String getId() {
		return id;
	}




	public void setId(String id) {
		this.id = id;
	}




	public String getPasswd() {
		return passwd;
	}




	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public String getRegDate() {
		return regDate;
	}




	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}




	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", id=" + id + ", passwd=" + passwd + ", name=" + name + ", phone=" + phone
				+ ", regDate=" + regDate + "]";
	}
	
}


