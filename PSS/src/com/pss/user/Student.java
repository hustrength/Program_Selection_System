package com.pss.user;

public class Student {
	private String SNo;//学号
	private String Sname;//姓名
	private String Spassword;//密码
	private String Ssex;//性别
	private String Sclass;//班级
	private String Sgroup;//组名
	private String Sposition;//组长/组员
	private int Sscore;//得分
	

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
	
	
    
	public int getSscore() {
		return Sscore;
	}
	
	public void setSscore(int sscore) {
		Sscore = sscore;
	}
	
	
	/**
	 * @param sNo
	 * @param sname
	 * @param spassword
	 * @param sclass
	 * @param ssex
	 */
	public Student(String sNo, String sname, String spassword, String ssex, String sclass, String sgroup,
			String sposition,int sscore) {
		SNo = sNo;
		Sname = sname;
		Spassword = spassword;
		Ssex = ssex;
		Sclass = sclass;
		Sgroup = sgroup;
		Sposition = sposition;
		Sscore = sscore;
	}
	public Student(String sNo, String sname, String spassword, String ssex, String sclass, String sgroup,
			String sposition) {
		this.SNo = sNo;
		this.Sname = sname;
		this.Spassword = spassword;
		this.Ssex = ssex;
		this.Sclass = sclass;
		this.Sgroup = sgroup;
		this.Sposition = sposition;
		Sscore = 0;
	}



}
