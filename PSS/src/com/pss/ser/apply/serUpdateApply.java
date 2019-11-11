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
				//��ѯ����ѧ��
				String sno = request.getParameter("SNo");
				DaoStu querybyid=new DaoStu();
				applicant=querybyid.querybyid(sno);
				//ѧ���Ѽ���������
				if(applicant.getSgroup()!=null&&applicant.getSgroup()!=""){
					response.getWriter().print("ismember");
					return;
				}
				if("agree".equals(act)){
					//ͬ�����
					
					//����ѧ�����
					applicant.setSgroup(leader.getSgroup());
					applicant.setSposition("��Ա");
					
					//����sql������ѧ������Ϣ
					int rs1=0;
					rs1=updateStu.updateStu(applicant);
					
					//����gps
					
					GPS gps=null;
					gps=updateGPS.querybyName(leader.getSgroup());
					if(gps.getStu2()!=null){
						gps.setStu3(applicant);
					}
					else{
						gps.setStu2(applicant);
					}
					int rs2=0;
					gps.setGleftnum(gps.getGleftnum()-1);
					rs2=updateGPS.updateGPS(gps);
					//ɾ��apply
					int rs3=0;
					DaoApply delete = new DaoApply();
					rs3 = delete.deleteApply(applicant.getSNo());
					if(rs1==0||rs2==0||rs3==0){
						response.getWriter().print("fail");
					}
					else{
						response.getWriter().print("success");
					}
					
				}
				else if("refuse".equals(act)){
					//�ܾ�
					System.out.println("refuse");
					GPS gps=null;
					gps=updateGPS.querybyName(leader.getSgroup());
					System.out.println(gps.getGname());
					//����apply
					int rs3=0;
					rs3=updateApply.updatetApplyStatus(gps.getGNo(), 2);
					if(rs3==0){
						response.getWriter().print("fail");
					}
					else{
						response.getWriter().print("success");
					}
				}
	}

}
