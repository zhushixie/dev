package com.kevin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kevin.entity.TDumptask;

public interface DumpMapper {
	/**
	 * @author kevin
	 * @note 插入报废任务
	 * @return
	 */
	public int insertTask(TDumptask task);
	public List<TDumptask> selectTasks();
	public TDumptask selectTaskById(int id);
	public List<TDumptask> selectOnTasksByStaterid(int starterid);
	public List<TDumptask> selectSaveTasksByStaterid(int starterid);
	public List<TDumptask> selectTaskRecordByStaterid(int starterid);
	public List<TDumptask> selectTaskByState(String tState);
	public int updateTaskCheckerState(@Param("id")int id,@Param("t_checkerid")int userid,@Param("t_state")String tState,@Param("t_checkerview")String checkerView);
	public int updateTaskDirectorState(@Param("id")int id,@Param("t_directorid")int userid,@Param("t_state")String tState,@Param("t_directorview")String directorView);
	public int updateTaskManagerState(@Param("id")int id,@Param("t_managerid")int userid,@Param("t_state")String tState,@Param("t_managerview")String managerView);
}
