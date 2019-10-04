package com.pss.user;

public class Teacher {
	private String TNo;
	private String Tname;
	private String Tpassword;
	public String getTNo() {
		return TNo;
	}
	public void setTNo(String tNo) {
		
		TNo = tNo;
	}
	public String getTname() {
		return Tname;
	}
	public void setTname(String tname) {
		Tname = tname;
	}
	public String getTpassword() {
		return Tpassword;
	}
	public void setTpassword(String tpassword) {
		Tpassword = tpassword;
	}
	/**
	 * @param tNo
	 * @param tname
	 * @param tpassword
	 */
	public Teacher(String tNo, String tname, String tpassword) {
		TNo = tNo;
		Tname = tname;
		Tpassword = tpassword;
	}
}
