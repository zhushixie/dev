package com.kevin.service;

import java.util.List;

import com.kevin.entity.TRoutedev;
import com.kevin.entity.TRoutetask;
import com.kevin.entity.UserBean;

public interface IRouteService {
	public List<UserBean> getAllRouteMans();
	public int insertTask(TRoutetask task);
	public List<TRoutetask> findSaveTask(int userId);
	public List<TRoutetask> findStartTask(int userId);
	public TRoutetask findTaskById(int id);
	public int updateTask(TRoutetask task);
	public List<TRoutetask> findMyRouteTask(int userId);
	public List<TRoutetask> findMyExecuteTask(int userId);
	public List<TRoutetask> myRouteTaskHistory(int userId);
	public int updateTaskState(String tType, int id);
	public int updateTaskReason(String tReason,int id);
	public int deleteTask(int id);
	public List<TRoutetask> adminRouteTaskHistory(int userId);
	public int insertDevMsg(TRoutedev dev);
	public List<TRoutedev> findDevMsg(int id);
}
