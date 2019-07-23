package com.kevin.service;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.kevin.entity.PageBean;
import com.kevin.entity.RoleBean;
import com.kevin.entity.UserBean;

public interface IUserService{
	 public PageInfo<UserBean> findUserByPage(int page, int pageSize);
	 UserBean findById(int id);
	 public int updateUser(UserBean user);
	 public int deleteUser(int id);
	 public int addUser(UserBean user);
	public List<RoleBean> selectRoleAndDefault(UserBean user);
}
