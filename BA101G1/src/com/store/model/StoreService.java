package com.store.model;

<<<<<<< HEAD
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;



public class StoreService {
	
	
		private StoreDAO_interface dao;
		
		public StoreService(){
			dao = new StoreDAO();
		}
	
		
		public StoreVO addStore(Integer sc_id , String store_name, String store_content,
								Integer store_phone,String store_addr,Date store_date,Integer store_star,
								Integer store_count,Integer store_state, byte[] store_image, Integer store_report_count,
								Timestamp store_start_time, Timestamp store_end_time, String store_pw, String store_acc,
								Integer store_out, String store_zone) throws IOException{
			
			StoreVO svo = new StoreVO();
			svo.setSc_id(sc_id);
			svo.setStore_name(store_name);
			svo.setStore_content(store_content);
			svo.setStore_phone(store_phone);
			svo.setStore_addr(store_addr);
			svo.setStore_date(store_date);
			svo.setStore_star(store_star);
			svo.setStore_count(store_count);
			svo.setStore_state(store_state);
			svo.setStore_image(store_image);
			svo.setStore_report_count(store_report_count);
			svo.setStore_start_time(store_start_time);
			svo.setStore_end_time(store_end_time);
			svo.setStore_pw(store_pw);
			svo.setStore_acc(store_acc);
			svo.setStore_out(store_out);
			svo.setStore_zone(store_zone);
			dao.insert(svo);
			
			return svo;
		}
		
		public StoreVO updateStore(String store_id, Integer sc_id , String store_name, String store_content,
				Integer store_phone,String store_addr,Date store_date,Integer store_star,
				Integer store_count,Integer store_state, byte[] store_image, Integer store_report_count,
				Timestamp store_start_time, Timestamp store_end_time, String store_pw, String store_acc,
				Integer store_out, String store_zone) throws IOException{

			StoreVO svo = new StoreVO();
			svo.setStore_id(store_id);
			svo.setSc_id(sc_id);
			svo.setStore_name(store_name);
			svo.setStore_content(store_content);
			svo.setStore_phone(store_phone);
			svo.setStore_addr(store_addr);
			svo.setStore_date(store_date);
			svo.setStore_star(store_star);
			svo.setStore_count(store_count);
			svo.setStore_state(store_state);
			svo.setStore_image(store_image);
			svo.setStore_report_count(store_report_count);
			svo.setStore_start_time(store_start_time);
			svo.setStore_end_time(store_end_time);
			svo.setStore_pw(store_pw);
			svo.setStore_acc(store_acc);
			svo.setStore_out(store_out);
			svo.setStore_zone(store_zone);
			dao.insert(svo);
			
			return svo;
		}
	
		public void deleteStore(String store_id) {
			dao.delete(store_id);
		}

		public StoreVO getOneStore(String store_id) {
			return dao.findByPrimaryKey(store_id);
		}

		public List<StoreVO> getAll() {
			return dao.getAll();
		}

 // ¦Ñ®v½d¨Ò UploadTest_Servlet3 ¦³§óºëÂ²¼gªk
//	private static byte[] getPictureByteArray(String string)throws IOException {
//		File file = new File(string);
//		FileInputStream fis = new FileInputStream(file);
//		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		byte[] image = new byte[8192];
//		int i ;
//		while((i = fis.read(image)) != -1){
//			baos.write(image,0,i);
//		}
//		baos.close();
//		fis.close();	
//		return baos.toByteArray();
//	}
}
	
	


=======
import java.util.List;

import com.store.model.StoreVO;

public class StoreService {
	
	private StoreDAO_interface dao;
	
	public StoreService(){
		dao = new StoreDAO();
	}
	public StoreVO addStore(Number sc_id, String store_name, String store_content, String store_phone,String store_addr, byte[] store_image, String store_pw,String store_acc,Number store_out,String store_zone){
		StoreVO storeVO=new StoreVO();
		
		storeVO.setSc_id(sc_id);
		storeVO.setStore_name(store_name);
		storeVO.setStore_content(store_content);
		storeVO.setStore_phone(store_phone);
		storeVO.setStore_addr(store_addr);
		storeVO.setStore_image(store_image);
		storeVO.setStore_pw(store_pw);
		storeVO.setStore_acc(store_acc);
		storeVO.setStore_out(store_out);
		storeVO.setStore_zone(store_zone);
		
		dao.insert(storeVO);
		
		return storeVO;
	}
	
	public StoreVO updateStore(Number sc_id, String store_content, String store_phone, String store_addr,byte[] store_image, Number store_out, String store_zone,String store_pw,String store_id){
		StoreVO storeVO=new StoreVO();
		
		storeVO.setSc_id(sc_id);
		storeVO.setStore_content(store_content);
		storeVO.setStore_phone(store_phone);
		storeVO.setStore_addr(store_addr);
		storeVO.setStore_image(store_image);
		storeVO.setStore_out(store_out);
		storeVO.setStore_zone(store_zone);
		storeVO.setStore_pw(store_pw);
		storeVO.setStore_id(store_id);
		dao.update(storeVO);
		
		return storeVO;
		
	}
	public void deleteStore(String store_id) {
		dao.delete(store_id);
	}
	public StoreVO getOneStore(String store_id) {
		return dao.findByPrimaryKey(store_id);
	}
	public List<StoreVO> getAll() {
		return dao.getAll();
	}
	public List<StoreVO> getName(String store_name) {
		return dao.findName(store_name);
	}
	public List<StoreVO> getZone(String store_zone) {
		return dao.findZone(store_zone);
	}
}
>>>>>>> branch 'ç¬¨' of https://github.com/w837501/BA101G1.git
