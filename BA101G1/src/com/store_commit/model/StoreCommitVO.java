package com.store_commit.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class StoreCommitVO implements Serializable {
	
	private String sc_id;
	private String store_id;
	private String mem_id;
	private String sc_content;
	private Timestamp sc_time;
	private String sc_state;
	private int sc_score;
	
	public StoreCommitVO(){
		
	}
	
	
	public String getSc_id() {
		return sc_id;
	}
	public void setSc_id(String sc_id) {
		this.sc_id = sc_id;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getSc_content() {
		return sc_content;
	}
	public void setSc_content(String sc_content) {
		this.sc_content = sc_content;
	}
	public Timestamp getSc_time() {
		return sc_time;
	}
	public void setSc_time(Timestamp sc_time) {
		this.sc_time = sc_time;
	}
	public String getSc_state() {
		return sc_state;
	}
	public void setSc_state(String sc_state) {
		this.sc_state = sc_state;
	}


	public int getSc_score() {
		return sc_score;
	}


	public void setSc_score(int sc_score) {
		this.sc_score = sc_score;
	}

}
