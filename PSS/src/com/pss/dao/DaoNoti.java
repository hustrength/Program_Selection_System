/**
 * 
 */
package com.pss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pss.conn.Conn;
import com.pss.user.*;
/**
 * @author Administrator
 *
 */
public class DaoNoti {
	/**
	 * 插入一条通知
	 * @param noti
	 * @return
	 */
	public int insertNoti(String title,String content){
		int rs = 0;
		Connection conn=null;
		try{
			String sql = "insert into notification(Title,Content) values(?,?);";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1,title);
			pst.setString(2,content);
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
	
	/**
	 * 更新通知
	 * @param noti
	 * @return
	 */
	public int updateNoti(Notification noti){
		int rs = 0;
		Connection conn=null;
		try{
			String sql = "update notification set Title=?,Content=? where NNo=?;";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1,noti.getTitle());
			pst.setString(2,noti.getContent());
			pst.setInt(3,1);
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
	public  Notification query(){
		Notification noti=null;
		Connection conn = null;
		try{
			String sql = "select * from notification where NNo=?;";
			conn=new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1,1);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				noti = new Notification(rs.getString("Title"),rs.getString("Content"));
				System.out.println(rs.getString("Title"));
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return noti;
	}
}
