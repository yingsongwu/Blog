package com.blog.pojo;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Comment {

	private int c_id;
	private String c_content;
	private Timestamp c_time;
	private int c_del;
	private int c_read;
	private int c_floor;
	private int b_id;
	private int u_id;
	private ArrayList<SubComment> subComments;
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Timestamp getC_time() {
		return c_time;
	}
	public void setC_time(Timestamp c_time) {
		this.c_time = c_time;
	}
	public int getC_del() {
		return c_del;
	}
	public void setC_del(int c_del) {
		this.c_del = c_del;
	}
	public int getC_read() {
		return c_read;
	}
	public void setC_read(int c_read) {
		this.c_read = c_read;
	}
	public int getC_floor() {
		return c_floor;
	}
	public void setC_floor(int c_floor) {
		this.c_floor = c_floor;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public ArrayList<SubComment> getSubComments() {
		return subComments;
	}
	public void setSubComments(ArrayList<SubComment> subComments) {
		this.subComments = subComments;
	}
	
}
