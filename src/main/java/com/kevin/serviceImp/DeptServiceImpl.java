package com.kevin.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kevin.entity.DeptBean;
import com.kevin.mapper.DeptMapper;
import com.kevin.service.IDeptService;
@Service
public class DeptServiceImpl implements IDeptService{

	@Autowired
	private DeptMapper deptMapper;
	//查找部门详细信息
	@Override
	public PageInfo<DeptBean> findDeptsByPage(int page, int pageSize) {
		  PageHelper.startPage(page, pageSize);
		  List<DeptBean> list = deptMapper.selectAll();
		  return new PageInfo<DeptBean>(list);
	}

	//查找部门列表
	@Override
	public List<DeptBean> selectName() {
		List<DeptBean> rs = deptMapper.selectName();
		return rs;
	}
}
