package com.pss.ser.gps;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoQuery;
import com.pss.dao.DaoGPS;
import com.pss.dao.DaoStu;
import com.pss.user.Student;
import com.pss.user.GPS;

public class serQueryGPS extends HttpServlet {

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
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String act=request.getParameter("action");
		String result="yes";
		GPS gps=null;
		if("checkGname".equals(act)){
			//验证学号是否被注册
			String gname = request.getParameter("Gname");
			System.out.println(gname);
			DaoGPS querybyname = new DaoGPS();
			gps = querybyname.querybyName(gname);
			if(gps==null){
				result="true";
			}
			else{
				result="false";
			}
			response.getWriter().print(result);
		}
	}


}
