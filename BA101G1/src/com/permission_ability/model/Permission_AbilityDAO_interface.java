package com.permission_ability.model;

import java.util.*;

public interface Permission_AbilityDAO_interface {
    public void insert(Permission_AbilityVO paVO);
    public void update(Permission_AbilityVO paVO);
    public void delete(String pano);
    public Permission_AbilityVO findByPrimaryKey(String pano);
    public List<Permission_AbilityVO> getAll();
}
