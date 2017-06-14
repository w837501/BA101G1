package com.record.model;

import java.util.*;

public interface RecordDAO_interface {
	public void insert(RecordVO recordVO);
	public void update(RecordVO recordVO);
	public void delete(String rec_id);
	public RecordVO findByPrimaryKey(String rec_id);
	public List<RecordVO> getAll();
}
