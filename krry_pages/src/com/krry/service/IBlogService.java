package com.krry.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

import com.krry.entity.Blog;
import com.krry.entity.Params;

/**
 * service层：处理业务逻辑（impl里面实现）
 * @author asusaad
 *
 */
public interface IBlogService {
	
	/**
	 * 分页查询所有博客
	 * @param params
	 * @return
	 */
	public List<HashMap<String, Object>> findBlogs(Params params);
	
	/**
	 * 计算博客数量
	 * @param params
	 * @return
	 */
	public long countBlogs();
	
}
