package com.kevin.service;
import java.util.List;
import com.kevin.entity.TFault;

public interface IFaultService{
	public int insertInitFault(TFault fault);
	public int updateFaultState(int id,String tState);
	public int updateFault(TFault fault);
	public List<TFault> getStarterFaultsByState(int tStarter,String t_state);
	public List<TFault> getStartFaultsByStarter(int tStarter);
}
