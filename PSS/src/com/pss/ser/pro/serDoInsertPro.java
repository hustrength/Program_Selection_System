package com.pss.ser.pro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoGPS;
import com.pss.dao.DaoPro;
import com.pss.dao.DaoStu;
import com.pss.user.GPS;
import com.pss.user.Project;
import com.pss.user.Student;

public class serDoInsertPro extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public serDoInsertPro() {
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
		String result="fail";
		int rs;
		DaoPro insert = new DaoPro();
		Project pro=null;
		String act=request.getParameter("action");
		if("create".equals(act)){
			//创建课题
			String pname = request.getParameter("Pname");
			
			int pmaxnum = Integer.parseInt(request.getParameter("Pmaxnum"));
			String intro = request.getParameter("Intro");
			String bg = request.getParameter("Bg");
			String info = request.getParameter("Info");
			String other = request.getParameter("Other");
			pro = new Project(pname,pmaxnum,0,pmaxnum,intro,bg,info,other);
			rs=insert.insertProject(pro);
			if(rs==0){
				response.getWriter().print("fail");
			}
			else{
				response.getWriter().print("success");
			}
		}
		if("getremain".equals(act)){
			//获取剩余组数
			int pno = Integer.parseInt(request.getParameter("PNo"));
			int remain=0;
			DaoPro daopro = new DaoPro();
			pro=daopro.querybypno(pno);
			if(pro==null){
				result="can't find";
			}
			else{
				remain=pro.getPavailable();
				result=String.valueOf(remain);
				
			}
			System.out.println(result);
			response.getWriter().print(remain);
		}
	}

}
