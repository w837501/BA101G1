package com.mem.model;

import java.util.List;



public class MemberService {
private MemberDAO_interface dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}
	
	public MemberVO addMem(String mem_name, String mem_phone, String mem_pw, String mem_mail){
		MemberVO memVO=new MemberVO();
		
		memVO.setMem_name(mem_name);
		memVO.setMem_phone(mem_phone);
		memVO.setMem_pw(mem_pw);
		memVO.setMem_mail(mem_mail);
		
		dao.insert(memVO);
		
		return memVO;
	}
	
	public MemberVO updateMem(String mem_id, String mem_name, String mem_phone, String mem_pw, String mem_mail){
		MemberVO memVO=new MemberVO();
		
		memVO.setMem_id(mem_id);
		memVO.setMem_name(mem_name);
		memVO.setMem_phone(mem_phone);
		memVO.setMem_pw(mem_pw);
		memVO.setMem_mail(mem_mail);
		dao.update(memVO);
		
		return memVO;
		
	}
	public void deleteMem(String mem_id) {
		dao.delete(mem_id);
	}
	public MemberVO getOneMem(String mem_id) {
		return dao.findByPrimaryKey(mem_id);
	}
	public List<MemberVO> getAll() {
		return dao.getAll();
	}
	public MemberVO getMem_Acc(String mem_mail) {
		return dao.findAcc(mem_mail);
	}
	public MemberVO updateMemberState(String mem_state , String mem_id){
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_state(mem_state);
		memberVO.setMem_id(mem_id);
		dao.updateMemberState(mem_state, mem_id);
		return memberVO;
		
	}
	
	public Integer getAllUncheckedCount(){
		return dao.getAllUncheckedCount();
	}
}
