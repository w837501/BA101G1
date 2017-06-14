package com.permission.model;

import java.util.*;

public interface PermissionDAO_interface {
	public void insert(PermissionVO permissionVO);
	public void update(PermissionVO permissionVO);
	public void delete(String man_id);
	public PermissionVO findByPrimaryKey(String man_id);
	public List<PermissionVO> getAll();
}
