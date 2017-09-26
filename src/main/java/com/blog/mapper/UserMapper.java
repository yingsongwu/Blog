package com.blog.mapper;

import java.util.Map;

import com.blog.pojo.User;

public interface UserMapper {
	public User findUserByNameAndPassword(Map<String, String> map) throws Exception;
	int addUser(User user) throws Exception;
	User findByName(String u_name) throws Exception;
}
