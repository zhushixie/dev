package com.kevin.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kevin.entity.AcUserBean;
import com.kevin.entity.TAccessory;
import com.kevin.entity.TWarerecord;

/**
 * <p>
  * 用户表 Mapper 接口
 * </p>
 */
public interface AccessoryMapper{
	public int insertAccessory(TAccessory tAccessory);
	public int updateAccessory(@Param("t_count")int tCount,@Param("t_code")String tCode);
	public int checkCodeIsInTable(String tCode);
	public int getAccessoryMountByCode(String tCode);
	public int insertRecord(TWarerecord record);
	public List<TWarerecord> getRecordsByUserIdAndType(@Param("t_user")int userId,@Param("t_type")String tType);
	public List<TWarerecord> getWareRecordsByType(String tType);
}