package com.kevin.serviceImp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kevin.entity.TDumptask;
import com.kevin.mapper.DumpMapper;
import com.kevin.service.IDumpService;
@Service
public class DumpServiceImpl implements IDumpService{

	@Autowired
	private DumpMapper dumpMapper;
	@Override
	public int saveTask(TDumptask task) {
		return dumpMapper.insertTask(task);
	}

	@Override
	public int startTask(TDumptask task) {
		return dumpMapper.insertTask(task);
	}

	@Override
	public List<TDumptask> selectOnTasksByStaterid(int userid) {
		return dumpMapper.selectOnTasksByStaterid(userid);
	}

	@Override
	public List<TDumptask> selectSaveTasksByStaterid(int userid) {
		return dumpMapper.selectSaveTasksByStaterid(userid);
	}

	@Override
	public List<TDumptask> selectTaskRecordByStaterid(int userid) {
		return dumpMapper.selectTaskRecordByStaterid(userid);
	}

	@Override
	public List<TDumptask> selectTaskByState(String tState) {
		return dumpMapper.selectTaskByState(tState);
	}

	@Override
	public TDumptask selectTaskById(int id) {
		return dumpMapper.selectTaskById(id);
	}

	@Override
	public int updateTaskCheckerState(int id, int userid, String tState, String checkerView) {
		return dumpMapper.updateTaskCheckerState(id, userid, tState, checkerView);
	}

	@Override
	public int updateTaskDirectorState(int id, int userid, String tState, String directorView) {
		return dumpMapper.updateTaskDirectorState(id, userid, tState, directorView);
	}

	@Override
	public int updateTaskManagerState(int id, int userid, String tState, String managerView) {
		return dumpMapper.updateTaskManagerState(id, userid, tState, managerView);
	}
	
}
