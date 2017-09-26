package com.blog.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.blog.pojo.Pic;
import com.blog.pojo.User;
import com.blog.service.UserService;

@Controller
@RequestMapping("/UserController")
public class UserController {
	private static final Logger LOG = Logger.getLogger(UserController.class);

	@Resource
	private UserService userService;

	// 跳转到login.jsp
	@RequestMapping("/loginUi.action")
	public String loginUi() {
		return "login";
	}

	@RequestMapping("/login.action")
	public String login(HttpSession session, String u_name, String u_password) {
		User user = userService.login(u_name, u_password);
		if (user != null) {
			// 存入session
			session.setAttribute("user", user);
			return "redirect:/BlogController/ShowBlog.action";
		} else {
			// 登录失败，设置失败信息，并调转到登录页面
			return "error";
		}
	}

	@RequestMapping("/registerUi.action")
	public String registerUi() {
		return "register";
	}

	@RequestMapping("/addUser.action")
	public String addUser(HttpSession session,@Validated User user, BindingResult bindingResult,
			@NotEmpty(message = "{user.password2.notEmpty}") String u_password2) {
		/*
		 * if(u_password2 == null || u_password2.length()==0) {
		 * System.err.println("第二栏密码为空"); }
		 */
		System.err.println("bindingResult: " + bindingResult);
		// 获取校验错误信息
		if (bindingResult.hasErrors()) {
			// 输出错误信息
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			for (ObjectError objectError : allErrors) {
				System.err.println(objectError.getDefaultMessage());
			}
			return "error";
		}

		int result = 0;
		result = userService.addUser(user);

		if (result == 0) {
			LOG.info("UserController.addUser result: " + result);
		}
		
		session.setAttribute("user", user);
		return "redirect:/BlogController/ShowBlog.action";
	}

	// 查询数据库有无名字重复
	@RequestMapping("/checkName.action")
	@ResponseBody
	public Map<String, String> checkName(@RequestBody String u_name) {
		User user = null;
		user = userService.findByName(u_name);

		String msg = null;
		Map<String, String> map = new HashMap<>();

		if (user != null) {
			// 即该用户存在
			msg = "该用户名已存在";
		} else {
			msg = "该用户名可注册";
		}

		map.put("msg", msg);

		return map;
	}

	// 修改头像
	@RequestMapping("/updateUserPic")
	public String updateUserPic(HttpSession session,MultipartFile pictureFile) throws IllegalStateException, IOException {
		//获取user
		User user = (User) session.getAttribute("user");
		
		// 原始文件名称
		String pictureFile_name = pictureFile.getOriginalFilename();
		// 新文件名称
		String newFileName = UUID.randomUUID().toString()
				+ pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

		// 上传图片
		File uploadPic = new File("D:/picture/" + newFileName);

		if (!uploadPic.exists()) {
			uploadPic.mkdirs();
		}
		// 向磁盘写文件
		pictureFile.transferTo(uploadPic);
		
		Pic pic = new Pic();
		pic.setP_url(uploadPic.getAbsolutePath());
		//路径存入数据库
		userService.addPic(pic);
		
		//更新user
		userService.updateUserPic(user,pic);
		
		return "success";

	}

	//退出
	@RequestMapping("/Quit.action")
	public String Quit(HttpSession session) {
		session.removeAttribute("user");
		
		return "redirect:/BlogController/ShowBlog.action";
	}
	
	@RequestMapping("/checkLogin.action")
	@ResponseBody
	public Map<String, String> checkLogin(String u_name,String u_password){
		Map<String, String> map = new HashMap<>();
		String msg = null;
		
		User user = userService.login(u_name, u_password);
		if(user != null) {
			msg = "success";
		}else {
			msg = "用户名或密码错误";
		}
		
		map.put("msg", msg);
		return map;
	}
}
