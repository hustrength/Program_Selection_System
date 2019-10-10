package com.pss.ser;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoStu;
import com.pss.dao.DaoTea;
import com.pss.user.Student;
import com.pss.user.Teacher;

@SuppressWarnings("serial")
public class serDoLogin extends HttpServlet {
	
	/**
	 * Constructor of the object.
	 */
	public serDoLogin() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		//response.setCharacterEncoding("utf-8");
		//response.setHeader("content-type","text/html;charset=utf-8");
		try{
			System.out.println("��̨");
			String username = request.getParameter("username");
			
			String password = request.getParameter("password");
			String type  = null;
			if(request.getParameter("type")!=null)
				type = request.getParameter("type");
			if(type.equals("tea")){//�ж�����ʦ
				Teacher tea = new Teacher(username,null,password);
				DaoTea logint = new DaoTea();
				tea = logint.loginTea(tea);
				if(tea!=null){
					session.setAttribute("teacher", tea);
                    String text="1";
					response.getWriter().print(text); 
				//	response.sendRedirect("/PSS/tea/teacher.jsp");
				}else{
                    String text="0";
					
					response.getWriter().print(text); 
				//	response.setHeader("refresh","2;url=/Ten/tea/teaLogin.jsp");
				}
			}else if(type.equals("stu")){	//?ж????????;
				
				Student stu = new Student(username,null,password,null,null,null,null,0);
				DaoStu logins  = new DaoStu();
				stu = logins.loginStu(stu);
				if(stu!=null){
				
					String text="1";
					
					response.getWriter().print(text); 
				
					session.setAttribute("student", stu);
					
				
					
				}else{
                    String text="0";
					
					response.getWriter().print(text); 
			
				}
			}else{
				out.println("?");
		
			}
		}catch(Exception e){ e.printStackTrace();response.sendRedirect("/PSS/Login.jsp");}
	
		}



}