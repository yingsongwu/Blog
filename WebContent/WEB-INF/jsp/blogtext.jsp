<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>个人博客</title>
<meta charset="utf-8">
<title>Standard Format Post - Abstract</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- mobile specific metas
   ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
   ================================================== -->
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/vendor.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/blogtext.css">

<!-- script
   ================================================== -->
<script src="../js/modernizr.js"></script>
<script src="../js/pace.min.js"></script>

<!-- favicons
	================================================== -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">
</head>

<body id="top">

	<!-- header 
   ================================================== -->
	<header class="short-header">

	<div class="gradient-block"></div>

	<div class="row header-content">

		<div class="logo">
			<a
				href="${pageContext.request.contextPath }/BlogController/ShowBlog.action">Author</a>
		</div>

		<nav id="main-nav-wrap">
		<ul class="main-navigation sf-menu">
			<li class="current"><a
				href="${pageContext.request.contextPath }/BlogController/ShowBlog.action"
				title="">首页</a></li>
			<li class="has-children"><a href="" title="">排行榜</a>
				<ul class="sub-menu">
					<li><a
						href="${pageContext.request.contextPath }/BlogController/ShowBlogNum.action">评论榜</a></li>
					<li><a
						href="${pageContext.request.contextPath }/BlogController/ShowBlogReadNum.action">人气榜</a></li>
				</ul></li>
			<li><a
				href="${pageContext.request.contextPath }/BlogController/MyBlog.action">我的博客</a></li>

			<c:choose>
				<c:when test="${sessionScope.user == null }">
					<li class="has-children"><a
						href="${pageContext.request.contextPath }/UserController/loginUi.action">登录|注册</a>
					</li>
				</c:when>
				<c:otherwise>
					<li><label>欢迎您：${sessionScope.user.u_name } </label></li>
					<li><a
						href="${pageContext.request.contextPath }/UserController/Quit.action">退出</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
		</nav>
		<!-- end main-nav-wrap -->

		<div class="search-wrap">

			<form role="search" method="get" class="search-form"
				action="${pageContext.request.contextPath }/BlogController/ShowBlogSearch.action">
				<label> <span class="hide-content">Search for:</span> <input
					type="search" class="search-field" placeholder="Type Your Keywords"
					value="" name="s" title="Search for:" autocomplete="off">
				</label> <input type="submit" class="search-submit" value="Search">
			</form>

			<a href="#" id="close-search" class="close-btn">Close</a>

		</div>
		<!-- end search wrap -->

		<div class="triggers">
			<a class="search-trigger" href="#"><i class="fa fa-search"></i></a> <a
				class="menu-toggle" href="#"><span>Menu</span></a>
		</div>
		<!-- end triggers -->

	</div>

	</header>
	<!-- end header -->


	<!-- content
   ================================================== -->
	<section id="content-wrap" class="blog-single">
	<div class="row">
		<!-- <div class="col-twelve" align="center"> -->
		<div class="col-twelve" align="center">
			<article class="format-standard">

			<div class="primary-content">

				<h1 class="page-title">${requestScope.blog.b_title }</h1>

				<ul class="entry-meta">
					<li class="date">${requestScope.blog.b_time }</li>
					<li class="cat"><a href="">${requestScope.blog.u_name }</a><a
						href="">${requestScope.blog.t_name}</a><a>${blog.b_readNum }</a></li>
					<div class="blogtext">${requestScope.blog.b_mainText }</div>
				</ul>
			</div>
			</article>
		</div>
		<!-- end col-twelve -->
	</div>
	<!-- end row --> <!--========== 评论====================================================== -->

	<div class="comments-wrap">
		<div id="comments" class="row">
			<div class="col-full">

				<h3 id="commentsNum">${commentsNum }评论</h3>

				<!-- 评论显示，包含一级评论和二级评论 -->
				<!-- commentlist -->
				<ol class="commentlist" id="commentContainer">
					<c:forEach items="${comments }" var="comment">
						<input type="hidden" value="${comment.u_id }" id="u_id">
						<div id="commentDiv${comment.c_id }">
							<li class="depth-1">

								<div>
									<!-- =================一级评论================ -->
									<div class="comment-content" id="comment-content">
										<div class="comment-info">
											<cite>${comment.u_name }&nbsp&nbsp&nbsp&nbsp${comment.c_floor
												}楼</cite>
											<div class="comment-meta">
												<%-- <time class="comment-time" datetime="2014-07-12">${comment.c_time }</time> --%>
												<span class="comment-time">${comment.c_time }</span>
											</div>
										</div>
										<div class="comment-text" id="comment-text">
											<p>${comment.c_content}</p>
										</div>

									</div>
									<div id="subCommentForm"></div>
									<!-- =================次级评论按钮,显示次级评论输入框=================== -->
									<c:if test="${empty user }">
										<div align="right">
											<button>
												<a
													href="${pageContext.request.contextPath }/UserController/loginUi.action">评论</a>
											</button>
										</div>
									</c:if>
									<c:if test="${!empty user }">
										<div align="right">
											<!-- 当前评论是该用户时或是该用户是该博客博主时显示删除按钮 -->
											<c:if
												test="${user.u_name == comment.u_name || user.u_name == blog.u_name }">
												<button class="submit button-primary"
													onclick="deleteComment(${comment.c_id})">删除</button>
											</c:if>
											<button id="submitSubComment" class="submit button-primary"
												onclick="showSubCommentForm(${comment.c_id})">评论</button>
										</div>
									</c:if>
								</div>
								<div id="subCommentFormDiv${comment.c_id }"></div>

							</li>

							<!-- ===================次级评论显示================= -->
							<ul class="children" id="subCommentContainer${comment.c_id }">
								<c:forEach items="${comment.subCommentVo }" var="subComment">
									<li class="depth-3" id="subCommentLi${subComment.s_id}">

										<div class="comment-content">

											<div class="comment-info">
												<cite>${subComment.u_name }&nbsp&nbsp&nbsp&nbsp${subComment.s_floor
													}楼</cite>

												<div class="comment-meta">
													<%-- <time class="comment-time" datetime="2014-07-12T25:15">${subComment.s_time }</time> --%>
													<span class="comment-time">${subComment.s_time }</span>
												</div>
											</div>

											<div class="comment-text">
												<p>${subComment.s_content }</p>
											</div>

											<c:if test="${!empty user }">
												<div align="right">
													<!-- 当前评论是该用户时或是该用户是该博客博主时显示删除按钮 -->
													<c:if
														test="${user.u_name == subComment.u_name || user.u_name == blog.u_name }">
														<button class="submit button-primary"
															onclick="deleteSubComment(${subComment.s_id})">删除</button>
													</c:if>
												</div>
											</c:if>

										</div>

									</li>
								</c:forEach>
							</ul>

						</div>
					</c:forEach>
				</ol>
				<!-- Commentlist End -->

				<!-- respond -->
				<div class="respond">

					<h3>Leave a Comment</h3>

					<fieldset>


						<div class="message form-field" id="commentFormContainer">
							<textarea name="cMessage" id="commentText" class="full-width"
								placeholder="Your Message"></textarea>
						</div>
						<c:if test="${empty user }">
							<button>
								<a
									href="${pageContext.request.contextPath }/UserController/loginUi.action">评论</a>
							</button>
						</c:if>
						<c:if test="${!empty user }">
							<button id="submitComment" class="submit button-primary"
								onclick="submitCommentLogin(${user.u_id},${b_id })">评论</button>
						</c:if>


					</fieldset>

				</div>
				<!-- Respond End -->

			</div>
			<!-- end col-full -->
		</div>
		<!-- end row comments -->
	</div>
	<!-- end comments-wrap --> </section>
	<!-- end content -->


	<!-- footer
   ================================================== -->
	<footer>

	<div class="footer-main">

		<div class="row">

			<div class="col-four tab-full mob-full footer-info">

				<h4>About Our Site</h4>

				<p>Lorem ipsum Ut velit dolor Ut labore id fugiat in ut fugiat
					nostrud qui in dolore commodo eu magna Duis cillum dolor officia
					esse mollit proident Excepteur exercitation nulla. Lorem ipsum In
					reprehenderit commodo aliqua irure labore.</p>

			</div>
			<!-- end footer-info -->

			<div class="col-two tab-1-3 mob-1-2 site-links">

				<h4>Site Links</h4>

				<ul>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Blog</a></li>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">Terms</a></li>
					<li><a href="#">Privacy Policy</a></li>
				</ul>

			</div>
			<!-- end site-links -->

			<div class="col-two tab-1-3 mob-1-2 social-links">

				<h4>Social</h4>

				<ul>
					<li><a href="#">Twitter</a></li>
					<li><a href="#">Facebook</a></li>
					<li><a href="#">Dribbble</a></li>
					<li><a href="#">Google+</a></li>
					<li><a href="#">Instagram</a></li>
				</ul>

			</div>
			<!-- end social links -->

			<div class="col-four tab-1-3 mob-full footer-subscribe">

				<h4>Subscribe</h4>

				<p>Keep yourself updated. Subscribe to our newsletter.</p>

				<div class="subscribe-form">

					<form id="mc-form" class="group" novalidate="true">

						<input type="email" value="" name="dEmail" class="email"
							id="mc-email" placeholder="Type &amp; press enter" required="">

						<input type="submit" name="subscribe"> <label
							for="mc-email" class="subscribe-message"></label>

					</form>

				</div>

			</div>
			<!-- end subscribe -->

		</div>
		<!-- end row -->

	</div>
	<!-- end footer-main -->

	<div class="footer-bottom">
		<div class="row">

			<div class="col-twelve">
				<div class="copyright"></div>

				<div id="go-top">
					<a class="smoothscroll" title="Back to Top" href="#top"><i
						class="icon icon-arrow-up"></i></a>
				</div>
			</div>

		</div>
	</div>
	<!-- end footer-bottom --> </footer>

	<div id="preloader">
		<div id="loader"></div>
	</div>

	<!-- Java Script
   ================================================== -->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/plugins.js"></script>
	<script src="../js/main.js"></script>

	<!-- ======================== -->
	<!-- <script type="text/javascript">
	$("#mainText").html("${requestScope.blog.b_mainText }");
