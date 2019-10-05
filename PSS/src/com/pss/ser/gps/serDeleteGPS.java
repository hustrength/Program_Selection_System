package com.pss.ser.gps;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoGPS;
import com.pss.user.Student;

@SuppressWarnings("serial")
public class serDeleteGPS extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public serDeleteGPS() {
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
/***************************************************************/
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		Student stu = null;
		if(session.getAttribute("student")==null){
			response.sendRedirect("../Login.jsp");
		}else{
			stu = (Student) session.getAttribute("student");
			out.println("Welcome SNO:"+stu.getSNo());
/***************************************************************/
			response.setContentType("text/html;charset=utf-8");		
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
			out.println("  <BODY>");
			try{
				int sno = stu.getSNo();
				int cno = Integer.parseInt(request.getParameter("cno"));
				DaoGPS delete = new DaoGPS();
				int rs = delete.deleteSc(sno, cno);
				if(rs!=0) {
					System.out.println("Sc one delete over!!");
					out.println("<h2><center>�ɹ�ȡ��ѡ��</center></h2>");
				}else out.println("<h2><center>������ϣ� �����ԣ�</center></h2>");
				//response.setHeader("refresh", "2;url=../stu/showCou.jsp");
				response.sendRedirect("../stu/showCou.jsp");
			}catch(Exception e){e.printStackTrace();}
		}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
