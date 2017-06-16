package com.news.model;

import java.sql.Timestamp;

public class NewsVO implements java.io.Serializable{

	private String news_id;
	private String man_id;
	private String news_name;
	private String news_content;
	private byte[] news_image;
	private Timestamp news_time;
	private String news_push_content;
	
	public String getNews_id() {
		return news_id;
	}
	public void setNews_id(String news_id) {
		this.news_id = news_id;
	}
	public String getMan_id() {
		return man_id;
	}
	public void setMan_id(String man_id) {
		this.man_id = man_id;
	}
	public String getNews_name() {
		return news_name;
	}
	public void setNews_name(String news_name) {
		this.news_name = news_name;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public byte[] getNews_image() {
		return news_image;
	}
	public void setNews_image(byte[] news_image) {
		this.news_image = news_image;
	}
	public Timestamp getNews_time() {
		return news_time;
	}
	public void setNews_time(Timestamp news_time) {
		this.news_time = news_time;
	}
	public String getNews_push_content() {
		return news_push_content;
	}
	public void setNews_push_content(String news_push_content) {
		this.news_push_content = news_push_content;
	}
	
	
}
