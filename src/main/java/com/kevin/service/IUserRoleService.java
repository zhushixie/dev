package com.kevin.service;

import java.util.List;

import com.kevin.entity.UserRoleBean;

/**
 * <p>
 * 用户角色关联表 服务类
 * </p>
 *
 * @author GaoJun.Zhou
 * @since 2017-06-30
 */
public interface IUserRoleService{
	public List<UserRoleBean> findByUserId(int id);
	
}
