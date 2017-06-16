package com.push.model;

import java.util.List;

public interface PushDAO_interface {
	public void insert(PushVO pushVO);
	public void update(PushVO pushVO);
	public void delete(String pushId);
	public PushVO findPrimaryKey(String pushId);
	public List<PushVO> getAll();
}
