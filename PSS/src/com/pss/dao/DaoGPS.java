package com.pss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.pss.conn.Conn;
import com.pss.user.GPS;
import com.pss.user.Student;
import com.pss.dao.DaoStu;

public class DaoGPS {
	
	/**
	 * 获取所有gps
	 * @return
	 */
	public List<GPS> listAllGPS(){
		Connection conn = null;
		GPS gps=null;
		List<GPS> list  = new ArrayList<GPS>();
		try{
			
			String sql = "select* from gps";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
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
				
				list.add(gps);
				
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
	
	/**
	 * 插入一个队伍课题学生信息（GPS）
	 * @param gps
	 * @return
	 */
	public int insertGPS(GPS gps){
		int rs = 0;
		
		Connection conn=null;
		try{
			String sno2,sno3;
			if(gps.getStu2()==null){
				sno2="";
			}
			else{
				sno2=gps.getStu2().getSNo();
			}
			if(gps.getStu3()==null){
				sno3="";
			}
			else{
				sno3=gps.getStu3().getSNo();
			}
			String sql_insert = "insert into gps(Gname,PNo,Pname,SNo1,SNo2,SNo3,Gsnum,Gleftnum) values(?,?,?,?,?,?,?,?);";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_insert);
			pst.setString(1, gps.getGname());
			pst.setInt(2, gps.getPNo());
			pst.setString(3, gps.getPname());
			pst.setString(4, gps.getStu1().getSNo());
			pst.setString(5, sno2);
			pst.setString(6, sno3);
			pst.setInt(7, gps.getGsnum());
			pst.setInt(8, gps.getGleftnum());
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("GPS_Gname:"+gps.getGname()+"insert over!");
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
	
	public GPS querybyName(String Gname){
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
	}
	
	public int updateGPS(GPS gps){
		int rs=0;
		Connection conn = null;
		try{
			String sql_update = "update gps set PNo=?,Pname=?,SNo1=?,SNo2=?,SNo3=?,Gsnum=?,Gleftnum=? where Gname=?;";//修改一条学生信息
			 conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_update);
			pst.setInt(1, gps.getPNo());
			pst.setString(2, gps.getPname());
			pst.setString(3, gps.getStu1().getSNo());
			pst.setString(4, gps.getStu2().getSNo());
			pst.setString(5, gps.getStu3().getSNo());
			pst.setInt(6, gps.getGsnum());
			pst.setInt(7, gps.getGleftnum());
			pst.setString(8, gps.getGname());
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("update over!");
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
	public int get_lastID(){
		int lastid = 0;
		
		Connection conn=null;
		try{
			
			String sql = "SELECT LAST_INSERT_ID();";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
		
			lastid = pst.executeUpdate();
			System.out.println(lastid);
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return lastid;
	}
}
