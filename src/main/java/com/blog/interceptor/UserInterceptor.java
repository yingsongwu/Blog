package com.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class UserInterceptor implements HandlerInterceptor {

	// 请求进入handler之前
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 对登录放行
		if (request.getRequestURI().indexOf("login.action") >= 0) {
			return true;
		}
		// 首页放行
		if (request.getRequestURI().indexOf("ShowBlog.action") >= 0) {
			return true;
		}
		// 博客界面放行
		if (request.getRequestURI().indexOf("ShowBlogText1.action") >= 0) {
			return true;
		}
		// 按各种分类展示的页面    放行
		if (request.getRequestURI().indexOf("ShowBlog") >= 0) {
			return true;
		}

		HttpSession session = request.getSession();
		// 查看用户是否登录
		if (session.getAttribute("user") != null) {
			return true;
		}
		// 用户没有登录挑战到登录页面
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		return false;

	}

	// 进去handler之后，返回modelAndView之前
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	// 执行完handler之后
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
