package com.krry.mapper;

import java.util.HashMap;
import java.util.List;
import com.krry.entity.Params;

/**
 * 
 * Mapper：操作数据库
 * @author krry
 * @version 1.0.0
 *
 */
public interface BlogMapper {

	/**
	 * 查询所有博客
	 * @param params
	 * @return
	 */
	public List<HashMap<String, Object>> findBlogs(Params params);
	
	/**
	 * 计算博客数量
	 * com.krry.dao.admin 
	 * 方法名：countBlogs
	 * @author krry 
	 * @param params
	 * @return int
	 * @exception 
	 * @since  1.0.0
	 */
	public long countBlogs();
	
	
}
