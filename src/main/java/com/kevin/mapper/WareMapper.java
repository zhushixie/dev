package com.kevin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kevin.entity.TWaretask;
import com.kevin.entity.TWareview;

public interface WareMapper {
	public int insertTask(TWaretask task);
	public int updateTask(TWaretask task);
	public int deleteTask(int id);
	public int insertView(TWareview view);
	public List<TWareview> findViewsByTaskId(int taskId);
	public List<TWaretask> getAllTaskList(@Param("t_starter")Integer starter,@Param("t_state")String state);
	public List<TWaretask> getKeeperStartTaskList(@Param("t_starter")Integer starter);
	public List<TWaretask> getKeeperFinishTaskList(@Param("t_starter")Integer starter);
	public List<TWaretask> getTaskListByState(@Param("t_state")String state);
	public TWaretask findTaskById(int id);
	public int updateTaskState(@Param("id")int id,@Param("t_state")String state);
	public List<TWaretask> getTaskListByExecuterId(int id);
	public int updateTaskCheckerView(@Param("t_checkerid")int checkerId,@Param("t_checkerview")String view,@Param("id")int id);
	public int updateTaskManagerView(@Param("t_managerid")int managerId,@Param("t_managerview")String view,@Param("id")int id);
	public int updateTaskDirectorView(@Param("t_directorid")int directorId,@Param("t_directorview")String view,@Param("id")int id);
	
}
