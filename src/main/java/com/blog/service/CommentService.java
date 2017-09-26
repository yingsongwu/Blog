package com.blog.service;

import java.util.ArrayList;

import com.blog.pojo.Comment;
import com.blog.pojo.CommentVo;
import com.blog.pojo.SubComment;
import com.blog.pojo.SubCommentVo;

public interface CommentService {

	int getMaxFloorByBid(int b_id) throws Exception;

	ArrayList<CommentVo> getAllCommentsByBid(int b_id) throws Exception;

	CommentVo addBlogComment(Comment comment) throws Exception;

	SubCommentVo addSubComment(SubComment subComment) throws Exception;

	int deleteComment(int c_id) throws Exception;

	int deleteSubComment(int s_id) throws Exception;

}
