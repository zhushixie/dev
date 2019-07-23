package com.kevin.mapper;
import org.apache.ibatis.annotations.Param;

import com.kevin.entity.AcUserBean;

/**
 * <p>
  * 用户表 Mapper 接口
 * </p>
 */
public interface SysUserMapper{
	public AcUserBean selectOne(@Param("ac_name")String name,@Param("ac_pwd")String pwd);
}