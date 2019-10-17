/**
 * 
 */
package com.pss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pss.conn.Conn;
import com.pss.user.GPS;
import com.pss.user.Apply;
import com.pss.user.Student;

public class DaoApply {
	/**
	 * 插入一个申请单
	 * @param gps
	 * @return
	 */
	public int insertApply(Apply apply){
		int rs = 0;
		Connection conn=null;
		try{
			String applicant,leader;
			applicant=apply.getApplicant().getSNo();
			leader=apply.getLeader().getSNo();
			String sql_insert = "insert into apply(GNo,Applicant,Leader,Status) values(?,?,?,?);";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_insert);
			
			pst.setInt(1, apply.getGNo());
			pst.setString(2, applicant);
			pst.setString(3, leader);
			pst.setInt(4, 0);
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("insert over!");
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
	public int insertApply(int gno,String applicant,String leader){
		int rs = 0;
		Connection conn=null;
		try{
			String sql_insert = "insert into apply(GNo,Applicant,Leader,Status) values(?,?,?,?);";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_insert);
			pst.setInt(1, gno);
			pst.setString(2, applicant);
			pst.setString(3, leader);
			pst.setInt(4, 0);
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("insert over!");
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
	/*
	public Apply queryApply(int gno,String applicant,String leader){
		GPS gps=null;
		Connection conn = null;
		try{
			String sql_querybyid = "select * from gps where Gname=?";
			conn=new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_querybyid);
			pst.setString(1, Gname);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				int gno=rs.getInt("GNo");
				int pno = rs.getInt("PNo");
				String gname = rs.getString("Gname");
				String pname = rs.getString("Pname");
				String sno1 = rs.getString("SNo1");
				String sno2 = rs.getString("SNo1");
				String sno3 = rs.getString("SNo1");
				int gsnum = rs.getInt("Gsnum");
				int gleftnum = rs.getInt("Gleftnum");
				Student stu1,stu2,stu3;
				DaoStu querybyid = new DaoStu();
				stu1 = querybyid.querybyid(sno1);
				if(sno2!=null||sno2!=""){
					stu2 = querybyid.querybyid(sno2);
				}
				else stu2=null;
				if(sno3!=null||sno3!=""){
					stu3 = querybyid.querybyid(sno3);
				}
				else stu3=null;
				gps = new GPS(gno,pno,gname,pname,stu1,stu2,stu3,gsnum,gleftnum);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return gps;
	}*/
	public List<Apply> listApplybySNo(String sno){
		Connection conn = null;
		Apply apply=null;
		List<Apply> list  = new ArrayList<Apply>();
		try{
			String sql = "select* from apply where Leader=?";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			Student applicant,leader;
			DaoStu querybyid = new DaoStu();
			leader = querybyid.querybyid(sno);
			while(rs.next()){
				int ano=rs.getInt("ANo");
				int gno = rs.getInt("GNo");
				int status = rs.getInt("Status");
				String applicant_no = rs.getString("Applicant");
				applicant=querybyid.querybyid(applicant_no);
				apply=new Apply(ano,gno,applicant,leader,status);
				list.add(apply);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
}
