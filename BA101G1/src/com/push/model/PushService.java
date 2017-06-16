package com.push.model;

import java.util.List;


public class PushService {


	private PushDAO_interface dao;

	public PushService() {
		dao = new PushJNDIDAO();
	}

	public PushVO addEmp(String man_id, String push_content, java.sql.Timestamp push_time,
			String news_id, String ad_id) {

		PushVO pushVO = new PushVO();

		pushVO.setMan_id(man_id);
		pushVO.setPush_content(push_content);
		pushVO.setPush_time(push_time);
		pushVO.setNews_id(news_id);
		pushVO.setAd_id(ad_id);
		dao.insert(pushVO);

		return pushVO;
	}

	public PushVO updateEmp(String push_id, String man_id, String push_content,
			java.sql.Timestamp push_time, String news_id, String ad_id) {

		PushVO pushVO = new PushVO();

		pushVO.setPush_id(push_id);
		pushVO.setMan_id(man_id);
		pushVO.setPush_content(push_content);
		pushVO.setPush_time(push_time);
		pushVO.setNews_id(news_id);
		pushVO.setAd_id(ad_id);
		dao.update(pushVO);

		return pushVO;
	}

	public void deleteEmp(String push_id) {
		dao.delete(push_id);
	}

	public PushVO getOneEmp(String push_id) {
		return dao.findPrimaryKey(push_id);
	}

	public List<PushVO> getAll() {
		return dao.getAll();
	}
}
