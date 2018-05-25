package com.krry.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.krry.entity.Params;
import com.krry.service.IBlogService;

/**
 * KrryController
 * controller层，作为请求转发
 * @author asusaad
 *
 */
@Controller  //表示是多例模式，每个用户返回的web层是不一样的
public class KrryController {
	
	@Autowired
	private IBlogService blogService;
	
	/**
	 * 首页，并且分页查询
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(Params params){
		
		params.setPageNo(0);
		params.setPageSize(10); //一开始只查询10条
		
		//调用业务层
		List<HashMap<String, Object>> blogs = blogService.findBlogs(params);
		//查询博客数量
		long coutBlogs = blogService.countBlogs();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("blogs", blogs);
		modelAndView.addObject("coutBlogs", coutBlogs);
		modelAndView.setViewName("index");
		
		return modelAndView;
	}
	
	/**
	 * ajax请求 的 分页查询
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loadData")
	public HashMap<String, Object> loadData(Params params){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> blogs = blogService.findBlogs(params);
		map.put("blogs", blogs);
		
		return map;
	}
	
}



