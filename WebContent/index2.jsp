<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
主页
<%-- <a href="${pageContext.request.contextPath}/BlogController/blogWrite.action">写博客</a> --%>
<a href="${pageContext.request.contextPath}/UserController/loginUi.action">登录</a>
<a href="${pageContext.request.contextPath}/UserController/register.action">注册</a>
<hr>
<a href="${pageContext.request.contextPath}/BlogController/blogWrite.action">写博客</a>
<a href="${pageContext.request.contextPath}/BlogController/ShowBlog.action">博客列表</a>
<a href="${pageContext.request.contextPath}/BlogController/blogDraft.action">草稿箱</a>
<a href="${pageContext.request.contextPath}/BlogController/blogDeleted.action">回收站</a>
</body>
</html>