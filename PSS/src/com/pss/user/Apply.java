/**
 * 
 */
package com.pss.user;
import com.pss.user.Student;

public class Apply {
   private int ANo; //���뵥���
   private int GNo;  //������
   private String Gname;  //������Ķ�������
   private Student Applicant; //������
   private int Status; //���뵥״̬��0���������1��ʾͬ�⣬2��ʾ�ܾ�
   
   public int getANo(){
	   return ANo;
   }
   public void setANo(int ano){
	   ANo=ano;
   }
   
   public int getGNo(){
	   return GNo;
   }
   public void setGNo(int gno){
	   GNo=gno;
   }
   
   public Student getApplicant(){
	   return Applicant;
   }
   public void setApplicant(Student applicant){
	   Applicant=applicant;
   }
   
   public String getGname(){
	   return Gname;
   }
   public void setGname(String gname){
	   Gname=gname;
   }
   
   public int getStatus(){
	   return Status;
   }
   public void setStatus(int status){
	  Status=status;
   }
   
   public Apply(int gno,String gname, Student applicant,int status){
	   this.GNo=gno;
	   this.Applicant=applicant;
	   this.Gname=gname;
	   this.Status=status;
   }
   public Apply(int ano,int gno,String gname, Student applicant,int status){
	   this.ANo=ano;
	   this.GNo=gno;
	   this.Applicant=applicant;
	   this.Gname=gname;
	   this.Status=status;
   }
}
