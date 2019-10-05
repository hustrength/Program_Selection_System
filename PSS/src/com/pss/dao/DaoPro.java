package com.pss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.pss.conn.Conn;
import com.pss.user.Project;

public class DaoPro {
	
	public static final String sql_select = "select * from course;";//��ѯ���е�sql���
	public static final String sql_selectfuz = "select * from course where CNo=? or....";//fuzzy queryģ����ѯ
	public static final String sql_selectone = "select * from course where CNo=?";//��ѯĳһ���γ�
	public static final String sql_update = "update course set Cname=?,Ccredit=? where CNo=?;";//�޸�һ���γ���Ϣ
	public static final String sql_delete = "delete from course where Cno=?;";//ɾ��һ���γ���Ϣ
	public static final String sql_insert = "insert into course(Cname,Ccredit) values(?,?);";//���һ���γ���Ϣ
	
	
	/*
	 * ��ѯ���пγ���Ϣ
	 * */
	public List<Project> selectCou(){
		List<Project> list = null;
		try{
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_select);
			ResultSet rs = pst.executeQuery();
			list = new ArrayList<Project>();
			while(rs.next()){				
				Project cou = new Project(rs.getInt("CNo"),rs.getString("Cname"),rs.getString("Ccredit"));
				list.add(cou);
			}
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	/*
	 * ��ѯĳ���γ���Ϣ
	 * */
	public Project selectCou(int id){
		Project cou = null;
		try{
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_selectone);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				cou = new Project(rs.getInt("CNo"),rs.getString("Cname"),rs.getString("Ccredit"));
			}
		}catch(Exception e){e.printStackTrace();}
		return cou;
	}
	/*
	 * ��ѯĳ���γ���Ϣ��ģ����ѯ��
	 * */
	public Iterator<Project> selectCou(String aa){//aa��Ϊģ����ѯ�Ĺؼ���
		List<Project> list = null;
		Iterator<Project> listall = null;
		try{
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_selectone);
			ResultSet rs = pst.executeQuery();
			list = new ArrayList<Project>();
			while(rs.next()){
				Project cou = new Project(rs.getInt("CNo"),rs.getString("Cname"),rs.getString("Ccredit"));
				list.add(cou);
			}
			listall = list.iterator();
		}catch(Exception e){e.printStackTrace();}
		return listall;
	}
	/*
	 * �޸�ĳ���γ���Ϣ
	 * */
	public int updateCou(Project cou){
		int rs = 0;
		try{
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_update);
			pst.setString(1, cou.getCname());
			pst.setString(2, cou.getCcredit());
			pst.setInt(3, cou.getCNo());
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("course_id"+cou.getCNo()+"update over!");
			}
		}catch(Exception e){e.printStackTrace();}
		return rs;
	}
	/*
	 * ɾ��ĳ���γ���Ϣ
	 * */
	public int deleteCou(int id){
		int rs = 0;
		try{
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_delete);
			pst.setInt(1, id);
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("course_id"+id+"delete over!");
			}
		}catch(Exception e){e.printStackTrace();}
		return rs;
	}
	/*
	 * ���һ���γ���Ϣ
	 * */
	public int insertCou(Project cou){
		int rs = 0;
		try{
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_insert);
			pst.setString(1,cou.getCname());
			pst.setString(2, cou.getCcredit());
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("course_id"+cou.getCname()+"insert over!");
			}
		}catch(Exception e){e.printStackTrace();}
		return rs;
	}
	/*
	 * ����ѡ������Ŀγ̺ţ���ѯ��͵õ�ȫ����ѡ�γ̵���ѧ��**********************��������******************************************
	 * *
	public float selectScre(SC sc[]){
		float sum = 0;
		try{
			String sql = "select ccredit from course where cno=?;";
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = null;
			for(int i=0;i<sc.length;i++){
				pst.setInt(1, sc[i].getCNo());
				rs = pst.executeQuery();
				sum += rs.getFloat("ccredit");
			}
		}catch(Exception e){e.printStackTrace();}
		return sum;
	}*/
	/*
	 * ����ѧ�ţ���ѯѧ����ѧ��
	 * */
	public float selectScre(int sno){
		float sum = 0;
		try{
			String sql = "select sc.sno,sum(ccredit) as scredit from sc,course where sc.cno=course.cno and sno=?;";
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, sno);
			ResultSet rs = null;
			rs = pst.executeQuery();
			if(rs.next()){
				sum = rs.getFloat("scredit");
			}
		}catch(Exception e){e.printStackTrace();}
		return sum;
	}
	/*
	 * ���ݿγ̱�ţ���ÿγ�ѧ��
	 * */
	public float selectCcre(int cno){
		float sum = 0;
		try{
			String sql = "select course.ccredit from course where cno=?;";
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cno);
			ResultSet rs = null;
			rs = pst.executeQuery();
			if(rs.next()){
				sum = Float.parseFloat(rs.getString("ccredit"));
			}
		}catch(Exception e){e.printStackTrace();}
		return sum;
	}
	/*
	 * ��ѯѧ���Ƿ�����ĳ���γ�
	 * 
	 * */
	public int cou_is_selected(int sno, int cno) {
		int cou_is_selected = 0;
		try {
			String sql = "select sc.sno from sc where sno=? and cno=?";
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, sno);
			pst.setInt(2, cno);
			ResultSet rs = null;
			rs = pst.executeQuery();
			if(rs.next())
				cou_is_selected = 1;
		}catch(Exception e){e.printStackTrace();}
		return cou_is_selected;
	}
}
