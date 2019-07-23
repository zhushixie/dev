package com.kevin.service;
import java.util.List;

import com.kevin.entity.TDumptask;
public interface IDumpService{
	public int saveTask(TDumptask task);
	public int startTask(TDumptask task);
	public List<TDumptask> selectOnTasksByStaterid(int userid);
	public List<TDumptask> selectSaveTasksByStaterid(int userid);
	public List<TDumptask> selectTaskRecordByStaterid(int userid);
	public List<TDumptask> selectTaskByState(String tState);
	public TDumptask selectTaskById(int id);
	public int updateTaskCheckerState(int id,int userid,String tState,String checkerView);
	public int updateTaskDirectorState(int id,int userid,String tState,String directorView);
	public int updateTaskManagerState(int id,int userid,String tState,String managerView);
}
