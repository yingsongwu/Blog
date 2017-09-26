<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>个人博客</title>
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


<!-- script
   ================================================== -->
<script src="../js/modernizr.js"></script>
<script src="../js/pace.min.js"></script>

<!-- favicons
	================================================== -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

</head>
<title>Insert title here</title>
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
				href="${pageContext.request.contextPath }/BlogController/blogList.action">我的博客</a></li>

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

			<form role="search" method="post" class="search-form"
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


	<!-- masonry
   ================================================== -->
	<section id="bricks">

	<div class="row masonry">

		<!-- brick-wrapper -->
		<div class="bricks-wrapper">

			<div class="grid-sizer"></div>
			<c:forEach items="${requestScope.list}" var="name">



				<article class="brick entry format-standard animate-this">

				<div class="entry-thumb">
					<a href="single-standard.html" class="thumb-link"> <img
						src="../images/thumbs/${name.p_url}" alt="building">
					</a>
				</div>

				<div class="entry-text">
					<div class="entry-header">

						<div class="entry-meta">
							<span class="cat-links"> <a
								href="${pageContext.request.contextPath }/BlogController/ShowBlogByUser.action?u_name=${name.u_name }&page=1">${name.u_name }</a>
								<a
								href="${pageContext.request.contextPath }/BlogController/ShowBlogByType.action?t_name=${name.t_name }&page=1">${name.t_name }</a>
								<a>${name.b_readNum }</a>
							</span>
						</div>

						<h1 class="entry-title">
							<a
								href="${pageContext.request.contextPath }/BlogController/ShowBlogText.action?b_id=${name.b_id}">${name.b_title}</a>
						</h1>

					</div>
					<div class="entry-excerpt">${name.b_info}</div>
					<div align="right">${name.b_time}</div>
				</div>

				</article>
				<!-- end article -->
			</c:forEach>


		</div>
		<!-- end brick-wrapper -->

	</div>
	<!-- end row -->

	<div class="row">

		<nav class="pagination"> <a
			href="${pageContext.request.contextPath }/BlogController/ShowBlogBypage.action?page=1"><span
			class="page-numbers current">首页</span> </a> <c:forEach var="i" begin="1"
			end="${requestScope.pageCount }" step="1">
			<a
				href="${pageContext.request.contextPath }/BlogController/ShowBlogBypage.action?page=${i}"><span
				class="page-numbers current"><c:out value="${i}" /> </span> </a>
		</c:forEach> <a
			href="${pageContext.request.contextPath }/BlogController/ShowBlogBypage.action?page=${requestScope.pageCount }"><span
			class="page-numbers current">尾页</span> </a> </nav>

	</div>

	</section>
	<!-- end bricks -->



	<!-- footer
   ================================================== -->


	<!-- Java Script
   ================================================== -->
	<script src="../js/jquery-2.1.3.min.js"></script>
	<script src="../js/plugins.js"></script>
	<script src="../js/jquery.appear.js"></script>
	<script src="../js/main.js"></script>

</body>

</html>