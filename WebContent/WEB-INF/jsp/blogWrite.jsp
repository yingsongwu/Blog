<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8">
	<title>个人博客</title>
	 <meta charset="utf-8">
	<title>Standard Format Post - Abstract</title>

   <!-- mobile specific metas
   ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

 	<!-- CSS
   ================================================== -->
   <link rel="stylesheet" href="../css/base.css">
   <link rel="stylesheet" href="../css/vendor.css">  
   <link rel="stylesheet" href="../css/main.css">
   <link href="../css/reset.css" rel="stylesheet" type="text/css">
   <link href="../css/index.css" rel="stylesheet" type="text/css">
   	<link rel="stylesheet" href="../editor.md-master/css/style.css" />
	<link rel="stylesheet" href="../editor.md-master/css/editormd.css" />
	
   

   <!-- script
   ================================================== -->
	<script src="../js/modernizr.js"></script>
	<script src="../js/pace.min.js"></script>
	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<!-- <script src="../js/jquery-1.7.2.min.js"></script> -->
	<script src="../js/jquery.movebg.js"></script>
	 
	<script src="../editor.md-master/js/jquery.min.js"></script>
    <script src="../editor.md-master/editormd.js"></script>

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
	         <a href="${pageContext.request.contextPath }/BlogController/ShowBlog.action">Author</a>
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
			</nav> <!-- end main-nav-wrap -->

			<div class="search-wrap">
				
				<form role="search" method="get" class="search-form" action="${pageContext.request.contextPath }/BlogController/ShowBlogSearch.action">
					<label>
						<span class="hide-content">Search for:</span>
						<input type="search" class="search-field" placeholder="Type Your Keywords" value="" name="s" title="Search for:" autocomplete="off">
					</label>
					<input type="submit" class="search-submit" value="Search">
				</form>

				<a href="#" id="close-search" class="close-btn">Close</a>

			</div> <!-- end search wrap -->	

			<div class="triggers">
				<a class="search-trigger" href="#"><i class="fa fa-search"></i></a>
				<a class="menu-toggle" href="#"><span>Menu</span></a>
			</div> <!-- end triggers -->	
   		
   	</div>     		
   	
   </header> <!-- end header -->

	<!-- 字导航栏-->
		<div class="wraper">
		    <div class="nav">
		        <ul>
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

		<!-- <script>
		$(function(){
			$(".nav").movebg({width:120/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
		})
		</script> -->
   <!-- content
   ================================================== -->
   <section id="content-wrap" class="blog-single">
   	<div class="row">
   		<div class="col-twelve">

           	<!--   ===================================== -->
			<div>
				<div>
		        	<input class="full-width" type="email" placeholder="欢迎使用博客编辑器，请输入标题" id="inputTitle">
		        	<input class="full-width" type="email" placeholder="请输入该博客简单描述" id="inputInfo">
				</div>
				
		<!-- editor.md -->
		<div class="editormd" id="test-editormd" style="list-style:none;"></div>
		
		<!-- editor.md -->
					
			<a class="button full-width" onclick="blogSave();">保存</a>
			<a class="button button-primary full-width" onclick="blogSubmit();">提交</a>
		</div>
	</body>
	<script type="text/javascript">
            var testEditor;
            $(function() {
                $.get("../editor.md-master/init.md", function(md){
                    testEditor = editormd("test-editormd", {
                        width: "100%",
                        height: 740,
                        path : '../editor.md-master/lib/',
                        markdown : md,
                        codeFold : true,
                        syncScrolling : 'single',
                        saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea
                        searchReplace : true,
                        htmlDecode : "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启    
                        //toolbar  : false,             //关闭工具栏
                        //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
                        emoji : true,
                        taskList : true,
                        tocm            : true,         // Using [TOCM]
                        tex : true,                   // 开启科学公式TeX语言支持，默认关闭
                        flowChart : true,             // 开启流程图支持，默认关闭
                        sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
                        //dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
                        //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
                        //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
                        dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
                        //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
                        imageUpload : true,
                        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                        imageUploadURL : "<%=request.getContextPath()%>/uploadfile.action",
                        onload : function() {
                            console.log('onload', this);
                            //this.fullscreen();
                            //this.unwatch();
                            //this.watch().fullscreen();

                            //this.setMarkdown("#PHP");
                            //this.width("100%");
                            //this.height(480);
                            //this.resize("100%", 640);
                        }
                    });
                });
            });
        </script>
	
	<script type="text/javascript">
		//var ue = UE.getContent();
		function blogSubmit() {
			  //获取界面中的博客
	        var b_title = $("#inputTitle").val();
			var b_info = $("#inputInfo").val();
	        var b_mainText = testEditor.getHTML();
	        var b_srcText = testEditor.getMarkdown();
	        var u_id = 1;
	        var p_id = 1;
	        var t_id = 1;
	        var params = {
        		"b_title" : b_title,
        		"b_info" : b_info,
	        	"b_mainText":b_mainText,
	        	"b_srcText":b_srcText,
	        	"u_id":u_id,
	        	"p_id":p_id,
	        	"t_id":t_id
	        };
 	        $.ajax({
	        	type:"post",
	        	url:"${pageContext.request.contextPath}/BlogController/addBlog.action",
	        	contentType:"application/json",
	        	data: JSON.stringify(params),
	        	success:function(data){
	        		if(data){
	        			alert("博客提交成功");
	        		    window.location.href = '${pageContext.request.contextPath}/BlogController/blogList.action';
	        		} else {
						alert("博客提交失败");
					}
	        	}
	        });
		}
		
		function blogSave() {
	        //获取界面中的博客
	      	var b_title = $("#inputTitle").val();
			var b_info = $("#inputInfo").val();
			var b_mainText = testEditor.getHTML();
			var b_srcText = testEditor.getMarkdown();
	        var u_id = 1;
	        var p_id = 1;
	        var t_id = 1;
	        var params = {
        		"b_title" : b_title,
        		"b_info" : b_info,
	        	"b_mainText":b_mainText,
	        	"b_srcText":b_srcText,
	        	"u_id":u_id,
	        	"p_id":p_id,
	        	"t_id":t_id
	        };
 	        $.ajax({
	        	type:"post",
	        	url:"${pageContext.request.contextPath}/BlogController/saveBlog.action",
	        	contentType:"application/json",
	        	data: JSON.stringify(params),
	        	success:function(data){
	        		if(data){
	        			alert("博客保存成功");
	        			window.location.href = '${pageContext.request.contextPath}/BlogController/blogList.action';
	        		} else {
	        			alert("博客保存失败");
	        		}
	        	}
	        });
		}
	</script>
			</div> <!-- end col-twelve -->
   	</div> <!-- end row -->
   		
   </section>


   <!-- footer
   ================================================== -->
   <footer>

   	<div class="footer-main">

   		<div class="row">  

	      	<div class="col-four tab-full mob-full footer-info">            

	            <h4>About Our Site</h4>

	               <p>
		          	Lorem ipsum Ut velit dolor Ut labore id fugiat in ut fugiat nostrud qui in dolore commodo eu magna Duis cillum dolor officia esse mollit proident Excepteur exercitation nulla. Lorem ipsum In reprehenderit commodo aliqua irure labore.
		          	</p>

		      </div> <!-- end footer-info -->

	      	<div class="col-two tab-1-3 mob-1-2 site-links">

	      		<h4>Site Links</h4>

	      		<ul>
	      			<li><a href="#">About Us</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Privacy Policy</a></li>
					</ul>

	      	</div> <!-- end site-links -->  

	      	<div class="col-two tab-1-3 mob-1-2 social-links">

	      		<h4>Social</h4>

	      		<ul>
	      			<li><a href="#">Twitter</a></li>
						<li><a href="#">Facebook</a></li>
						<li><a href="#">Dribbble</a></li>
						<li><a href="#">Google+</a></li>
						<li><a href="#">Instagram</a></li>
					</ul>
	      	           	
	      	</div> <!-- end social links --> 

	      	<div class="col-four tab-1-3 mob-full footer-subscribe">

	      		<h4>Subscribe</h4>

	      		<p>Keep yourself updated. Subscribe to our newsletter.</p>

	      		<div class="subscribe-form">
	      	
	      			<form id="mc-form" class="group" novalidate="true">

							<input type="email" value="" name="dEmail" class="email" id="mc-email" placeholder="Type &amp; press enter" required=""> 
	   		
			   			<input type="submit" name="subscribe" >
		   	
		   				<label for="mc-email" class="subscribe-message"></label>
			
						</form>

	      		</div>	      		
	      	           	
	      	</div> <!-- end subscribe -->         

	      </div> <!-- end row -->

   	</div> <!-- end footer-main -->

      <div class="footer-bottom">
      	<div class="row">

      		<div class="col-twelve">
	      		<div class="copyright">
		         	<span>© Copyright Abstract 2016</span> 
		         	<span>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></span>		         	
		         </div>

		         <div id="go-top">
		            <a class="smoothscroll" title="Back to Top" href="#top"><i class="icon icon-arrow-up"></i></a>
		         </div>         
	      	</div>

      	</div> 
      </div> <!-- end footer-bottom -->  

   </footer>  

   <div id="preloader"> 
    	<div id="loader"></div>
   </div> 

   <!-- Java Script
   ================================================== --> 
  <!--  <script src="../js/jquery-2.1.3.min.js"></script> -->
  <script src="../js/plugins.js"></script>
   <script src="../js/main.js"></script>

</body>
</html>