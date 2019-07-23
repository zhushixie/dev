package com.kevin.serviceImp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.kevin.entity.AcUserBean;
import com.kevin.entity.TDevtype;
import com.kevin.mapper.DevTypeMapper;
import com.kevin.mapper.SysUserMapper;
import com.kevin.service.IDevTypeService;
import com.kevin.service.ISysUserService;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 */
@Service
public class DevTypeServiceImpl implements IDevTypeService {

	@Autowired
	private DevTypeMapper devTypeMapper;

	@Override
	public List<TDevtype> getAllDevTypes(String type) {
		return devTypeMapper.getAllDevTypes(type);
	}

	@Override
	public int insertDevType(TDevtype devType) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDevType(int devTypeId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateDevType(TDevtype devType) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TDevtype findDevTypeById(int devTypeId) {
		return devTypeMapper.findDevTypeById(devTypeId);
	}

}