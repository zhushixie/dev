package com.kevin.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kevin.entity.TFault;

public interface FaultMapper {
	public int insertInitFault(TFault fault);
	public int updateFaultState(int id,String tState);
	public int updateFault(TFault fault);
	public List<TFault> getStarterFaultsByState(@Param("t_starter")int tStarter,@Param("t_state")String t_state);
	public List<TFault> getStartFaultsByStarter(int tStarter);
}
