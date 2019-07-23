package com.kevin.serviceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.kevin.entity.AcUserBean;
import com.kevin.mapper.SysUserMapper;
import com.kevin.service.ISysUserService;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 */
@Service
public class SysUserServiceImpl implements ISysUserService {

	@Autowired
	private SysUserMapper sysUserDao;
	@Override
	public AcUserBean selectOne(String name, String pwd) {
		// TODO Auto-generated method stub
		return sysUserDao.selectOne(name, pwd);
	}

	@Override
	public void addUser(AcUserBean user, String[] roleIds) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(AcUserBean user, String[] roleIds) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(String[] id) {
		// TODO Auto-generated method stub
		
	}
}