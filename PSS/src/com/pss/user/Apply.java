/**
 * 
 */
package com.pss.user;
import com.pss.user.Student;

public class Apply {
   private int ANo; //���뵥���
   private int GNo;  //������
   private Student Applicant; //������
   private Student Leader;  //������Ķӳ�
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
   
   public Student getLeader(){
	   return Leader;
   }
   public void setLeader(Student leader){
	   Leader=leader;
   }
   
   public int getStatus(){
	   return Status;
   }
   public void setStatus(int status){
	  Status=status;
   }
   
   public Apply(int gno,Student applicant,Student leader,int status){
	   this.GNo=gno;
	   this.Applicant=applicant;
	   this.Leader=leader;
	   this.Status=status;
   }
   public Apply(int ano,int gno,Student applicant,Student leader,int status){
	   this.ANo=ano;
	   this.GNo=gno;
	   this.Applicant=applicant;
	   this.Leader=leader;
	   this.Status=status;
   }
}
