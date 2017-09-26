package com.blog.test;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.mapper.UserMapper;
import com.blog.pojo.User;
import com.blog.service.UserService;
import com.blog.utils.Md5Util;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/spring-mvc.xml", "classpath:spring/spring-orm.xml",
		"classpath:spring/spring-tx.xml" })
public class UserTest {

	@Resource
	private UserMapper userMapper;
	
	@Resource
	private UserService userService;
	
	@Test
	public void test1() {
		User user = null;
		String u_name = "jack123";
		try {
			user = userService.findByName(u_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(user != null) {
			System.err.println(user);
		}else {
			System.err.println("-------------null-----------------");
		}
	}
	
	@Test
	public void testMd5Util() {
		String pass = "123123";
		String str = Md5Util.md5(pass);
		System.out.println(str);
		System.out.println(str.length());
	}
	
	public static void main(String[] args) {
		System.out.println(new Date());
	}
}
