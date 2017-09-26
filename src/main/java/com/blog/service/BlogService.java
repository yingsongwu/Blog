package com.blog.service;

import java.util.List;

import com.blog.pojo.Blog;

public interface BlogService {
	public int addBlog(Blog blog) throws Exception;

	public List<Blog> findAllBlog(int u_id) throws Exception;

	public int delBlogById(int b_id) throws Exception;

	public int saveBlog(Blog blog) throws Exception;

	public List<Blog> findBlogDraft(int u_id) throws Exception;

	public List<Blog> findBlogDeleted(int u_id) throws Exception;

	public Blog findBlogById(int b_id) throws Exception;

	public int updateBlogCommentsNum(Blog blog) throws Exception;

	public int updateBlog(Blog blog) throws Exception;

}
