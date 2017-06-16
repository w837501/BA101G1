package com.push.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class PushVO implements Serializable{
	private String push_id;
	private String man_id;
	private String push_content;
	private Timestamp push_time;
	private String news_id;
	private String ad_id;
	
	public PushVO(){
		
	}
	public PushVO(String push_id, String man_id, String push_content, Timestamp push_time, String news_id,
			String ad_id) {
		super();
		this.push_id = push_id;
		this.man_id = man_id;
		this.push_content = push_content;
		this.push_time = push_time;
		this.news_id = news_id;
		this.ad_id = ad_id;
	}
	public String getPush_id() {
		return push_id;
	}
	public void setPush_id(String push_id) {
		this.push_id = push_id;
	}
	public String getMan_id() {
		return man_id;
	}
	public void setMan_id(String man_id) {
		this.man_id = man_id;
	}
	public String getPush_content() {
		return push_content;
	}
	public void setPush_content(String push_content) {
		this.push_content = push_content;
	}
	public Timestamp getPush_time() {
		return push_time;
	}
	public void setPush_time(Timestamp push_time) {
		this.push_time = push_time;
	}
	public String getNews_id() {
		return news_id;
	}
	public void setNews_id(String news_id) {
		this.news_id = news_id;
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}

	

}
