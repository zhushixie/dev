package com.kevin.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.kevin.entity.DeptBean;

public interface IDeptService {
	public PageInfo<DeptBean> findDeptsByPage(int page, int pageSize);
	public List<DeptBean> selectName();
}
