package com.kevin.service;
import com.kevin.entity.AcUserBean;

/**
 * <p>
 * 用户表 服务类
 * </p>
 * */
public interface ISysUserService {

	/**
	 * 创建用户
	 * @param user
	 * @param roleId
	 */
	void addUser(AcUserBean user, String[] roleIds);
	
	/**
	 * 更新用户
	 * @param user
	 * @param roleIds
	 */
	void updateUser(AcUserBean user, String[] roleIds);

	/**
	 * 删除用户
	 * @param id
	 */
	void deleteUser(String[] id);
	
	 public AcUserBean selectOne(String name,String pwd);
	
}
