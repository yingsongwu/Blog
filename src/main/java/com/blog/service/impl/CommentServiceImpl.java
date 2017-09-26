package com.blog.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.blog.mapper.BlogMapper;
import com.blog.mapper.CommentMapper;
import com.blog.pojo.Blog;
import com.blog.pojo.Comment;
import com.blog.pojo.CommentVo;
import com.blog.pojo.SubComment;
import com.blog.pojo.SubCommentVo;
import com.blog.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	
	private static final Logger LOG = Logger.getLogger(CommentService.class);
	@Resource
	private CommentMapper commentMapper;
	@Resource
	private BlogMapper blogMapper;
	

	public int getMaxFloorByBid(int b_id) throws Exception {
		return 0;
	}

	public ArrayList<CommentVo> getAllCommentsByBid(int b_id) throws Exception {
		ArrayList<CommentVo> comments = null;
		comments = commentMapper.getBlogCommentsByBid(b_id);
		if(comments==null){
			return null;
		}else{
			ArrayList<SubCommentVo> subComments = null;
			for (CommentVo comment : comments) {
				subComments = commentMapper.getSubCommentsByCid(comment.getC_id());
				comment.setSubCommentVo(subComments);
			}
			return comments;
		}
	}

	@Override
	public CommentVo addBlogComment(Comment comment) {
		CommentVo commentVo = null;
		Integer maxFloor = null;
		try {
			//得到最大楼层数
			maxFloor = commentMapper.getMaxBlogFloor(comment.getB_id());
			if(maxFloor==null){
				comment.setC_floor(1);
			}else{
			//根据最大楼层数、用户id、博客id添加评论
			    comment.setC_floor(++maxFloor);
			}
			commentMapper.addBlogComment(comment);
			commentVo = commentMapper.getCommentByCid(comment.getC_id());
			
		} catch (Exception e) {
			LOG.info("CommentService.addBlogComment(b_id) e:" + e);
		}
		
		return commentVo;
	}

	@Override
	public SubCommentVo addSubComment(SubComment subComment) {
		SubCommentVo subCommentVo = null;
		Integer maxFloor = null;
		//int new_c_id = 0;
		try {
			//得到最大楼层数
			maxFloor = commentMapper.getMaxSubFloor(subComment.getC_id());
			if(maxFloor==null){
				subComment.setS_floor(1);
			}else{
				//根据最大楼层数、用户id、评论id添加评论
				subComment.setS_floor(++maxFloor);
			}
			commentMapper.addSubComment(subComment);
			subCommentVo = commentMapper.getSubCommentBySid(subComment.getS_id());
			
		} catch (Exception e) {
			LOG.info("CommentService.addBlogComment(b_id) e:" + e);
		}
		return subCommentVo;
	}

	@Override
	public int deleteComment(int c_id) throws Exception {
		int result = 0;
		result = commentMapper.deleteComment(c_id);
		return result;
	}

	@Override
	public int deleteSubComment(int s_id) throws Exception {
		int result = 0;
		result = commentMapper.deleteSubComment(s_id);
		return result;
	}
	

}
