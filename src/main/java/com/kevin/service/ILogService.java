package com.kevin.service;

import java.util.List;

import com.kevin.entity.TLog;

public interface ILogService {
	public List<TLog> getAllLogs();
	public int insertLog(TLog log);
}
