package com.krry.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.krry.entity.Params;
import com.krry.mapper.BlogMapper;
import com.krry.service.IBlogService;

/**
 * 实现service层接口
 * @author asusaad
 *
 */
@Service
public class BlogService implements IBlogService{

	@Autowired
	private BlogMapper blogMapper;
	
	/**
	 * 查询博客
	 */
	public List<HashMap<String, Object>> findBlogs(Params params) {
		
		//查询博客信息
		List<HashMap<String, Object>> blog = blogMapper.findBlogs(params);
		
		
		return blog;
	}
	
	/**
	 * 计算博客数量
	 * @param params
	 * @return
	 */
	public long countBlogs(){
		
		long coutBlogs = blogMapper.countBlogs();
		
		return coutBlogs;
	}
	
	

}
