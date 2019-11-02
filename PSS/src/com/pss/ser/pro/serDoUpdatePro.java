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

public class serDoUpdatePro extends HttpServlet {

	

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
		int rs;
		DaoPro daopro = new DaoPro();
		Project pro=null;
		String act=request.getParameter("action");
		if("update".equals(act)){
			//¸üÐÂ¿ÎÌâ
			int pno = Integer.parseInt(request.getParameter("PNo"));
			String pname = request.getParameter("Pname");
			int pmaxnum = Integer.parseInt(request.getParameter("Pmaxnum"));
			String intro = request.getParameter("Intro");
			String bg = request.getParameter("Bg");
			String info = request.getParameter("Info");
			String other = request.getParameter("Other");
			
			pro = daopro.querybypno(pno);
			pro.setPName(pname);
			pro.setPmaxnum(pmaxnum);
			pro.setIntroduction(intro);
			pro.setInfo(info);
			pro.setBackground(bg);
			pro.setOther(other);
			rs=daopro.updateProject(pro);
			if(rs==0){
				response.getWriter().print("fail");
			}
			else{
				response.getWriter().print("success");
			}
		}
	}

}
