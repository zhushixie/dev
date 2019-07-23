package com.kevin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kevin.entity.TRoutedev;
import com.kevin.entity.TRoutetask;

public interface RouteMapper {
	public int insertTask(TRoutetask task);
	public List<TRoutetask> findSaveTask(int id);
	public List<TRoutetask> findStartTask(int id);
	public TRoutetask findTaskById(int id);
	public int updateTask(TRoutetask task);
	public List<TRoutetask> findMyRouteTask(int userId);//查找发布的任务
	public List<TRoutetask> findMyExecuteTask(int userId);//查找正在执行的任务
	public List<TRoutetask> myRouteTaskHistory(int userId);
	public int updateTaskState(@Param("t_type")String tType,@Param("id")int id);
	public int updateTaskReason(@Param("t_reason")String tReason,@Param("id")int id);
	public int deleteTask(int id);
	public List<TRoutetask> adminRouteTaskHistory(int userId);
	
	public int insertDevMsg(TRoutedev dev);
	public List<TRoutedev> findDevMsg(int id);
}
