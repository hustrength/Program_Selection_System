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
		
		try{
			
			String username = request.getParameter("userid_signin");
			
			String password = request.getParameter("password_signin");
			String status  = null;
			if(request.getParameter("status")!=null)
				status = request.getParameter("status");
			if(status.equals("tea")){//老师登录
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
			}else if(status.equals("stu")){	//学生登录
				
				Student stu = null;
				DaoStu querybyid  = new DaoStu();
				String result="-1";
				stu = querybyid.querybyid(username);
				
				if(stu==null){
					result="0";
					
				}
				else if(stu!=null){
				    if(password.equals(stu.getSpassword())){
				    	result="2";
				    	if(session.getAttribute("student")!=null)
				    	   session.removeAttribute("student");
						session.setAttribute("student",stu);
						
				    }
				    else{
				    result="1";
				    
				    }
				}
				response.getWriter().print(result); 
			}
		}
		 catch(Exception e){ e.printStackTrace();response.sendRedirect("/PSS/stu/Login.jsp");}
	
		}



}