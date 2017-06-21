package com.ad.model;

import java.sql.Timestamp;
import java.util.List;

import com.ad.model.AdVO;

public class AdService {
	
	private AdDAO_interface dao;
	
	public AdService() {
		dao = new AdDAO();
	}
	
	public AdVO addRev(String ad_id, String store_id, String ad_name, String ad_content, byte[] ad_image, Timestamp ad_time, Number ad_state, String ad_push_content ){
		AdVO adVO = new AdVO();
		
		adVO.setAd_id(ad_id);
		adVO.setStore_id(store_id);
		adVO.setAd_name(ad_name);
		adVO.setAd_content(ad_content);
		adVO.setAd_image(ad_image);
		adVO.setAd_time(ad_time);
		adVO.setAd_state(ad_state);
		adVO.setAd_push_content(ad_push_content);
		
		dao.insert(adVO);
		
		return adVO;
	}
	
	public AdVO updateRev(String ad_id, String store_id, String ad_name, String ad_content, byte[] ad_image, Timestamp ad_time, Number ad_state, String ad_push_content ){
		AdVO adVO=new AdVO();
		
		adVO.setAd_id(ad_id);
		adVO.setStore_id(store_id);
		adVO.setAd_name(ad_name);
		adVO.setAd_content(ad_content);
		adVO.setAd_image(ad_image);
		adVO.setAd_time(ad_time);
		adVO.setAd_state(ad_state);
		adVO.setAd_push_content(ad_push_content);
		dao.update(adVO);
		
		return adVO;
		
	}
	
	public void deleteRev(String ad_id) {
		dao.delete(ad_id);
	}
	public AdVO getOneEmp(String ad_id, String store_id) {
		return dao.findByPrimaryKey(ad_id);
	}
	public List<AdVO> getAll() {
		return dao.getAll();
	}
	public List<AdVO> getAvailableAD() {
		return dao.getAvailableAD();
	}
}
