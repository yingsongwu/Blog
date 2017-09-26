package com.blog.mapper;

import java.util.List;

import com.blog.pojo.Blog;
import com.blog.pojo.BlogAndUser;

public interface BlogMapper {
	List<BlogAndUser> findAll();

	List<BlogAndUser> findByUser(String u_name);

	List<BlogAndUser> findByType(String t_name);

	BlogAndUser findByTitle(int b_id);

	void updateReadNum(BlogAndUser bloganduser);

	List<BlogAndUser> findByReadNum();

	List<BlogAndUser> findByNum();// 根据评论

	List<BlogAndUser> findAllSearch(String s);

	////////////////////
	int addBlog(Blog blog) throws Exception;

	List<Blog> findAllBlog(int u_id) throws Exception;

	int delBlogById(int b_id) throws Exception;

	int saveBlog(Blog blog);

	List<Blog> findBlogDraft(int u_id) throws Exception;

	List<Blog> findBlogDeleted(int u_id) throws Exception;

	Blog findBlogById(int b_id) throws Exception;
	
	int updateBlogCommentsNum(Blog blog) throws Exception;

	List<BlogAndUser> findBlogListById(int u_id);

	List<BlogAndUser> findBlogDraftById(int u_id);

	List<BlogAndUser> findBlogDeleteById(int u_id);

	int updateBlog(Blog blog) throws Exception;
}
