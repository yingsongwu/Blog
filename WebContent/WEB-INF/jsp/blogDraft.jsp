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
<!-- <link href="../css/reset.css" rel="stylesheet" type="text/css"> -->
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/table.css" rel="stylesheet" type="text/css">
 

<!-- script
   ================================================== -->
<script src="../js/modernizr.js"></script>
<script src="../js/pace.min.js"></script>
<script src="../js/jquery-1.7.2.min.js"></script>
<script src="../js/jquery.movebg.js"></script>

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
			<li class="has-children"><a href="category.html" title="">排行榜</a>
				<ul class="sub-menu">
					<li><a
						href="${pageContext.request.contextPath }/BlogController/ShowBlogNum.action">评论榜</a></li>
					<li><a
						href="${pageContext.request.contextPath }/BlogController/ShowBlogReadNum.action">人气榜</a></li>
				</ul></li>
			<li><label>欢迎您：${sessionScope.user.u_name } </label></li>
			<li><a
				href="${pageContext.request.contextPath }/UserController/Quit.action">退出</a>
			</li>
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


	<!-- 字导航栏-->
	<div class="wraper">
		<div class="nav">
			<ul style="list-style:none;">
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/BlogController/blogList.action">文章管理</a></li>
				<!-- <li class="nav-item"><a href="">类别管理</a></li>
				<li class="nav-item"><a href="">评论管理</a></li>
				<li class="nav-item"><a href="">博客配置</a></li>
				<li class="nav-item"><a href="">博客栏目</a></li> -->
				<li class="nav-item cur"><a
					href="${pageContext.request.contextPath}/BlogController/blogDraft.action">草稿箱</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/BlogController/blogDeleted.action">回收站</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/BlogController/blogWrite.action">写博客</a></li>
			</ul>
			<!--移动的滑动-->
			<div class="move-bg"></div>
			<!--移动的滑动 end-->
		</div>
	</div>

	<script>
	$(function(){
		$(".nav").movebg({width:120/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	})
	</script>

	<!-- content
   ================================================== -->
	<section id="content-wrap" class="blog-single">
	<div class="row">
		<div class="col-twelve" align="center">

			<div class="primary-content">
				<div>
					<table class="tb">
						<tr>
							<th class="tb th thtitle" style="width:250px;">标题</th>
							<th class="tb th" style="width:70px;">阅读</th>
							<th class="tb th" style="width:70px;">评论</th>
							<th class="tb th" style="width:200px;">操作</th>
						</tr>
						<c:forEach var="blog" items="${requestScope.list}">
							<tr>
								<div id=blog${blog.b_id}>
									<td><a
										href="${pageContext.request.contextPath}/BlogController/findBlogById.action?b_id=${blog.b_id}">
											${blog.b_title }<font style="color: #999;">(${blog.b_time})</font> </a></td>
									<td style="text-align:center;">${blog.b_readNum}</td>
									<td style="text-align:center;">${blog.b_commentsNum}</td>
									<td style="text-align:center;"><a href="${pageContext.request.contextPath}/BlogController/blogEdit.action?b_id=${blog.b_id}" >编辑</a> | <a
										href="javascript:void(0);"
										onclick="delBlogById(${blog.b_id});">删除
									</td>
								</div>
							</tr>
						</c:forEach>
					</table>
				</div>


				<script type="text/javascript">
					function delBlogById(b_id) {
						var param ={
								"b_id":b_id
							};
						$.ajax({
							type:"post",
							url:"${pageContext.request.contextPath}/BlogController/delBlogById.action",
							contentType:"application/json",
							data: JSON.stringify(param),
							success:function(data){
								alert('删除成功');
								//alert("#blog"+b_id);
								$("#blog"+b_id).remove();
								window.location="${pageContext.request.contextPath}/BlogController/blogDraft.action";
							}
						});
						
					};
				</script>
			</div>
		</div>
		<!-- end col-twelve -->
	</div>
	<!-- end row --> </section>
	<div class="row">
   		<nav class="pagination">
		   	<c:forEach var="i" begin="1" end="${requestScope.pageCount }" step="1">   
            <a href="${pageContext.request.contextPath }/BlogController/blogDraftBypage.action?page=${i}" ><span class="page-numbers current"><c:out value="${i}" /> </span> </a> 
            </c:forEach>  
	      </nav>
   	</div>

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
				<div class="copyright">
					<span>© Copyright Abstract 2016</span> <span>More Templates
						<a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
						- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
						target="_blank">网页模板</a>
					</span>
				</div>

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
	<script src="../js/plugins.js"></script>
	<script src="../js/main.js"></script>

</body>
</html>