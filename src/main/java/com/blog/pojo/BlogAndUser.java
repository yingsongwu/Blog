package com.blog.pojo;

import java.text.SimpleDateFormat;

public class BlogAndUser {
	private int b_id;
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	private int b_readNum;
	public int getB_readNum() {
		return b_readNum;
	}
	public void setB_readNum(int b_readNum) {
		this.b_readNum = b_readNum;
	}
	private String t_name;
	private String u_name;
	private String b_mainText;
	private String b_title;
	private String b_info;
	private String p_url;
	private String b_time ;
	private Integer b_commentsNum;

	public Integer getB_commentsNum() {
		return b_commentsNum;
	}
	public void setB_commentsNum(Integer b_commentsNum) {
		this.b_commentsNum = b_commentsNum;
	}
	public String getB_time() {
		return b_time;
	}
	public void setB_time(String b_time) {
		this.b_time = b_time;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	
	public String getB_mainText() {
		return b_mainText;
	}
	public void setB_mainText(String b_mainText) {
		this.b_mainText = b_mainText;
	}
	public String getB_info() {
		return b_info;
	}
	public void setB_info(String b_info) {
		this.b_info = b_info;
	}
	public String getP_url() {
		return p_url;
	}
	public void setP_url(String p_url) {
		this.p_url = p_url;
	}

}
