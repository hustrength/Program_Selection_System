package com.pss.ser.apply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoApply;
import com.pss.user.Student;

import com.pss.dao.DaoGPS;
import com.pss.dao.DaoStu;
import com.pss.user.GPS;
import com.pss.user.Project;
import com.pss.user.Student;
import com.pss.user.Apply;
/**
 * Servlet implementation class serUpdateApply
 */
//@WebServlet("/serUpdateApply")
public class serUpdateApply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				response.setContentType("text/html;charset=utf-8");	
				HttpSession session = request.getSession(); 
				PrintWriter out = response.getWriter();
				
				DaoApply updateApply = new DaoApply();
				DaoGPS updateGPS=new DaoGPS();
				DaoStu updateStu=new DaoStu();
				Student leader = (Student) session.getAttribute("student");
				Student applicant=null;
				String act=request.getParameter("action");
				if("agree".equals(act)){
					//同意加入
					
					//查询申请学生，并设置该学生的组和组中身份
					String sno = request.getParameter("SNo");
					DaoStu querybyid=new DaoStu();
					applicant=querybyid.querybyid(sno);
					applicant.setSgroup(leader.getSgroup());
					applicant.setSposition("组员");
					
					//更新sql中申请学生的信息
					int rs1=0;
					rs1=updateStu.updateStu(applicant);
					
					//更新gps
					
					GPS gps=null;
					gps=updateGPS.querybyName(leader.getSgroup());
					if(gps.getStu2()!=null){
						gps.setStu3(applicant);
					}
					else{
						gps.setStu2(applicant);
					}
					int rs2=0;
					rs2=updateGPS.updateGPS(gps);
					
					//更新apply
					int rs3=0;
					rs3=updateApply.updatetApplyStatus(gps.getGNo(), gps.getGname(), sno, 0, 1);
					if(rs1==0||rs2==0||rs3==0){
						response.getWriter().print("fail");
					}
					else{
						response.getWriter().print("success");
					}
				}
	}

}
