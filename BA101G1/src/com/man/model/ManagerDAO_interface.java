package com.man.model;

import java.util.List;


public interface ManagerDAO_interface {
	public void insert(ManagerVO managerVO);
    public void update(ManagerVO managerVO);
    public void delete(String man_id);
    public ManagerVO findByPrimaryKey(String man_id);
    public List<ManagerVO> getAll();

}
