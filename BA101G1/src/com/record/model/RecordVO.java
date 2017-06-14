package com.record.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class RecordVO implements Serializable{
	private String rec_id;
	private String mem_id;
	private Timestamp rec_date;
	private Integer rec_mon;
	public String getRec_id() {
		return rec_id;
	}
	public void setRec_id(String rec_id) {
		this.rec_id = rec_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public RecordVO() {
		super();
	}
	public Timestamp getRec_date() {
		return rec_date;
	}
	public void setRec_date(Timestamp rec_date) {
		this.rec_date = rec_date;
	}
	public Integer getRec_mon() {
		return rec_mon;
	}
	public void setRec_mon(Integer rec_mon) {
		this.rec_mon = rec_mon;
	}
}
