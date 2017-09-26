package com.blog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.mapper.BlogMapper;
import com.blog.pojo.BlogAndUser;
import com.blog.pojo.PageBean;
import com.blog.service.ShowBlogService;
@Service
public class ShowBlogServiceImpl implements ShowBlogService {
	
	@Resource
  private BlogMapper blogMapper;
	
	@Override
	public Map<String, Object> findByName(String u_name,int page) {
		List<BlogAndUser> list=blogMapper.findByUser(u_name);
		
		 PageBean pagebean=new PageBean(list.size()); 
	        int pageCount=pagebean.getPageCount();
	        int firstIndex=(page-1)*9;  
			int toIndex=page*9;  
			if(toIndex>list.size()){  
			    toIndex=list.size();  
			}  
			
			
			List courseList=list.subList(firstIndex, toIndex); 
        Map<String, Object> map=new HashMap<>();
        map.put("list",courseList);
        map.put("pageCount", pageCount);
 		
		return map;
		
	}
	@Override
	public Map<String, Object> findByType(String t_name,int page) {
		List<BlogAndUser> list=blogMapper.findByType(t_name);
		if(list==null){
			return null;
		}
		 PageBean pagebean=new PageBean(list.size()); 
	        int pageCount=pagebean.getPageCount();
	        int firstIndex=(page-1)*9;  
			int toIndex=page*9;  
			if(toIndex>list.size()){  
			    toIndex=list.size();  
			}  
			
			
			List courseList=list.subList(firstIndex, toIndex); 
     Map<String, Object> map=new HashMap<>();
     map.put("list",courseList);
     map.put("pageCount", pageCount);
		
		return map;
	}
	@Override
	public BlogAndUser findByTitle(int b_id) {
		BlogAndUser bloganduser=blogMapper.findByTitle(b_id);
		int b_readNum=bloganduser.getB_readNum()+1;
		bloganduser.setB_readNum(b_readNum);
		blogMapper.updateReadNum(bloganduser);
		return bloganduser;
	}
	@Override
	public List<BlogAndUser> findByReadNum() {
		List<BlogAndUser> list=blogMapper.findByReadNum();
		return list;
	}
	@Override
	public List<BlogAndUser> findByNum() {
		List<BlogAndUser> list=blogMapper.findByNum();
		return list;
	}
	@Override
	public Map<String, Object> findAll() {
        List<BlogAndUser> list=blogMapper.findAll();
        
        PageBean pagebean=new PageBean(list.size()); 
        int pageCount=pagebean.getPageCount();
        List list1=list.subList(0, 9);  
        Map<String, Object> map=new HashMap<>();
        map.put("list",list1);
        map.put("pageCount", pageCount);
 		
		return map;
	}
	@Override
	public  Map<String, Object> findAllByPage(int page) {
		 List<BlogAndUser> list=blogMapper.findAll();
		 PageBean pagebean=new PageBean(list.size()); 
	        int pageCount=pagebean.getPageCount();
	        int firstIndex=(page-1)*9;  
			int toIndex=page*9;  
			if(toIndex>list.size()){  
			    toIndex=list.size();  
			}  
			
			
			List courseList=list.subList(firstIndex, toIndex); 
	        Map<String, Object> map=new HashMap<>();
	        map.put("list",courseList);
	        map.put("pageCount", pageCount);
		
		 
		return map;
	}
	@Override
	public Map<String, Object> findAllSearch(String s,int page) {
		List<BlogAndUser> list=blogMapper.findAllSearch(s);
		 PageBean pagebean=new PageBean(list.size()); 
	        int pageCount=pagebean.getPageCount();
	        int firstIndex=(page-1)*9;  
			int toIndex=page*9;  
			if(toIndex>list.size()){  
			    toIndex=list.size();  
			}  
			
			
			List courseList=list.subList(firstIndex, toIndex); 
	        Map<String, Object> map=new HashMap<>();
	        map.put("list",courseList);
	        map.put("pageCount", pageCount);
		
		 
		return map;
		
		
	}
	@Override
	public Map<String, Object> findBlogListByPage(int page, int u_id) {
		List<BlogAndUser> list=blogMapper.findBlogListById(u_id);
		 PageBean pagebean=new PageBean(list.size()); 
	        int pageCount=pagebean.getPageCount();
	        int firstIndex=(page-1)*9;  
			int toIndex=page*9;  
			if(toIndex>list.size()){  
			    toIndex=list.size();  
			}  
			List courseList=list.subList(firstIndex, toIndex); 
	        Map<String, Object> map=new HashMap<>();
	        map.put("list",courseList);
	        map.put("pageCount", pageCount);
		return map;
	}
	@Override
	public Map<String, Object> findBlogDraftByPage(int page, int u_id) {
		List<BlogAndUser> list=blogMapper.findBlogDraftById(u_id);
		 PageBean pagebean=new PageBean(list.size()); 
	        int pageCount=pagebean.getPageCount();
	        int firstIndex=(page-1)*9;  
			int toIndex=page*9;  
			if(toIndex>list.size()){  
			    toIndex=list.size();  
			}  
			List courseList=list.subList(firstIndex, toIndex); 
	        Map<String, Object> map=new HashMap<>();
	        map.put("list",courseList);
	        map.put("pageCount", pageCount);
		return map;
	}
	
	@Override
	public Map<String, Object> findBlogDeleteByPage(int page, int u_id) {
		List<BlogAndUser> list=blogMapper.findBlogDeleteById(u_id);
		 PageBean pagebean=new PageBean(list.size()); 
	        int pageCount=pagebean.getPageCount();
	        int firstIndex=(page-1)*9;  
			int toIndex=page*9;  
			if(toIndex>list.size()){  
			    toIndex=list.size();  
			}  
			List courseList=list.subList(firstIndex, toIndex); 
	        Map<String, Object> map=new HashMap<>();
	        map.put("list",courseList);
	        map.put("pageCount", pageCount);
		return map;
	}

}
