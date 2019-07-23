package com.kevin.service;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kevin.entity.TAccessory;
import com.kevin.entity.TWarerecord;
import com.kevin.entity.TWaretask;
import com.kevin.entity.TWareview;

/**
 * <p>
 * 用户角色关联表 服务类
 * </p>
 *
 * @author GaoJun.Zhou
 * @since 2017-06-30
 */
public interface IWareService{
	public int insertTask(TWaretask task);
	public int updateTask(TWaretask task);
	public int deleteTask(int id);
	public int updateTaskState(int id,String state);
	public int insertView(TWareview view);
	public List<TWareview> findViewsByTaskId(int taskId);
	public List<TWaretask> getAllTaskList(int id,String state);
	public List<TWaretask> getKeeperStartTaskList(int starter);
	public List<TWaretask> getKeeperFinishTaskList(int starter);
	public List<TWaretask> getTaskListByState(String state);
	public TWaretask findTaskById(int id);
	public List<TWaretask> getTaskListByExecuterId(int id);
	/**
	 * 零配件管理
	 */
	public int insertAccessory(TAccessory tAccessory);
	public int updateAccessory(int tCount,String tCode);
	public int checkCodeIsInTable(String tCode);
	public int getAccessoryMountByCode(String tCode);
	
	public int insertRecord(TWarerecord record);
	public List<TWarerecord> getRecordsByUserIdAndType(int userId,String tType);
	public List<TWarerecord> getWareRecordsByType(String tType);
	
	
	public int updateTaskCheckerView(int checkId, String view,int id);
	public int updateTaskManagerView(int managerId, String view,int id);
	public int updateTaskDirectorView(int directorId, String view,int id);
}
