package com.blog.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.blog.mapper.PicMapper;
import com.blog.mapper.UserMapper;
import com.blog.pojo.Pic;
import com.blog.pojo.User;
import com.blog.service.UserService;
import com.blog.utils.Md5Util;

@Service("UserService")
public class UserServiceImpl implements UserService {

	private static final Logger LOG = Logger.getLogger(UserServiceImpl.class);

	@Resource
	private UserMapper userMapper;
	@Resource
	private PicMapper picMapper;

	@Override
	public User login(String u_name, String u_password) {
		Map<String, String> map = new HashMap<>();
		map.put("u_name", u_name);
		//密码加密
		map.put("u_password", Md5Util.md5(u_password));
		
		User user = null;
		try {
			user = userMapper.findUserByNameAndPassword(map);
		} catch (Exception e) {
			LOG.info("UserServiceImpl.login e: "+e);
		}
		return user;
	}

	@Override
	public int addUser(User user) {
		int result = 0;
		//密码加密
		user.setU_password(Md5Util.md5(user.getU_password()));
		try {
			result = userMapper.addUser(user);
			System.err.println(result);
			System.err.println(user);
		} catch (Exception e) {
			LOG.info("UserServiceImpl.addUser e: "+e);
		}
		
		return result;
	}

	@Override
	public User findByName(String u_name) {
		User user = null;
		
		try {
			user = userMapper.findByName(u_name);
			System.err.println("UserServiceImpl.findByName : "+user);
		} catch (Exception e) {
			LOG.info("UserServiceImpl.findByName e: "+e);
		}
		
		return user;
	}

	@Override
	public int addPic(Pic pic) {
		int result = 0;
		try {
			result = picMapper.addPic(pic);
		} catch (Exception e) {
			LOG.info("UserServiceImpl.addPic e: "+e);
		}
		return result;
	}

	@Override
	public int updateUserPic(User user, Pic pic) {
		int result = 0;
		try {
			result = picMapper.addPic(pic);
		} catch (Exception e) {
			LOG.info("UserServiceImpl.updateUserPic e: "+e);
		}
		return result;
	}

}
