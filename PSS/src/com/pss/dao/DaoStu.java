package com.pss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.pss.conn.Conn;
import com.pss.user.Student;

public class DaoStu {
	/**
	 * 学生登录
	 * @param stu
	 * @return
	 */
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
	
	/**
	 * 更新学生信息
	 * @param stu
	 * @return
	 */
	
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
	
	/**
	 * 删除某学生信息
	 * @param id
	 * @return
	 */
	public int deleteStu(String id){
		int rs = 0;
		try{
			String sql_delete = "delete from student where SNo=?;";//删除某学生
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
	
	/**
	 * 添加学生
	 * @param stu
	 * @return
	 */
	public int insertStu(Student stu){
		int rs = 0;
		Connection conn=null;
		try{
			String sql_insert = "insert into student(SNo,Sname,Spassword,Ssex,Sclass,Sgroup,Sposition) values(?,?,?,?,?,?,?);";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_insert);
			pst.setString(1, stu.getSNo());
			pst.setString(2, stu.getSname());
			pst.setString(3, stu.getSpassword());
			pst.setString(4, stu.getSsex());
			pst.setString(5, stu.getSclass());
			pst.setString(6, stu.getSgroup());
			pst.setString(7, stu.getSposition());
			
			
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("Student_id"+stu.getSNo()+"insert over!");
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return rs;
	}
	
	/**
	 * 根据id查询是否有此学生
	 * @param id
	 * @return
	 */
	public Student querybyid(String id){
		Student stu=null;
		Connection conn = null;
		try{
			String sql_querybyid = "select * from student where SNo=?";
			conn=new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_querybyid);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				stu = new Student(rs.getString("SNo"),rs.getString("Sname"),rs.getString("Spassword"),rs.getString("Ssex"),rs.getString("Sclass"),
						rs.getString("Sgroup"),rs.getString("Sposition"));
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return stu;
	}
	
}