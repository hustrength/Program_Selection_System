package com.pss.user;
/**
 * 
 * ����
 *
 */
public class Project {
	private int PNo;  //������
	private String  Pname; //��������
	private int Pmaxnum;  //�����ѡ��������
	private int Pselected;  //�����ѱ�ѡ����
	private int Pavailable;  //����ʣ���ѡ����
	private String introduction;
	private String background;
	private String info;
	private String other;
	
	
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
    
	public Project(int pno,String pname,int pmaxnum,int pselected,int pavailable){
		this.PNo=pno;
		this.Pname=pname;
		this.Pmaxnum=pmaxnum;
		this.Pselected=pselected;
		this.Pavailable=pavailable;
	}
}
