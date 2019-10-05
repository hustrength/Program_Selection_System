package com.pss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.pss.conn.Conn;
import com.pss.user.Student;

public class DaoStu {
	/**
	 * 学生登录
	 * **/
	public Student loginStu(Student stu){
		Student stu1 = null;
		String sql_loginS="select * from student where SNo=? and Spassword=?;";
		try{
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_loginS);
			pst.setString(1, stu.getSNo());
			pst.setString(2,stu.getSpassword());
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				stu1 = new Student(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),0);
				System.out.println("student login select over");
			}
		}catch(Exception e){e.printStackTrace();}
		return stu1;
	}
	
	
	
	/*
	 * 查询所有学生
	 * */
	public List<Student> selectStu1(){
		List<Student> list = null;
		try{
			String sql_select = "select student.sno as SNo,Sname,Spassword,Sclass,Ssex,sum(course.ccredit) as Scredit from student,sc,course" +
								"	where student.sno=sc.sno" +
								"		and sc.cno=course.cno" +
								"		 group by student.sno;";//锟斤拷询全锟斤拷学锟斤拷锟斤拷息+学锟斤拷学锟斤拷;//锟斤拷询锟斤拷锟叫碉拷sql锟斤拷锟�
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_select);
			ResultSet rs = pst.executeQuery();
			list = new ArrayList<Student>();
			while(rs.next()){				
				Student stu = new Student(rs.getInt("SNo"),rs.getString("Sname"),rs.getString("Spassword"),rs.getString("Sclass")
						,rs.getString("Ssex"),rs.getFloat("Scredit"));
				list.add(stu);
			}
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	/*
	 * 锟斤拷询锟斤拷锟斤拷学锟斤拷
	 * */
	public List<Student> selectStu(){
		List<Student> list = null;
		try{
			String sql_select = "select SNo,Sname,Spassword,Sclass,Ssex from student;";//锟斤拷询全锟斤拷学锟斤拷锟斤拷息+学锟斤拷学锟斤拷;//锟斤拷询锟斤拷锟叫碉拷sql锟斤拷锟�
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_select);
			ResultSet rs = pst.executeQuery();
			list = new ArrayList<Student>();
			DaoCou scredit = new DaoCou();
			while(rs.next()){				
				Student stu = new Student(rs.getInt("SNo"),rs.getString("Sname"),rs.getString("Spassword"),rs.getString("Sclass")
						,rs.getString("Ssex"), scredit.selectScre(rs.getInt("SNo")));
				list.add(stu);
			}
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	/*
	 * 锟斤拷询学锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟窖э拷锟�
	 * */
	public Iterator<Student> selectSum(){
		List<Student> list = null;
		Iterator<Student> listall = null;
		try{
			String sql_select = "select student.sno as SNo,Sname,Spassword,Sclass,Ssex,sum(course.ccredit) as Scredit from student,sc,course" +
								"	where student.sno=sc.sno" +
								"		and sc.cno=course.cno" +
								"		 group by student.sno;";//锟斤拷询全锟斤拷学锟斤拷锟斤拷息+学锟斤拷学锟斤拷筛选锟斤拷锟斤拷学锟街诧拷锟斤拷锟�
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_select);
			ResultSet rs = pst.executeQuery();
			list = new ArrayList<Student>();
			while(rs.next()){				
				Student stu = new Student(rs.getInt("SNo"),rs.getString("Sname"),rs.getString("Spassword"),rs.getString("Sclass")
						,rs.getString("Ssex"),rs.getFloat("Scredit"));
				list.add(stu);
			}
			listall = list.iterator();
		}catch(Exception e){e.printStackTrace();}
		return listall;
	}
	/*
	 * 锟斤拷询学锟斤拷锟斤拷学锟斤拷_某位学锟斤拷
	 * */
	public Student selectScre(Student stu){
		ResultSet rs = null;
		try{
			String sql_insert = "select student.sno as sno,sum(course.ccredit) as scredit from student,sc,course" +
			"	where student.sno=sc.sno" +
			"		and sc.cno=course.cno" +
			"		 and student.sno=?";//锟斤拷询某位同学学锟斤拷
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_insert);
			pst.setInt(1,stu.getSNo());
			rs = pst.executeQuery();
			if(rs.next()){
				System.out.println("Student_id"+stu.getSNo()+"select one over!");
				stu = new Student(rs.getInt("sno"),null,null,null,null,rs.getFloat("scredit"));	
			}
		}catch(Exception e){e.printStackTrace();}
		return stu;
	}
	/*
	 * 锟斤拷询某锟斤拷锟斤拷学锟斤拷
	 * */
	public Student selectStu(int id){
		Student Stu = null;
		try{
			String sql_selectone = "select * from student where SNo=?";//锟斤拷询某一锟斤拷锟轿筹拷
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_selectone);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				Stu = new Student(rs.getInt("SNo"),rs.getString("Sname"),rs.getString("Spassword"),rs.getString("Sclass")
						,rs.getString("Ssex"),0);
			}
		}catch(Exception e){e.printStackTrace();}
		return Stu;
	}
	/*
	 * 锟斤拷询某锟斤拷学锟斤拷锟斤拷息锟斤拷模锟斤拷锟斤拷询锟斤拷
	 * */
	public Iterator<Student> selectStu(String aa){//aa锟斤拷为模锟斤拷锟斤拷询锟侥关硷拷锟斤拷
		List<Student> list = null;
		Iterator<Student> listall = null;
		try{
			String sql_selectfuz = "select * from student where CNo=? or....";//fuzzy query模锟斤拷锟斤拷询
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_selectfuz);
			ResultSet rs = pst.executeQuery();
			list = new ArrayList<Student>();
			while(rs.next()){
				Student stu = new Student(rs.getInt("SNo"),rs.getString("Sname"),rs.getString("Spassword"),rs.getString("Sclass")
						,rs.getString("Ssex"),0);
				list.add(stu);
			}
			listall = list.iterator();
		}catch(Exception e){e.printStackTrace();}
		return listall;
	}
	/*
	 * 修改某个学生信息
	 * */
	public int updateStu(Student stu){
		int rs = 0;
		try{
			String sql_update = "update Student set Sname=?,Spassword=?,Ssex=?,Sclass=?,Sgroup=?,Sposition=? where SNo=?;";//修改一条学生信息
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_update);
			pst.setString(1, stu.getSname());
			pst.setString(2, stu.getSpassword());
			pst.setString(3, stu.getSsex());
			pst.setString(4, stu.getSclass());
			pst.setString(5, stu.getSgroup());
			pst.setString(6, stu.getSposition());
			pst.setString(7, stu.getSNo());
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("Student_id"+stu.getSNo()+"update over!");
			}
		}catch(Exception e){e.printStackTrace();}
		return rs;
	}
	/*
	 * 删除某个学生信息
	 * */
	public int deleteStu(String id){
		int rs = 0;
		try{
			String sql_delete = "delete from student where SNo=?;";//删锟斤拷一锟斤拷锟轿筹拷锟斤拷息
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_delete);
			pst.setString(1, id);
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("Student_id"+id+"delete over!");
			}
		}catch(Exception e){e.printStackTrace();}
		return rs;
	}
	/*
	 * 添加一位学生信息
	 * */
	public int insertStu(Student stu){
		int rs = 0;
		try{
			String sql_insert = "insert into student(Sname,Spassword,Ssex,Sclass,Sgroup,Sposition,Sno) values(?,?,?,?,?,?,?);";//锟斤拷锟揭伙拷锟斤拷纬锟斤拷锟较�
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_insert);
			pst.setString(1, stu.getSname());
			pst.setString(2, stu.getSpassword());
			pst.setString(3, stu.getSsex());
			pst.setString(4, stu.getSclass());
			pst.setString(5, stu.getSgroup());
			pst.setString(6, stu.getSposition());
			pst.setString(7, stu.getSNo());
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("Student_id"+stu.getSNo()+"insert over!");
			}
		}catch(Exception e){e.printStackTrace();}
		return rs;
	}
	
	
}