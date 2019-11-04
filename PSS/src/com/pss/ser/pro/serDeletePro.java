package com.pss.ser.pro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.pss.dao.DaoPro;
import com.pss.user.Project;

public class serDeletePro extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public serDeletePro() {
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

		 String result="yes";
	     
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();
			String act=request.getParameter("action");
			System.out.println(act);
			
			Project pro=null;
			if("delete".equals(act)){
				//É¾³ý¿ÎÌâ
				int pno = Integer.parseInt(request.getParameter("PNo"));
			
				DaoPro daopro = new DaoPro();
				int rs=0;
				rs=daopro.deletePro(pno);
				if(rs!=0){
					result="success";
				}
				else{
					result="fail";
				}
				
				
			}
	        response.getWriter().print(result);
	}

}