</script> -->
	<!-- ======================== -->

</body>
<script type="text/javascript">
function showSubCommentForm(c_id){
	var id = c_id;
	var $parent = $("#subCommentFormDiv"+id);
	var $test = $("<input type='text'>")
	var $commentForm = $("<input class='full-width' id='subCommentContent' type='email' placeholder='评论...' ><br><input type='button' id='subCommentSubmit' onclick='submitSubComment("+id+")' class='submit button-primary' value='提交'>");
	$parent.append($commentForm);

}
//添加二级评论
function submitSubComment(c_id){
	var subCommentContent = $("#subCommentContent").val();
	//var u_id = $("#u_id").val();
	//var c_id = $("#c_id").val();
	var u_id = ${user.u_id};
	if(subCommentContent.length==0){
		alert("评论内容为空！");
	}else{
		var params = {
				"b_id" : ${b_id }, 
	    		"u_id" : u_id,
	    		"c_id" : c_id,
	    		"s_content":subCommentContent
	        };
	       	
		        $.ajax({
	        	type:"post",
	        	url:"${pageContext.request.contextPath}/commentController/addSubComment.action",
	        	contentType:"application/json",
	        	data: JSON.stringify(params),
	        	success:function(data){
	        		var date = formatTime(data.s_time);
	        		$subComment=$("<li class='depth-3' id='subCommentLi"+data.s_id+"'><div class='comment-content'><div class='comment-info'><cite>"+data.u_name+"&nbsp&nbsp&nbsp&nbsp"+data.s_floor+"楼</cite><div class='comment-meta'><span class='comment-time'>"+date+"</span></div></div><div class='comment-text'><p>"+data.s_content+"</p></div><div align='right'><button class='submit button-primary'onclick='deleteSubComment("+data.s_id+")'>删除</button></div></div></li>");
	        		$parent=$("#subCommentContainer"+c_id);
	        		$parent.append($subComment);
	        		alert("评论成功！");
	        		$("#subCommentContent").remove();
	        		
	        		$("#subCommentSubmit").remove();
	        	} 
	        });  
	}
	
	//加1评论
	changeCommentsNum(1);
}

