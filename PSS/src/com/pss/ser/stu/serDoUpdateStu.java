package com.pss.ser.stu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoStu;
import com.pss.user.Student;

@SuppressWarnings("serial")
public class serDoUpdateStu extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public serDoUpdateStu() {
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
		String act=request.getParameter("action");
		String result="yes";
		if("change_password".equals(act)){
			//¸ÄÃÜÂë
			String pw_new = request.getParameter("pw_new");
			System.out.println(pw_new);
			DaoStu update = new DaoStu();
			Student stu = (Student) session.getAttribute("student");
			stu.setSpassword(pw_new);
			int rs=update.updateStu(stu);
			if(rs!=0){
				result="success";
			}
			else{
				result="fail";
			}
			response.getWriter().print(result);
		}
		else if("register".equals(act)){
			System.out.println("×¢²á£º");
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
