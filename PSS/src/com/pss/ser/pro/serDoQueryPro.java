package com.pss.ser.pro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoPro;
import com.pss.user.Project;

/**
 * Servlet implementation class serDoQueryPro
 */

public class serDoQueryPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public serDoQueryPro() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String act=request.getParameter("action");
		String result="yes";
		System.out.println(result);
		Project pro=null;
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
			}
			System.out.println(remain);
			response.getWriter().print(remain);
		}
	}

}
