package com.pss.ser.noti;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoNoti;
import com.pss.user.Notification;

/**
 * Servlet implementation class serUpdateNoti
 */
@WebServlet("/serUpdateNoti")
public class serUpdateNoti extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		HttpSession session = request.getSession(); 
		PrintWriter out = response.getWriter();
		int rs;
		DaoNoti dao = new DaoNoti();
		Notification noti=null;
		String act=request.getParameter("action");
		if("update".equals(act)){
			//更新通知
			
			String title = request.getParameter("title");
			
			String content = request.getParameter("content");
			noti=new Notification(title,content);
			
			rs=dao.updateNoti(noti);
			if(rs==0){
				response.getWriter().print("fail");
			}
			else{
				response.getWriter().print("success");
			}
		}
	}

}
