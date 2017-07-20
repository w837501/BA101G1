package com.mem.model;

import java.util.List;

public interface MemberDAO_interface {
	public void insert(MemberVO memberVO);
    public void update(MemberVO memberVO);
    public void delete(String mem_id);
    public MemberVO findByPrimaryKey(String mem_id);
    public List<MemberVO> getAll();
    public MemberVO findAcc(String mem_mail);
    
    public List<MemberVO> getAllUncheckedMember();
    public void updateMemberState(String mem_state , String mem_id);
    
    public Integer getAllUncheckedCount();
}
