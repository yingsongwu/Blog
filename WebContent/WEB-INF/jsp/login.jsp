<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html
	class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"
	style="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FreeHTML5.co">
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive">
<link rel="shortcut icon" href="favicon.ico">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/login/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/login/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/login/css/style.css">
<script
	src="${pageContext.request.contextPath }/login/js/modernizr-2.6.2.min.js"></script>
<script src="${pageContext.request.contextPath }/login/js/jquery.min.js"></script>
</head>
<body class="style-2">

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center"></div>
		</div>
		<div class="row">
			<div class="col-md-4">


				<!-- Start Sign In Form -->
				<form
					action="${pageContext.request.contextPath }/UserController/login.action"
					method="post" name="form1" id="form1"
					onsubmit="return checkLogin()"
					class="fh5co-form animate-box fadeInLeft animated-fast"
					data-animate-effect="fadeInLeft">
					<h2>用户登录</h2>
					<div></div>
					<div class="form-group">
						<label id="nameError" class="sr-only"></label> <input type="text"
							class="form-control" id="username" placeholder="用户名"
							autocomplete="off" name="u_name" onblur="checkName()">
					</div>
					<div class="form-group">
						<label id="passwordError" class="sr-only"></label> <input
							type="password" class="form-control" id="password"
							placeholder="密码" autocomplete="off" name="u_password"
							onblur="checkPassword()">
					</div>

					<div class="form-group">
						<p>
							未注册？ <a
								href="${pageContext.request.contextPath }/UserController/registerUi.action">点击注册</a>
						</p>
					</div>
					<br>
					<div class="form-group">
						<input type="submit" value="登录" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-12 text-center">

		<small>© All Rights Reserved. More Templates - Collect from </small>

	</div>

</body>
<script type="text/javascript">
	function checkName() {
		$("#nameError").attr("style", "color: red;");
		$("#nameError").attr("class", "");

		var name = $("#username").val();
		if (name.length == 0) {
			$("#nameError").html("用户名不能为空");
		} else if (name.length<5 || name.length >20) {
			$("#nameError").html("用户名长度为5到20位");
		} else {
			$("#nameError").attr("class", "sr-only");
		}
	}
	function checkPassword() {
		$("#passwordError").attr("style", "color: red;");
		$("#passwordError").attr("class", "");

		var password = $("#password").val();
		if (password.length == 0) {
			$("#passwordError").html("密码不能为空");
		} else if (password.length<6 || name.length >20) {
			$("#passwordError").html("密码长度为6到20位");
		} else {
			$("#passwordError").attr("class", "sr-only");
		}
	}
	function checkLogin() {
		var name = $("#username").val();
		var password = $("#password").val();
		var param = {
			u_name : name,
			u_password : password
		};
		var msg;
		
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/UserController/checkLogin.action",
			//contentType:"application/json;charset=utf-8",
			data : param,
			async : false,
			success : function(returnData) {
				//alert("returnData.msg: "+returnData.msg);	
				msg = returnData.msg;
				if(returnData.msg != "success"){
					$("#nameError").attr("style", "color: red;");
					$("#nameError").attr("class", "");
					$("#nameError").html(returnData.msg);
				}
			}
		})		
				
		//alert("msg: "+msg);	
		if(msg == "success"){
			return true;
		}else{
			return false;
		}
	}
</script>
</html>