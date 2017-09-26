<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/login/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/login/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/login/css/style.css">
<!-- Modernizr JS -->
<script
	src="${pageContext.request.contextPath }/login/js/moderniz-2.6.2.min.js"></script>

<title>Insert title here</title>
</head>
<body class="style-2">
	<div class="container">
		<div class="row">
			<div class="col-md-4">


				<!-- Start Sign In Form -->
				<form
					action="${pageContext.request.contextPath }/UserController/addUser.action"
					method="post" class="fh5co-form animate-box"
					data-animate-effect="fadeInLeft">
					<h2>注册</h2>
					<div class="form-group">
						<label id="nameError" for="name" class="sr-only"></label> <input
							id="name" name="u_name" type="text" class="form-control"
							placeholder="用户名" autocomplete="off" onblur="checkName()">
					</div>
					<div class="form-group">
						<label id="passwordError" for="password" class="sr-only"></label>
						<input id="password" name="u_password" type="password"
							class="form-control" placeholder="密码" autocomplete="off"
							onblur="checkPassword()">
					</div>
					<div class="form-group">
						<label id="rePasswordError" for="re-password" class="sr-only"></label>
						<input type="password" class="form-control" id="rePassword"
							placeholder="请再次输入密码" autocomplete="off"
							onblur="checkRePassword()">
					</div>
					<!-- <div class="form-group">
						<label for="remember"><input type="checkbox" id="remember">
							Remember Me</label>
					</div> -->
					<div class="form-group">
						<p>
							已经注册？ <a
								href="${pageContext.request.contextPath }/UserController/loginUi.action">登录</a>
						</p>
					</div>
					<div class="form-group">
						<input type="submit" value="注册" class="btn btn-primary">
					</div>
				</form>
				<!-- END Sign In Form -->


			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/login/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath }/login/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script
		src="${pageContext.request.contextPath }/login/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script
		src="${pageContext.request.contextPath }/login/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath }/login/js/main.js"></script>
</body>
<script type="text/javascript">
	function checkName() {
		$("#nameError").attr("style", "color: red;");
		$("#nameError").attr("class", "");

		var name = $("#name").val();
		if (name.length == 0) {
			$("#nameError").html("用户名不能为空");
		} else if (name.length<5 || name.length >20) {
			$("#nameError").html("用户名长度为5到20位");
		} else {
			var param = {
				u_name : name
			};
			/* $.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/UserController/checkName.action",
				//contentType:"application/json;charset=utf-8",
				data : param,
				success : function(returnData) {
					//alert(returnData.msg);
					/* if(returnData.msg == null){
						$("#nameError").attr("class", "sr-only");
					} */
					$("#nameError").attr("style", "color: green;");
					$("#nameError").html(returnData.msg);
				}
			}) */
			$("#nameError").html("");
		}
	}
	function checkPassword() {
		$("#passwordError").attr("style", "color: red;");
		$("#passwordError").attr("class", "");

		var password = $("#password").val();
		if (password.length == 0) {
			$("#passwordError").html("密码不能为空");
		} else if (password.length<10 || name.length >20) {
			$("#passwordError").html("密码长度为10到20位");
		} else {
			$("#passwordError").attr("style", "color: green;");
			$("#passwordError").html("格式正确");
			//$("#passwordError").attr("class", "sr-only");
		}
	}
	function checkRePassword() {
		$("#rePasswordError").attr("style", "color: red;");
		$("#rePasswordError").attr("class", "");

		var password = $("#password").val();
		var rePassword = $("#rePassword").val();
		if (rePassword.length == 0 || rePassword == null) {
			$("#rePasswordError").html("密码不能为空");
		} else if (password != rePassword) {
			$("#rePasswordError").html("密码不一致");
		} else {
			$("#rePasswordError").attr("style", "color: green;");
			$("#rePasswordError").html("密码一致");
			//$("#rePasswordError").attr("class", "sr-only");
		}
	}
</script>
</html>