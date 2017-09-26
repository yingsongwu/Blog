package com.blog.service;

import com.blog.pojo.Pic;
import com.blog.pojo.User;

public interface UserService {

	User login(String u_name, String u_password);

	int addUser(User user);

	User findByName(String u_name);

	int addPic(Pic pic);

	int updateUserPic(User user, Pic pic);
}
