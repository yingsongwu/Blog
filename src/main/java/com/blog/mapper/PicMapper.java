package com.blog.mapper;

import com.blog.pojo.Pic;

public interface PicMapper {
	int addPic(Pic pic) throws Exception;
	int deletePic(Pic pic) throws Exception;
	int updatePic(Pic pic) throws Exception;
	Pic findById(int p_id) throws Exception;
}
