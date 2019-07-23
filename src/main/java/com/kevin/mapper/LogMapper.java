package com.kevin.mapper;

import java.util.List;

import com.kevin.entity.TLog;

public interface LogMapper {
	public List<TLog> getAllLogs();
	public int insertLog(TLog log);
}
