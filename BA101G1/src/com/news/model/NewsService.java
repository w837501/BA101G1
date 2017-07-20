package com.news.model;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import com.news.model.NewsDAO;
import com.news.model.NewsDAO_interface;
import com.news.model.NewsVO;

public class NewsService {
	
private NewsDAO_interface dao;
	
	public NewsService() {
		dao = new NewsDAO();
	}
	
	public NewsVO addNews( String man_id, String news_name, String news_content, byte[] news_image){
		
		NewsVO newsVO=new NewsVO();
		newsVO.setMan_id(man_id);
		newsVO.setNews_name(news_name);
		newsVO.setNews_content(news_content);
		newsVO.setNews_image(news_image);
//		newsVO.setNews_time(news_time);
		dao.insert(newsVO);
		
		return newsVO;
	}
	public NewsVO updateNews(String man_id ,String news_id ,String news_name ,String news_content ,
			byte[] news_image ) throws IOException{
		NewsVO newsVO = new NewsVO();
		
		newsVO.setMan_id(man_id);
		newsVO.setNews_id(news_id);
		newsVO.setNews_name(news_name);
		newsVO.setNews_content(news_content);
		newsVO.setNews_image(news_image);
		dao.update(newsVO);
		
		return newsVO ;
	}
	
	
	public void deleteNews(String news_id) {
		dao.delete(news_id);
	}
	public NewsVO getOneNews(String news_id, String man_id) {
		return dao.findByPrimaryKey(news_id);
	}
	public List<NewsVO> getAll() {
		return dao.getAll();
	}
}
