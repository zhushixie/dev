package com.kevin.mapper;

import java.util.List;

import com.kevin.entity.RoleBean;
import com.kevin.entity.UserBean;
import com.kevin.entity.UserRoleBean;

public interface RoleMapper {
	public List<RoleBean> findAllRole();
	public List<RoleBean> findSelectedRoles(int id);
	public int deleteUserRole(UserRoleBean userRole);
	public int addUserRole(UserRoleBean userRole);
	public int deleteRole(RoleBean userRole);
	public int addRole(RoleBean userRole);
	public UserRoleBean findRolesByUserId(int userId);
	public RoleBean findRoleById(int roleId);
	public int findRoleByName(String name);
	public List<UserBean> getAllCheckMan(int roleId);
	
}
