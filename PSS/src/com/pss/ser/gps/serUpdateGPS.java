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

public class serUpdateGPS extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public serUpdateGPS() {
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
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String act=request.getParameter("action");
		
		String result="yes";
		GPS gps=null;
		DaoGPS updateGPS = new DaoGPS();
		DaoStu updateStu = new DaoStu();
		int gno = Integer.parseInt(request.getParameter("GNo"));
		String sno = request.getParameter("SNo");
		
		DaoGPS querybygno = new DaoGPS();
		gps = querybygno.querybyGNo(gno);
		
		if("remove".equals(act)){
			//踢出队员
			Student stu_removed = null;
			if(sno.equals(gps.getStu2().getSNo())){
				stu_removed=gps.getStu2();
				gps.setStu2(gps.getStu3());
			}
			else if(gps.getStu3()!=null&&sno.equals(gps.getStu3().getSNo())){
				stu_removed=gps.getStu3();
			}
			else {
				response.getWriter().print("fail");
			}
			System.out.println(stu_removed.getSNo());
				gps.setStu3(null);
				gps.setGleftnum(gps.getGleftnum()+1);
				int rs=0;
				rs=updateGPS.updateGPS(gps);
				System.out.println(rs);
				if(rs!=0){
					result="success";
					stu_removed.setSgroup("");
					stu_removed.setSposition("");
					int rs_updatestu=0;
					
					rs_updatestu=updateStu.updateStu(stu_removed);
					
					if(rs_updatestu!=0){
						result="success";
						Student stu=(Student)session.getAttribute("student");
						if(stu.getSNo().equals(stu_removed.getSNo()))
						session.setAttribute("student",stu_removed);
					}
					else result="fail";
				}
				else result="fail";
		}
		else if("transfer".equals(act)){
			//转让队长
			Student stu=(Student)session.getAttribute("student");
			Student new_leader=null;
			if(sno.equals(gps.getStu2().getSNo())){
				new_leader=gps.getStu2();
				stu.setSposition("组员");
				gps.setStu2(stu);
			}
			else if(sno.equals(gps.getStu3().getSNo())){
				new_leader=gps.getStu3();
				stu.setSposition("组员");
				gps.setStu3(stu);
			}
			new_leader.setSposition("组长");
			gps.setStu1(new_leader);
			int rs=0;
			rs=updateGPS.updateGPS(gps);
			if(rs!=0){
				result="success";
				int rs1,rs2;
				rs1=updateStu.updateStu(new_leader);
				rs2=updateStu.updateStu(stu);
				if(rs1!=0&&rs2!=0){
					result="success";
					session.setAttribute("student",stu);
				}
				else result="fail";
			}
			else result="fail";
		}
        response.getWriter().print(result);
	}

}
