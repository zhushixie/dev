package com.kevin.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kevin.entity.RoleBean;
import com.kevin.entity.UserRoleBean;
import com.kevin.mapper.RoleMapper;
import com.kevin.service.IRoleService;
@Service
public class RoleServiceImpl implements IRoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Override
	public List<RoleBean> findAllRole() {
		return roleMapper.findAllRole();
	}
	@Override
	public List<RoleBean> findSelectedRoles(int id) {
		return roleMapper.findSelectedRoles(id);
	}
	@Override
	public int deleteUserRole(UserRoleBean userRole) {
		return roleMapper.deleteUserRole(userRole);
	}
	@Override
	public int addUserRole(UserRoleBean userRole) {
		return roleMapper.addUserRole(userRole);
	}
	@Override
	public int deleteRole(RoleBean userRole) {
		return roleMapper.deleteRole(userRole);
	}
	@Override
	public int addRole(RoleBean userRole) {
		return roleMapper.addRole(userRole);
	}
	/**
	 * 查找最下面的角色id
	 */
	@Override
	public RoleBean findRoleByUserId(int userId) {
		//查找对应的角色Id
		 UserRoleBean rs = roleMapper.findRolesByUserId(userId);
		 if(rs==null){
			 return null;
		 }
		 RoleBean roleMsg = roleMapper.findRoleById(rs.getRoleId());
		return roleMsg;
	}
}
