package com.blog.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	private static final Logger LOG = Logger.getLogger(BlogController.class);
	
	@RequestMapping(value="/uploadfile.action",method=RequestMethod.POST)
	  public void hello(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
	      try {
	          request.setCharacterEncoding( "utf-8" );
	          response.setHeader( "Content-Type" , "text/html" );
	          String rootPath = //new String("E:/guigu/tomcat/apache-tomcat-8.0.45/upload/");
	        		  request.getSession().getServletContext().getRealPath("/resources/upload/");

	          /**
	           * 文件路径不存在则需要创建文件路径
	           */
	          File filePath=new File(rootPath);
	          if(!filePath.exists()){
	              filePath.mkdirs();
	          }

	          //最终文件名
	          File realFile=new File(rootPath+File.separator+attach.getOriginalFilename());
	          FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);

	          //下面response返回的json格式是editor.md所限制的，规范输出就OK
	          response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\""+request.getSession().getServletContext().getContextPath()+"/resources/upload/" + attach.getOriginalFilename() + "\"}" );
	      } catch (Exception e) {
	          try {
	              response.getWriter().write( "{\"success\":0}" );
	          } catch (IOException e1) {
	              e1.printStackTrace();
	          }
	      }
	  }
}
