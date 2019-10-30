/**
 * 
 */
package com.pss.user;

/**
 * @author Administrator
 *
 */
public class Notification {
   String Title;
   String Content;
   public String getTitle(){
		return Title;
	}
	public void setTitle(String title){
		Title=title;
	}
	public String getContent(){
		return Content;
	}
	public void setContent(String content){
		Content=content;
	}
	public Notification(String title,String content){
		this.Title=title;
		this.Content=content;
	}
}
