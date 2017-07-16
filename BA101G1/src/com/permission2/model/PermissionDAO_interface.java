package com.permission2.model;

import java.util.*;
import com.man.model.ManagerVO;

public interface PermissionDAO_interface {
	public void insert(PermissionVO permissionVO);
	public void update(PermissionVO permissionVO);
	public void delete(ManagerVO managerVO);
	public PermissionVO findByPrimaryKey(ManagerVO managerVO);
	public List<PermissionVO> getAll();
}
