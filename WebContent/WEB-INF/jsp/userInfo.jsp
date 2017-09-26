<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<label>头像未完成</label><br>
		<img alt="" src="${sessionScope.user.pic.p_url }"><br>
		<hr>
		<form action="${pageContext.request.contextPath }/UserController/updateUserPic.action" method="post" enctype="multipart/form-data">
			<label>头像上传</label><br>
			<input type="file" name="pictureFile">
			<input type="submit" value="上传">
		</form>
		<hr>
		<label>用户名:</label><label>${sessionScope.user.u_name }</label><br>
		<label>用户简介:</label>
		<textarea rows="" cols="">${sessionScope.user.u_info }</textarea>
		<br>
	</div>
</body>
</html>