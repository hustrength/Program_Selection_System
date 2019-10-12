package com.pss.ser.stu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pss.dao.DaoStu;
import com.pss.user.Student;

/**
 * Servlet implementation class serRegisterStu
 */
//@WebServlet("/serRegisterStu")
public class serRegisterStu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("HELLO");
		String act=request.getParameter("action");
		System.out.println(act);
		
		String result="yes";
		if("checkuserid".equals(act)){
			//验证学号是否被注册
			String id = request.getParameter("userid");
			System.out.println(id);
			DaoStu checkid = new DaoStu();
			Student stu = checkid.checkbyid(id);
			if(stu==null){
				result="true";
			}
			else{
				result="false";
			}
			response.getWriter().print(result);
		}
		else if("register".equals(act)){
			System.out.println("注册：");
			String sid = request.getParameter("userid_signup");
			
			String spassword = request.getParameter("password_signup");
			String susername = request.getParameter("username");
			System.out.println(sid);
			System.out.println(spassword);
			System.out.println(susername);
			String ssex = request.getParameter("sex");
			
			String sclass = request.getParameter("class");
		
			String sgroup = null;
			String sposition = null;
			Student newstu = new Student(sid, susername, spassword, ssex, sclass, sgroup,sposition);
			DaoStu insertstu = new DaoStu();
			int rs=insertstu.insertStu(newstu);
			if(rs==0){
				response.getWriter().print("fail");
			}
			else{
				response.getWriter().print("success");
			}
		}
		System.out.println(result);
	}

}
