package com.pss.user;
/**
 * 
 * 课题
 *
 */
public class Project {
	private int PNo;  //课题编号
	private String  Pname; //课题名字
	private int Pmaxnum;  //课题可选上限组数
	private int Pselected;  //课题已被选组数
	private int Pavailable;  //课题剩余可选组数
	private String Introduction;
	private String Background;
	private String Info;
	private String Other;
	
	
	public int getPNo(){
		return PNo;
	}
	public void setPNo(int pno){
		PNo=pno;
	}
	
	public String getPname(){
		return Pname;
	}
	public void setPName(String pname){
		Pname=pname;
	}
	
	public int getPmaxnum(){
		return Pmaxnum;
	}
	public void setPmaxnum(int pmaxnum){
		Pmaxnum=pmaxnum;
		Pavailable=pmaxnum-Pselected;
	}
	
	public int getPselected(){
		return Pselected;
	}
	public void setPselected(int pselected){
		Pselected=pselected;
		Pavailable=Pmaxnum-pselected;
	}
	
	public int getPavailable(){
		return Pavailable;
	}
	public void setPavailable(int pavailable){
		Pavailable=pavailable;
		Pselected=Pmaxnum-pavailable;
	}
	
	public String getIntroduction(){
		return Introduction;
	}
	public void setIntroduction(String introduction){
		Introduction=introduction;
	}
	
	public String getBackground(){
		return Background;
	}
	public void setBackground(String background){
		Background=background;
	}
	
	public String getInfo(){
		return Info;
	}
	public void setInfo(String info){
		Info=info;
	}
	
	public String getOther(){
		return Other;
	}
	public void setOther(String other){
		Other=other;
	}
	
	public Project(int pno,String pname,int pmaxnum,int pselected,int pavailable,String intro,String bg,String info,String other){
		this.PNo=pno;
		this.Pname=pname;
		this.Pmaxnum=pmaxnum;
		this.Pselected=pselected;
		this.Pavailable=pavailable;
		this.Introduction=intro;
		this.Background=bg;
		this.Info=info;
		this.Other=other;
	}
	public Project(int pno,String pname,int pmaxnum,int pselected,int pavailable){
		this.PNo=pno;
		this.Pname=pname;
		this.Pmaxnum=pmaxnum;
		this.Pselected=pselected;
		this.Pavailable=pavailable;
	}
	  
}
