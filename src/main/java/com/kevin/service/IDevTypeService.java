package com.kevin.service;

import java.util.List;

import com.kevin.entity.TDevtype;

public interface IDevTypeService {
	public List<TDevtype> getAllDevTypes(String type);
	public int insertDevType(TDevtype devType);
	public int deleteDevType(int devTypeId);
	public int updateDevType(TDevtype devType);
	public TDevtype findDevTypeById(int devTypeId);

}
