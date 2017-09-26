package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.pojo.BlogAndUser;


public interface ShowBlogService {
      
	Map<String, Object>  findByName(String u_name,int page);
	Map<String, Object>  findByType(String t_name,int page);
       BlogAndUser findByTitle(int b_id);
       List<BlogAndUser>  findByReadNum();
       List<BlogAndUser>  findByNum();
	    Map<String, Object> findAll();
	    Map<String, Object> findAllByPage( int page);
	    Map<String, Object> findAllSearch(String s,int page);
		Map<String, Object> findBlogListByPage(int page, int u_id);
		Map<String, Object> findBlogDraftByPage(int page, int u_id);
		Map<String, Object> findBlogDeleteByPage(int page, int u_id);
}
