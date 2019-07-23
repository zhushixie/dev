package com.kevin.serviceImp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kevin.entity.TAccessory;
import com.kevin.entity.TWarerecord;
import com.kevin.entity.TWaretask;
import com.kevin.entity.TWareview;
import com.kevin.mapper.AccessoryMapper;
import com.kevin.mapper.WareMapper;
import com.kevin.service.IWareService;
@Service
public class WareServiceImpl implements IWareService{

	@Autowired 
	private WareMapper wareMapper;
	@Autowired 
	private AccessoryMapper accessoryMapper;
	@Override
	public int insertTask(TWaretask task) {
		return wareMapper.insertTask(task);
	}

	@Override
	public int updateTask(TWaretask task) {
		return wareMapper.updateTask(task);
	}

	@Override
	public int insertView(TWareview view) {
		return wareMapper.insertView(view);
	}

	@Override
	public List<TWaretask> getAllTaskList(int id, String state) {
		
		return wareMapper.getAllTaskList(id, state);
	}

	@Override
	public List<TWaretask> getKeeperStartTaskList(int starter) {
		return wareMapper.getKeeperStartTaskList(starter);
	}

	@Override
	public List<TWaretask> getTaskListByState(String state) {
		return wareMapper.getTaskListByState(state);
	}

	@Override
	public TWaretask findTaskById(int id) {
		return wareMapper.findTaskById(id);
	}

	@Override
	public int updateTaskState(int id, String state) {
		// TODO Auto-generated method stub
		return wareMapper.updateTaskState(id, state);
	}

	@Override
	public int deleteTask(int id) {
		return wareMapper.deleteTask(id);
	}
	@Override
	public List<TWaretask> getTaskListByExecuterId(int id) {
		return wareMapper.getTaskListByExecuterId(id);
	}

	@Override
	public int insertAccessory(TAccessory tAccessory) {
		return accessoryMapper.insertAccessory(tAccessory);
	}

	@Override
	public int updateAccessory(int tCount, String tCode) {
		return accessoryMapper.updateAccessory(tCount, tCode);
	}

	@Override
	public int checkCodeIsInTable(String tCode) {
		return accessoryMapper.checkCodeIsInTable(tCode);
	}

	@Override
	public int getAccessoryMountByCode(String tCode) {
		// TODO Auto-generated method stub
		return accessoryMapper.getAccessoryMountByCode(tCode);
	}

	@Override
	public int insertRecord(TWarerecord record) {
		// TODO Auto-generated method stub
		return accessoryMapper.insertRecord(record);
	}

	@Override
	public List<TWarerecord> getRecordsByUserIdAndType(int userId, String tType) {
		// TODO Auto-generated method stub
		return accessoryMapper.getRecordsByUserIdAndType(userId, tType);
	}
	@Override
	public List<TWarerecord> getWareRecordsByType(String tType) {
		return accessoryMapper.getWareRecordsByType(tType);
	}

	@Override
	public List<TWaretask> getKeeperFinishTaskList(int starter) {
		// TODO Auto-generated method stub
		return wareMapper.getKeeperFinishTaskList(starter);
	}

	@Override
	public List<TWareview> findViewsByTaskId(int taskId) {
		// TODO Auto-generated method stub
		return wareMapper.findViewsByTaskId(taskId);
	}

	@Override
	public int updateTaskCheckerView(int checkId, String view,int id) {
		return wareMapper.updateTaskCheckerView(checkId, view,id);
	}

	@Override
	public int updateTaskManagerView(int managerId, String view,int id) {
		return wareMapper.updateTaskManagerView(managerId, view,id);
	}

	@Override
	public int updateTaskDirectorView(int directorId, String view,int id) {
		return wareMapper.updateTaskDirectorView(directorId, view,id);
	}

}
