package com.blog.pojo;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
	private Integer u_id;
	@Size(min=10,max=20,message="{user.password.length.error}")
	@NotEmpty(message="{user.password.notEmpty}")
	private String u_password;
	@Size(min=5,max=20,message="{user.name.length.error}")
	@NotEmpty(message="{user.name.notEmpty}")
	private String u_name;
	private String u_info;
	private Integer u_blogNum;
	private Integer u_readNum;
	private Pic pic;
	
	public Pic getPic() {
		return pic;
	}
	public void setPic(Pic pic) {
		this.pic = pic;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_info() {
		return u_info;
	}
	public void setU_info(String u_info) {
		this.u_info = u_info;
	}
	public Integer getU_blogNum() {
		return u_blogNum;
	}
	public void setU_blogNum(Integer u_blogNum) {
		this.u_blogNum = u_blogNum;
	}
	public Integer getU_readNum() {
		return u_readNum;
	}
	public void setU_readNum(Integer u_readNum) {
		this.u_readNum = u_readNum;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_password=" + u_password + ", u_name=" + u_name + ", u_info=" + u_info
				+ ", u_blogNum=" + u_blogNum + ", u_readNum=" + u_readNum + ", pic=" + pic + "]";
	}
	
}
