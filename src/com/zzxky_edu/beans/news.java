package com.zzxky_edu.beans;

import java.util.Date;
import java.util.Set;

public class news {
	//����id
	private Integer news_id;
	// ���ű���ͼƬ
	private String news_titleImage;
	//���ű���
	private String news_title;
	//��������
	private String news_content;
	//������Ƶ
	private String news_video;
	//��������ͼƬ
	private Set<String> news_contentImage;
	//����ʱ��
	private Date news_updateTime;
	//�������
	private Integer news_readCount;
	//���α༭
	private String news_writer;
	//�Ƿ��ö�
	private boolean news_top;

	public Integer getNews_id() {
		return news_id;
	}

	public void setNews_id(Integer news_id) {
		this.news_id = news_id;
	}

	public String getNews_titleImage() {
		return news_titleImage;
	}

	public void setNews_titleImage(String news_titleImage) {
		this.news_titleImage = news_titleImage;
	}

	public String getNews_title() {
		return news_title;
	}

	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}

	public String getNews_content() {
		return news_content;
	}

	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}

	public String getNews_video() {
		return news_video;
	}

	public void setNews_video(String news_video) {
		this.news_video = news_video;
	}



	public Set<String> getNews_contentImage() {
		return news_contentImage;
	}

	public void setNews_contentImage(Set<String> news_contentImage) {

		this.news_contentImage = news_contentImage;
	}

	public Date getNews_updateTime() {
		return news_updateTime;
	}

	public void setNews_updateTime(Date news_updateTime) {
		this.news_updateTime = news_updateTime;
	}

	public Integer getNews_readCount() {
		return news_readCount;
	}

	public void setNews_readCount(Integer news_readCount) {
		this.news_readCount = news_readCount;
	}

	public String getNews_writer() {
		return news_writer;
	}

	public void setNews_writer(String news_writer) {
		this.news_writer = news_writer;
	}

	public boolean isNews_top() {
		return news_top;
	}

	public void setNews_top(boolean news_top) {
		this.news_top = news_top;
	}

}
