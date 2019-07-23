package com.kevin.service;

import java.util.List;
import com.kevin.entity.RoleBean;
import com.kevin.entity.UserRoleBean;

public interface IRoleService{

	public List<RoleBean> findAllRole();
	public List<RoleBean> findSelectedRoles(int id);
	public int deleteUserRole(UserRoleBean userRole);
	public int addUserRole(UserRoleBean userRole);
	public int deleteRole(RoleBean userRole);
	public int addRole(RoleBean userRole);
	public RoleBean findRoleByUserId(int userId);
}