package com.blog.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.pojo.Comment;
import com.blog.pojo.CommentVo;
import com.blog.pojo.SubComment;
import com.blog.pojo.SubCommentVo;
import com.blog.service.CommentService;

/**
 * @author xxxindy 评论Controller
 */
@Controller
@RequestMapping("/commentController")
public class CommentController {

	private static final Logger LOG = Logger.getLogger(CommentController.class);

	@Resource
	private CommentService commentService;

	// 添加一级评论
	@RequestMapping("/addBlogComment.action")
	@ResponseBody
	public CommentVo addBlogComment(@RequestBody Comment comment) {
		CommentVo commentVo = null;
		try {
			commentVo = commentService.addBlogComment(comment);
		} catch (Exception e) {
			LOG.info("CommentController.addBlogComment(comment) e:" + e);
		}
		return commentVo;
	}

	// 添加二级评论
	@RequestMapping("/addSubComment.action")
	@ResponseBody
	public SubCommentVo addSubComment(@RequestBody SubComment subComment) {
		SubCommentVo subCommentVo = null;
		try {
			subCommentVo = commentService.addSubComment(subComment);
		} catch (Exception e) {
			LOG.info("CommentController.addBlogComment(comment) e:" + e);
		}
		return subCommentVo;
	}

	// 删除一级评论
	@RequestMapping("/deleteComment.action")
	@ResponseBody
	public Map<String, Integer> deleteComment(@RequestBody String c_id) {
		Map<String, Integer> map = new HashMap<>();
		Integer result = null;

		// 删除评论
		try {
			// 传过来的是 "c_id=100"这种数据 不知道怎么回事
			c_id = c_id.substring(5);
			int new_c_id = Integer.parseInt(c_id);
			result = commentService.deleteComment(new_c_id);
		} catch (Exception e) {
			LOG.info("CommentController.deleteComment(c_id) e:" + e);
		}

		// 用于返回信息
		map.put("result", result);
		return map;
	}

	// 删除二级评论
	@RequestMapping("/deleteSubComment.action")
	@ResponseBody
	public Map<String, Integer> deleteSubComment(@RequestBody String s_id) {
		Map<String, Integer> map = new HashMap<>();
		Integer result = null;

		// 删除评论
		try {
			// 传过来的是 "s_id=100"这种数据 不知道怎么回事
			s_id = s_id.substring(5);
			int new_s_id = Integer.parseInt(s_id);
			result = commentService.deleteSubComment(new_s_id);
		} catch (Exception e) {
			LOG.info("CommentController.deleteSubComment(s_id) e:" + e);
		}

		// 用于返回信息
		map.put("result", result);
		return map;
	}
	
}
