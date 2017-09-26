package com.blog.mapper;

import java.util.ArrayList;

import com.blog.pojo.Comment;
import com.blog.pojo.CommentVo;
import com.blog.pojo.SubComment;
import com.blog.pojo.SubCommentVo;

public interface CommentMapper {

	ArrayList<CommentVo> getBlogCommentsByBid(int b_id) throws Exception;

	ArrayList<SubCommentVo> getSubCommentsByCid(int c_id) throws Exception;

	Integer getMaxBlogFloor(int b_id) throws Exception;
//添加一级评论
	int addBlogComment(Comment comment) throws Exception;

	CommentVo getCommentByCid(int new_c_id) throws Exception;

	Integer getMaxSubFloor(int c_id) throws Exception;

	void addSubComment(SubComment subComment) throws Exception;

	SubCommentVo getSubCommentBySid(int s_id) throws Exception;

	int deleteComment(int c_id) throws Exception;

	int deleteSubComment(int s_id) throws Exception;

}
