package com.blog.pojo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
//import java.util.Date;
import java.util.Date;

public class Blog {
	
	private Integer b_id;
	private String b_title;
	private Date b_time;
	private String b_mainText;
	private String b_srcText;
	
	public String getB_srcText() {
		return b_srcText;
	}
	public void setB_srcText(String b_srcText) {
		this.b_srcText = b_srcText;
	}
	private Integer b_draft;
	private Integer b_del;
	private Integer b_commentsNum;
	private Integer b_readNum;
	private Integer u_id;
	private Integer p_id;
	private Integer t_id;
	private String b_info;
	public String getB_info() {
		return b_info;
	}
	public void setB_info(String b_info) {
		this.b_info = b_info;
	}
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public Date getB_time() {
		return b_time;
	}
	public void setB_time(Date b_time) {
		this.b_time = b_time;
	}
	public String getB_mainText() {
		return b_mainText;
	}
	public Integer getB_draft() {
		return b_draft;
	}
	public void setB_draft(Integer b_draft) {
		this.b_draft = b_draft;
	}
	public Integer getB_del() {
		return b_del;
	}
	public void setB_del(Integer b_del) {
		this.b_del = b_del;
	}
	public Integer getB_commentsNum() {
		return b_commentsNum;
	}
	public void setB_commentsNum(Integer b_commentsNum) {
		this.b_commentsNum = b_commentsNum;
	}
	public Integer getB_readNum() {
		return b_readNum;
	}
	public void setB_readNum(Integer b_readNum) {
		this.b_readNum = b_readNum;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public void setB_mainText(String b_mainText) {
		this.b_mainText = b_mainText;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	
	@Override
	public String toString() {
		return "Blog [b_id=" + b_id + ", b_title=" + b_title + ", b_time=" + b_time + ", b_mainText=" + b_mainText
				+ ", b_draft=" + b_draft + ", b_del=" + b_del + ", b_commentsNum=" + b_commentsNum + ", b_readNum="
				+ b_readNum + ", u_id=" + u_id + ", p_id=" + p_id + ", t_id=" + t_id + ", b_info=" + b_info + "]";
	}
	public Blog(){
		b_draft = 1;
		b_del = 0;
		b_commentsNum = 0;
		b_readNum = 0;
	}
	public Blog(Integer b_id, String b_title, Date b_time, String b_mainText, String b_srcText, Integer b_draft,
			Integer b_del, Integer b_commentsNum, Integer b_readNum, Integer u_id, Integer p_id, Integer t_id,
			String b_info) {
		super();
		this.b_id = b_id;
		this.b_title = b_title;
		this.b_time = b_time;
		this.b_mainText = b_mainText;
		this.b_srcText = b_srcText;
		this.b_draft = b_draft;
		this.b_del = b_del;
		this.b_commentsNum = b_commentsNum;
		this.b_readNum = b_readNum;
		this.u_id = u_id;
		this.p_id = p_id;
		this.t_id = t_id;
		this.b_info = b_info;
	}

}
