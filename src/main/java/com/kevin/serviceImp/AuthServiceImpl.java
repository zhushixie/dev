package com.kevin.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kevin.entity.AuthBean;
import com.kevin.entity.TRoleauth;
import com.kevin.mapper.AuthMapper;
import com.kevin.service.IAuthService;
@Service
public class AuthServiceImpl implements IAuthService {

	@Autowired
	private AuthMapper authMapper;
	@Override
	public List<AuthBean> findAllAuth() {
		return authMapper.findAllAuth();
	}
	@Override
	public List<AuthBean> findSelectedAuths(int id) {
		return authMapper.findSelectedAuths(id);
	}
	@Override
	public int deleteRoleAuth(TRoleauth role) {
		return authMapper.deleteRoleAuth(role);
	}
	@Override
	public int addRoleAuth(TRoleauth role) {
		return authMapper.addRoleAuth(role);
	}
	@Override
	public List<TRoleauth> findAuthByRoleId(int roleId) {
		// TODO Auto-generated method stub
		return authMapper.findAuthByRoleId(roleId);
	}
	@Override
	public AuthBean findEleByAuthId(int authId) {
		// TODO Auto-generated method stub
		return authMapper.findEleByAuthId(authId);
	}
}
