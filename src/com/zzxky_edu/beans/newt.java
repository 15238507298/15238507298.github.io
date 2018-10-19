package com.zzxky_edu.beans;

import java.util.Set;

public class newt {
	//新闻类型id
	private Integer newt_id;
	//新闻类型
	private String newt_type;
	//新闻类型图片
	private String newt_image;
	//新闻(新闻表)
	private Set<news> newt_news;

	public Integer getNewt_id() {
		return newt_id;
	}

	public void setNewt_id(Integer newt_id) {
		this.newt_id = newt_id;
	}

	public String getNewt_type() {
		return newt_type;
	}

	public void setNewt_type(String newt_type) {
		this.newt_type = newt_type;
	}

	public String getNewt_image() {
		return newt_image;
	}

	public void setNewt_image(String newt_image) {
		this.newt_image = newt_image;
	}

	public Set<news> getNewt_news() {
		return newt_news;
	}

	public void setNewt_news(Set<news> newt_news) {
		this.newt_news = newt_news;
	}

}
