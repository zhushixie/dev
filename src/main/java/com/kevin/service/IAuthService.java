package com.kevin.service;

import java.util.List;

import com.kevin.entity.AuthBean;
import com.kevin.entity.TRoleauth;

public interface IAuthService {
	public List<AuthBean> findAllAuth();
	public List<AuthBean> findSelectedAuths(int id);
	public int deleteRoleAuth(TRoleauth role);
	public int addRoleAuth(TRoleauth role);
	public List<TRoleauth> findAuthByRoleId(int roleId);
	public AuthBean findEleByAuthId(int authId);
}
