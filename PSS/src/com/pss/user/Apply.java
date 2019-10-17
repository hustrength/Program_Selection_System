/**
 * 
 */
package com.pss.user;
import com.pss.user.Student;

public class Apply {
   private int ANo; //申请单编号
   private int GNo;  //队伍编号
   private Student Applicant; //申请人
   private Student Leader;  //被申请的队长
   private int Status; //申请单状态，0代表待处理，1表示同意，2表示拒绝
   
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
