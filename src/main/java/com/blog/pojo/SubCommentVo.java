package com.blog.pojo;

import java.io.Serializable;
import java.sql.Timestamp;

public class SubCommentVo implements Serializable{

	private static final long serialVersionUID = 4206047452457364662L;
	
	private int s_id;
	private String s_content;
	private Timestamp s_time;
	private int s_del;
	private int s_read;
	private int s_floor;
	private int c_id;
	private int u_id;
	private String u_name;
	
	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	public String getS_content() {
		return s_content;
	}

	public void setS_content(String s_content) {
		this.s_content = s_content;
	}


	public Timestamp getS_time() {
		return s_time;
	}

	public void setS_time(Timestamp s_time) {
		this.s_time = s_time;
	}

	public int getS_del() {
		return s_del;
	}

	public void setS_del(int s_del) {
		this.s_del = s_del;
	}

	public int getS_read() {
		return s_read;
	}

	public void setS_read(int s_read) {
		this.s_read = s_read;
	}

	public int getS_floor() {
		return s_floor;
	}

	public void setS_floor(int s_floor) {
		this.s_floor = s_floor;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	
	
	
}
