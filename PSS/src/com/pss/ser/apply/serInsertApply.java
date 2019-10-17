package com.pss.ser.apply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoGPS;
import com.pss.dao.DaoApply;
import com.pss.user.GPS;
import com.pss.user.Project;
import com.pss.user.Student;
import com.pss.user.Apply;

/**
 * Servlet implementation class serInsertApply
 */
//@WebServlet("/serInsertApply")
public class serInsertApply extends HttpServlet {
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
		int rs;
		DaoApply insert = new DaoApply();
		Student applicant = (Student) session.getAttribute("student");
		String act=request.getParameter("action");
		if("apply".equals(act)){
			//¥¥Ω®…Í«Îµ•
			String sno = request.getParameter("SNo");
			System.out.println(sno);
			int gno = Integer.parseInt(request.getParameter("GNo"));
			System.out.println(gno);
			System.out.println(applicant.getSNo());
			rs=insert.insertApply(gno,applicant.getSNo(),sno);
			System.out.println(rs);
			if(rs==0){
				response.getWriter().print("fail");
			}
			else{
				response.getWriter().print("success");
			}
		}
	}

}
