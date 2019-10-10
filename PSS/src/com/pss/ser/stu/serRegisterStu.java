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
		}
		response.getWriter().print(result); 
		System.out.println(result);
	}

}
