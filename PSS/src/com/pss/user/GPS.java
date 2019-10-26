package com.pss.user;
import com.pss.user.Student;
/**
 * 
 * �飬���⣬ѧ����ϵ
 *
 */
public class GPS {
	private int GNo; //�ӱ��
	private int PNo; //������
	private String Gname; //����
	private String Pname; //������
	private Student Stu1; //�ӳ�1��
	private Student Stu2; //��Ա2��
	private Student Stu3; //��Ա3��
	private int Gsnum; //������������
	private int Gleftnum;  //����ʣ��ɼ�����
	
	public int getGNo(){
		return GNo;
	}
	public void setGNo(int gno){
		GNo=gno;
	}
	
	public int getPNo(){
		return PNo;
	}
	public void setPNo(int pno){
		PNo=pno;
	}
	
	public String getGname(){
		return Gname;
	}
	public void setGname(String gname){
		Gname=gname;
	}
	
	public String getPname(){
		return Pname;
	}
	public void setPname(String pname){
		Gname=pname;
	}
	
	public Student getStu1(){
		return Stu1;
	}
	public void setStu1(Student stu){
		Stu1=stu;
	}
	
	public Student getStu2(){
		return Stu2;
	}
	public void setStu2(Student stu){
		Stu2=stu;
		if(stu!=null){
			Gleftnum-=1;
		}
	}
	
	public Student getStu3(){
		return Stu3;
	}
	public void setStu3(Student stu){
		Stu3=stu;
		if(stu!=null){
			Gleftnum-=1;
		}
	}
	
	public int getGsnum(){
		return Gsnum;
	}
	public void setGsnum(int gsnum){
		Gsnum=gsnum;
	}
	
	public int getGleftnum(){
		return Gleftnum<0?0:Gleftnum;
	}
	public void setGleftnum(int gleftnum){
		Gleftnum=gleftnum>3?3:gleftnum;
	}
	
	public GPS(int gno,int pno,String gname,String pname,Student stu1,Student stu2,Student stu3,int gsnum,int gleftnum){
		this.GNo=gno;
		this.PNo=pno;
		this.Gname=gname;
		this.Pname=pname;
		this.Stu1=stu1;
		this.Stu2=stu2;
		this.Stu3=stu3;
		this.Gsnum=gsnum;
		this.Gleftnum=gleftnum;
	}
	
	public GPS(int gno,int pno,String gname,String pname,Student stu1,Student stu2,Student stu3){
		this.GNo=gno;
		this.PNo=pno;
		this.Gname=gname;
		this.Pname=pname;
		this.Stu1=stu1;
		this.Stu2=stu2;
		this.Stu3=stu3;
		this.Gsnum=3;
		this.Gleftnum=0;
	}
	
	public GPS(int gno,int pno,String gname,String pname,Student stu1,Student stu2){
		this.GNo=gno;
		this.PNo=pno;
		this.Gname=gname;
		this.Pname=pname;
		this.Stu1=stu1;
		this.Stu2=stu2;
		this.Gsnum=2;
		this.Gleftnum=0;
	}
	public GPS(int gno,int pno,String gname,String pname,Student stu1,int gsnum){
		this.GNo=gno;
		this.PNo=pno;
		this.Gname=gname;
		this.Pname=pname;
		this.Stu1=stu1;
		this.Stu2=null;
		this.Stu3=null;
		this.Gsnum=gsnum;
		this.Gleftnum=gsnum-1;
	}
	public GPS(int pno,String gname,String pname,Student stu1,int gsnum){
		this.PNo=pno;
		this.Gname=gname;
		this.Pname=pname;
		this.Stu1=stu1;
		this.Stu2=null;
		this.Stu3=null;
		this.Gsnum=gsnum;
		this.Gleftnum=gsnum-1;
	}

}
