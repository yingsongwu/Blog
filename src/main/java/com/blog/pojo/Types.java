package com.blog.pojo;
/**
 * 博客类型，用于分类
 * @author cxb
 *
 */
public class Types {
	private Integer t_id;
	private String t_name;
	private Integer t_parentId;
	private Pic pic;
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public Integer getT_parentId() {
		return t_parentId;
	}
	public void setT_parentId(Integer t_parentId) {
		this.t_parentId = t_parentId;
	}
	public Pic getPic() {
		return pic;
	}
	public void setPic(Pic pic) {
		this.pic = pic;
	}
	@Override
	public String toString() {
		return "Types [t_id=" + t_id + ", t_name=" + t_name + ", t_parentId=" + t_parentId + ", pic=" + pic + "]";
	}
	
}
