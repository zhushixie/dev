package com.kevin.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kevin.entity.DeptBean;
import com.kevin.entity.PageBean;
import com.kevin.entity.RoleBean;
import com.kevin.entity.UserBean;
import com.kevin.mapper.DeptMapper;
import com.kevin.mapper.RoleMapper;
import com.kevin.mapper.UserMapper;
import com.kevin.service.IUserService;
@Service
public class UserServiceImpl implements IUserService{
	   //注入
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private DeptMapper deptMapper;
    @Autowired
    private RoleMapper roleMapper;

	@Override
	public UserBean findById(int id) {
		UserBean user = userMapper.findById(id);
		if("".equals(user.getDeptId())||"0".equals(user.getDeptId())||user.getDeptId()==null)return user;
		
		DeptBean dept  = deptMapper.findById(user.getDeptId());
		user.setDeptName(dept.getName());
	        return user;
	}
	 public PageInfo<UserBean> findUserByPage(int page, int pageSize) {
	  PageHelper.startPage(page, pageSize);
	  List<UserBean> list = userMapper.selectAll();
	  return new PageInfo<UserBean>(list);
	 }
	@Override
	public int updateUser(UserBean user) {
		return userMapper.updateByPrimaryKey(user);
	}
	@Override
	public List<RoleBean> selectRoleAndDefault(UserBean user) {
		List<RoleBean> roleList = roleMapper.findAllRole();
		//roleList.
		return null;
	}
	@Override
	public int deleteUser(int id) {
		return 0;
	}
	@Override
	public int addUser(UserBean user) {
		userMapper.insert(user);
		return 0;
	}
}
