package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.blog.controller.BlogController;
import com.blog.mapper.BlogMapper;
import com.blog.pojo.Blog;
import com.blog.service.BlogService;

@Service
public class BlogServiceImpl implements BlogService {

	private static final Logger LOG = Logger.getLogger(BlogController.class);
		
	@Resource
	private BlogMapper blogMapper;
	
	public int addBlog(Blog blog) throws Exception {
		int result = 0;
		try {
			result = blogMapper.addBlog(blog);
		} catch (Exception e) {
			LOG.info("BlogServiceImpl.addBlog e:"+e);
			e.printStackTrace();
			throw new Exception(e);
		}
		return result;
	}

	public List<Blog> findAllBlog(int u_id) throws Exception {
		List<Blog> blogList = null;
		try {
			blogList = blogMapper.findAllBlog(u_id);
		} catch (Exception e) {
			LOG.info("BlogServiceImpl.findAllBlog e:"+e);
			e.printStackTrace();
			throw new Exception(e);
		}
		return blogList;
	}

	@Override
	public int delBlogById(int b_id) throws Exception {
		int result = 0;
		try {
			result = blogMapper.delBlogById(b_id);
		} catch (Exception e) {
			LOG.info("BlogServiceImpl.delBlog e:"+e);
			e.printStackTrace();
			throw new Exception(e);
		}
		return result;
	}

	@Override
	public int saveBlog(Blog blog) throws Exception {
		int result = 0;
		try {
			result = blogMapper.saveBlog(blog);
		} catch (Exception e) {
			LOG.info("BlogServiceImpl.saveBlog e:"+e);
			e.printStackTrace();
			throw new Exception(e);
		}
		return result;
	}

	@Override
	public List<Blog> findBlogDraft(int u_id) throws Exception {
		List<Blog> blogList = null;
		try {
			blogList = blogMapper.findBlogDraft(u_id);
		} catch (Exception e) {
			LOG.info("BlogServiceImpl.findBlogDraft e:"+e);
			e.printStackTrace();
			throw new Exception(e);
		}
		return blogList;
	}

	@Override
	public List<Blog> findBlogDeleted(int u_id) throws Exception {
		List<Blog> blogList = null;
		try {
			blogList = blogMapper.findBlogDeleted(u_id);
		} catch (Exception e) {
			LOG.info("BlogServiceImpl.findBlogDeleted e:"+e);
			e.printStackTrace();
			throw new Exception(e);
		}
		return blogList;
	}

	@Override
	public Blog findBlogById(int b_id) throws Exception {
		Blog blog = null;
		try {
			blog = blogMapper.findBlogById(b_id);
		} catch (Exception e) {
			LOG.info("BlogServiceImpl.findBlogById e:"+e);
			e.printStackTrace();
			throw new Exception(e);
		}
		
		return blog;
	}

	/**
	 * 更新评论数
	 */
	@Override
	public int updateBlogCommentsNum(Blog blog) throws Exception {
		int result = 0;
		result = blogMapper.updateBlogCommentsNum(blog);
		
		return result;
	}

	@Override
	public int updateBlog(Blog blog) throws Exception {
		int result = 0;
		try {
			result = blogMapper.updateBlog(blog);
		} catch (Exception e) {
			LOG.info("BlogServiceImpl.updateBlog e:"+e);
			e.printStackTrace();
			throw new Exception(e);
		}
		return result;
	}

}
