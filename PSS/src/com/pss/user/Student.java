package com.pss.user;

public class Student {
	private String SNo;
	private String Sname;
	private String Spassword;
	private String Ssex;
	private String Sclass;
	private String Sgroup;
	private String Sposition;
	private int Sscore;
	

	public String getSNo() {
		return SNo;
	}


	public void setSNo(String sNo) {
		SNo = sNo;
	}


	public String getSname() {
		return Sname;
	}


	public void setSname(String sname) {
		Sname = sname;
	}


	public String getSpassword() {
		return Spassword;
	}


	public void setSpassword(String spassword) {
		Spassword = spassword;
	}
	
	public String getSsex() {
		return Ssex;
	}


	public void setSsex(String ssex) {
		Spassword = ssex;
	}
	
	public String getSclass() {
		return Sclass;
	}


	public void setSclass(String sclass) {
		Sclass = sclass;
	}

	public String getSgroup() {
		return Sgroup;
	}


	public void setSgroup(String sgroup) {
		Sgroup = sgroup;
	}


	public String getSposition() {
		return Sposition;
	}


	public void setSposition(String sposition) {
		Sposition = sposition;
	}
	
	
    
	public float getSscore() {
		return Sscore;
	}
	
	public void setSscore(int sscore) {
		Sscore = sscore;
	}
	
	
	public float getScredit() {
		return Scredit;
	}
	
	public void setScredit(float scredit) {
		Scredit = scredit;
	}
	
	/**
	 * @param sNo
	 * @param sname
	 * @param spassword
	 * @param sclass
	 * @param ssex
	 */
	public Student(String sNo, String sname, String spassword, String sgroup,
			String sposition,float scredit) {
		SNo = sNo;
		Sname = sname;
		Spassword = spassword;
		Sgroup = sgroup;
		Sposition = sposition;
		Scredit = scredit;
	}
	public Student( String sname, String spassword, String sgroup,
			String sposition,float scredit) {
		this.Sname = sname;
		this.Spassword = spassword;
		this.Sgroup = sgroup;
		this.Sposition = sposition;
		this.Scredit = scredit;
	}


	


	
	

}
