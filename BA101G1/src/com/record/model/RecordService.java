package com.record.model;

import java.util.List;

public class RecordService {
	
	private RecordDAO_interface dao;
	
	public RecordService(){
		dao = new RecordDAO();
	}
	
	public RecordVO addRecord(String rec_id, String mem_id, java.sql.Timestamp rec_date, Integer rec_mon){
		
		RecordVO recordVO = new RecordVO();
		
		recordVO.setRec_id(rec_id);
		recordVO.setMem_id(mem_id);
		recordVO.setRec_date(rec_date);
		recordVO.setRec_mon(rec_mon);
		dao.insert(recordVO);
		
		return recordVO;
	}
	
	public RecordVO updateRecord(String rec_id, String mem_id, java.sql.Timestamp rec_date, Integer rec_mon){
		
		RecordVO recordVO = new RecordVO();
		recordVO.setRec_id(rec_id);
		recordVO.setMem_id(mem_id);
		recordVO.setRec_date(rec_date);
		recordVO.setRec_mon(rec_mon);
		dao.update(recordVO);
		
		return recordVO;
	}
	
	public void deleteRecord(String rec_id){
		dao.delete(rec_id);
	}
	
	public RecordVO getOneRecord(String rec_id){
		return dao.findByPrimaryKey(rec_id);
	}
	
	public List<RecordVO>getAll(){
		return dao.getAll();
	}
}
