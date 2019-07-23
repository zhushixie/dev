package com.kevin.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kevin.entity.TFault;
import com.kevin.mapper.FaultMapper;
import com.kevin.service.IFaultService;
@Service
public class FaultServiceImpl implements IFaultService{
	@Autowired
	private FaultMapper faultMapper;
	@Override
	public int insertInitFault(TFault fault) {
		return faultMapper.insertInitFault(fault);
	}
	@Override
	public int updateFaultState(int id, String tState) {
		return faultMapper.updateFaultState(id, tState);
	}
	@Override
	public int updateFault(TFault fault) {
		return faultMapper.updateFault(fault);
	}
	@Override
	public List<TFault> getStarterFaultsByState(int tStarter, String t_state) {
		return faultMapper.getStarterFaultsByState(tStarter, t_state);
	}
	@Override
	public List<TFault> getStartFaultsByStarter(int tStarter) {
		return faultMapper.getStartFaultsByStarter(tStarter);
	}
}
