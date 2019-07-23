package com.kevin.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kevin.entity.TLog;
import com.kevin.mapper.LogMapper;
import com.kevin.service.ILogService;
@Service
public class LogServiceImpl implements ILogService{
	@Autowired
	private LogMapper logMapper;
	@Override
	public List<TLog> getAllLogs() {
		return logMapper.getAllLogs();
	}

	@Override
	public int insertLog(TLog log) {
		return logMapper.insertLog(log);
	}

}