//添加一级评论
function submitCommentLogin(u_id,b_id){
	
	var commentContent = $("#commentText").val();
	if(commentContent.length==0){
		alert("评论内容为空！");
	}
	else{
		 var params = {
		    		"u_id" : u_id,
		    		"b_id" : b_id,
		    		"c_content":commentContent
		        };
		       	
			        $.ajax({
		        	type:"post",
		        	url:"${pageContext.request.contextPath}/commentController/addBlogComment.action",
		        	contentType:"application/json", 
		        	data: JSON.stringify(params),
		        	success:function(data){
		        		alert("评论成功！");   
		        		date = formatTime(data.c_time);
		        		var $comment= $("<div id='commentDiv"+data.c_id+"'><li class='depth-1'><div><div><div class='comment-content' id='comment-content'><div class='comment-info'><cite>"+data.u_name+"&nbsp&nbsp&nbsp&nbsp"+data.c_floor+"楼</cite><div class='comment-meta'><span>"+date+"</span></div></div><div class='comment-text'><p>"+data.c_content+"</p></div><div id='subCommentForm'></div><div align='right'><button class='submit button-primary'onclick='deleteComment("+data.c_id+")'>删除</button><button id='submitSubComment' class='submit button-primary'onclick='showSubCommentForm("+data.c_id+")'>评论</button></div></div></div></div><div id='subCommentFormDiv"+data.c_id+"'></div></li><ul class='children' id='subCommentContainer"+data.c_id+"'></ul></div> "); 
		        		//var $comment= $("<li class='depth-1'><div><div class='avatar'><img width='50' height='50' class='avatar' src='${sessionScope.user.pic.p_url}' alt=''></div><div class='comment-content'><div class='comment-info'><cite>"+data.u_name+"</cite><div class='comment-meta'><time class='comment-time' datetime='2014-07-12'>"+date+"</time></div></div><div class='comment-text'><p>"+data.c_content+"</p></div></div></div></li>"	); 
		        		var $parent = $("#commentContainer"); 
		        		$parent.append($comment);
		        	}
		        });  
	}
	//加1评论
	changeCommentsNum(1);
}
//时间格式化
function formatTime(intTime) {
	var time = new Date(intTime);
	var date = time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+" "+time.getHours()+":"+time.getMinutes()+":"+time.getSeconds()+".0";
	return date;
}

