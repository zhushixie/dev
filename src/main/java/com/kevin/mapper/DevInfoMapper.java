package com.kevin.mapper;

import java.util.List;

import com.kevin.entity.Root;
import com.kevin.entity.TDevinfo;

public interface DevInfoMapper {
	public List<Root> selectAllRooms();
	public List<TDevinfo> childrenByRoot(int id);

}
