package com.kevin.serviceImp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kevin.entity.TRoutedev;
import com.kevin.entity.TRoutetask;
import com.kevin.entity.UserBean;
import com.kevin.mapper.RoleMapper;
import com.kevin.mapper.RouteMapper;
import com.kevin.mapper.UserMapper;
import com.kevin.service.IRouteService;

@Service
public class RouteServiceImpl implements IRouteService {

	@Autowired
	RoleMapper roleMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	RouteMapper routeMapper;

	@Override
	public List<UserBean> getAllRouteMans() {
		int id = roleMapper.findRoleByName("巡检员");
		return roleMapper.getAllCheckMan(id);
	}

	@Override
	public int insertTask(TRoutetask task) {
		return routeMapper.insertTask(task);
	}

	@Override
	public List<TRoutetask> findSaveTask(int id) {
		List<TRoutetask> rs = routeMapper.findSaveTask(id);
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for (TRoutetask task:rs) {
			UserBean user = userMapper.findById(task.gettDepositorId());
			if(user==null){
				rsList.add(task);
				continue;
			}
			if(user.getName()==null||"".equals(user.getName()))continue;
			task.setTDepositor(user.getName());
			rsList.add(task);
		}
		return rsList;
	}

	@Override
	public List<TRoutetask> findStartTask(int id) {
		List<TRoutetask> rs = routeMapper.findStartTask(id);
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for (TRoutetask task:rs) {
			UserBean user = userMapper.findById(task.gettDepositorId());
			task.setTDepositor(user.getName());
			rsList.add(task);
		}
		return rsList;
	}

	@Override
	public TRoutetask findTaskById(int id) {
		return routeMapper.findTaskById(id);
	}

	@Override
	public int updateTask(TRoutetask task) {
		return routeMapper.updateTask(task);
		
	}

	@Override
	public List<TRoutetask> findMyRouteTask(int userId) {
		List<TRoutetask> rs = routeMapper.findMyRouteTask(userId);
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for(TRoutetask task:rs){
			UserBean user = userMapper.findById(task.gettStarterId());
			task.setTStarter(user.getName());
			rsList.add(task);
		}
		return rsList;
	}
	@Override
	public List<TRoutetask> findMyExecuteTask(int userId) {
		List<TRoutetask> rs = routeMapper.findMyExecuteTask(userId);
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for(TRoutetask task:rs){
			UserBean user = userMapper.findById(task.gettStarterId());
			task.setTStarter(user.getName());
			rsList.add(task);
		}
		return rsList;
	}

	@Override
	public List<TRoutetask> myRouteTaskHistory(int userId) {
		List<TRoutetask> rs = routeMapper.myRouteTaskHistory(userId);
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for(TRoutetask task:rs){
			UserBean user = userMapper.findById(task.gettStarterId());
			task.setTStarter(user.getName());
			rsList.add(task);
		}
		return rsList;
	}

	@Override
	public int updateTaskState(String tType, int id) {
		return routeMapper.updateTaskState(tType,id);
	}

	@Override
	public int updateTaskReason(String tReason, int id) {
		return routeMapper.updateTaskReason(tReason,id);
	}

	@Override
	public int deleteTask(int id) {
		return routeMapper.deleteTask(id);// TODO Auto-generated method stub
	}

	@Override
	public List<TRoutetask> adminRouteTaskHistory(int userId) {
		List<TRoutetask> rs = routeMapper.adminRouteTaskHistory(userId);
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for(TRoutetask task:rs){
			UserBean user = userMapper.findById(task.gettDepositorId());
			task.setTDepositor(user.getName());
			rsList.add(task);
		}
		return rsList;
	}

	@Override
	public int insertDevMsg(TRoutedev dev) {
		return routeMapper.insertDevMsg(dev);
	}

	@Override
	public List<TRoutedev> findDevMsg(int id) {
		// TODO Auto-generated method stub
		return routeMapper.findDevMsg(id);
	}

}