//删除一级评论
function deleteComment(c_id) {
	var param = {
		"c_id":c_id,
    };
	$.ajax({
    	type:"post",
    	url:"${pageContext.request.contextPath}/commentController/deleteComment.action",
    	contentType:"application/json", 
    	data: param,
    	success:function(data){
    		if(data.result == 1){
    			alert("删除成功");
	    		//移除评论标签
	    		$("#commentDiv"+c_id).remove();
    		}else{
    			alert("删除失败");
    		}
    	}
    });   	
	//先获取子评论数量,再加1
	var lis = $("#subCommentContainer"+c_id).find(".depth-3");
	var num = lis.length + 1;
	//减1评论
	changeCommentsNum(-num);
}

//删除二级评论
function deleteSubComment(s_id) {
	var param = {
		"s_id":s_id,
    };
	$.ajax({
    	type:"post",
    	url:"${pageContext.request.contextPath}/commentController/deleteSubComment.action",
    	contentType:"application/json", 
    	data: param,
    	success:function(data){
    		if(data.result == 1){
    			alert("删除成功");
	    		//移除次级评论标签
	    		//清空子标签
	    		$("#subCommentLi"+s_id).remove();
    		}else{
    			alert("删除失败");
    		}
    	}
    });   	
	//减1次级评论
	changeCommentsNum(-1, s_id);    
}

//改变评论数显示
function changeCommentsNum(change,s_id) {
	var text = $("#commentsNum").text();
	var num = text.split("评论")[0];
	num = parseInt(num) + parseInt(change);
	numStr = num + "评论";
	$("#commentsNum").html(numStr);
	//ajax更新数据库  更新评论数量
	var param = {
			"b_id" : ${b_id },
			"b_commentsNum" : num,
	};
	$.ajax({
    	type:"post",
    	url:"${pageContext.request.contextPath}/BlogController/updateBlogCommentsNum.action",
    	contentType:"application/json", 
    	data: JSON.stringify(param),
    	success:function(data){
    		if(data.result == 1){
	    		//移除次级评论标签
	    		//清空子标签
	    		if (s_id != null) {
		    		$("#subCommentLi"+s_id).remove(); 
				}
    		}else{
    			alert("更新评论数量: 更新数据库失败!");
    		}
    	}
    }); 
}
</script>
</html>