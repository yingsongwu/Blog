package com.blog.pojo;

public class Pic {
	private Integer p_id;
	private String p_url;
	public Integer getP_id() {
		return p_id;
	}
	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}
	public String getP_url() {
		return p_url;
	}
	public void setP_url(String p_url) {
		this.p_url = p_url;
	}
	@Override
	public String toString() {
		return "Pic [p_id=" + p_id + ", p_url=" + p_url + "]";
	}
	
}
