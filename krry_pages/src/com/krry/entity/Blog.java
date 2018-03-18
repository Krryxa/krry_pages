package com.krry.entity;


/**
 * 
 * User
 * @author krry
 * @version 1.0.0
 *
 */
public class Blog {

	// 主键
	private String id;
	//博客标题
	private String title;
	//音乐作者
	private String musictor;
	//音乐标题
	private String musictitle;
	//创建时间
	private String createTime;
	 
	public Blog(String id, String title, String musictor, String musictitle,
			String createTime) {
		this.id = id;
		this.title = title;
		this.musictor = musictor;
		this.musictitle = musictitle;
		this.createTime = createTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMusictor() {
		return musictor;
	}

	public void setMusictor(String musictor) {
		this.musictor = musictor;
	}

	public String getMusictitle() {
		return musictitle;
	}

	public void setMusictitle(String musictitle) {
		this.musictitle = musictitle;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	 
	 
}