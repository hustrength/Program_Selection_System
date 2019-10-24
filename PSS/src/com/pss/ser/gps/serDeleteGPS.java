package com.pss.ser.gps;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pss.dao.DaoGPS;
import com.pss.dao.DaoStu;
import com.pss.user.GPS;
import com.pss.user.Student;

@SuppressWarnings("serial")
public class serDeleteGPS extends HttpServlet {


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
        
        System.out.println("delete");
        String result="yes";
     
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String act=request.getParameter("action");
		System.out.println(act);
		
		GPS gps=null;
		if("break".equals(act)){
			//Ω‚…¢∂”ŒÈ
			int gno = Integer.parseInt(request.getParameter("GNo"));
			System.out.println(gno);
			DaoGPS querybygno = new DaoGPS();
			gps = querybygno.querybyGNo(gno);
			DaoGPS deleteGPS = new DaoGPS();
			int rs=0;
			rs=deleteGPS.deleteGPSbyGNo(gno);
			if(rs!=0){
				result="success";
				Student stu1,stu2,stu3;
				stu1=gps.getStu1();
				stu1.setSgroup(null);
				stu1.setSposition(null);
				DaoStu updateStu = new DaoStu();
				int rs_stu=0;
				rs_stu = updateStu.updateStu(stu1);
				if(rs_stu==0) result="fail";
				if(gps.getStu2()!=null){
					stu2=gps.getStu2(); 
					stu2.setSgroup(null);
					stu2.setSposition(null);
					rs_stu = updateStu.updateStu(stu2);
					if(rs_stu==0) result="fail";
				}
				if(gps.getStu3()!=null){
					stu3=gps.getStu3(); 
					stu3.setSgroup(null);
					stu3.setSposition(null);
					rs_stu = updateStu.updateStu(stu3);
					if(rs_stu==0) result="fail";
				}
				Student stu=(Student)session.getAttribute("student");
				stu.setSgroup(null);
				stu.setSposition(null);
				session.setAttribute("student",stu);
			}
			else{
				result="fail";
			}
			
			
		}
        response.getWriter().print(result);
	}

}
