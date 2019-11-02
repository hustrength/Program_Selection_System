package com.pss.ser.tea;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoTea;
import com.pss.user.Teacher;

/**
 * Servlet implementation class serUpdateTea
 */

public class serUpdateTea extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * Constructor of the object.
	 */
	public serUpdateTea() {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String act=request.getParameter("action");
		String result="yes";
		if("change_password".equals(act)){
			//¸ÄÃÜÂë
			String pw_new = request.getParameter("pw_new");
			System.out.println(pw_new);
			DaoTea update = new DaoTea();
			Teacher tea = (Teacher) session.getAttribute("teacher");
			tea.setTpassword(pw_new);
			int rs=update.updateTea(tea);
			if(rs!=0){
				result="success";
			}
			else{
				result="fail";
			}
			response.getWriter().print(result);
		}
	}

}
