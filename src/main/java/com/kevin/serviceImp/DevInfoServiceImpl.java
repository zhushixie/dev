package com.kevin.serviceImp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kevin.entity.Node;
import com.kevin.entity.Root;
import com.kevin.entity.TDevinfo;
import com.kevin.mapper.DevInfoMapper;
import com.kevin.service.IDevInfoService;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 */
@Service
public class DevInfoServiceImpl implements IDevInfoService {
	@Autowired 
	private DevInfoMapper devInfoMapper;
	@Override
	public String selectAllRooms() {
		List<Root> rs = devInfoMapper.selectAllRooms();
		JsonArray jsonArray = new JsonArray();
		Gson g = new Gson();
		for(int i=0;i<rs.size();i++){
			Root r = rs.get(i);
			r.setType("root");
			r.setChildren(true);
			jsonArray.add(g.toJsonTree(rs.get(i)));
		}
		return jsonArray.toString();
	}
	public String selectAllNodesByRoot() {
		List<Root> rs = devInfoMapper.selectAllRooms();
		JsonArray jsonArray = new JsonArray();
		Gson g = new Gson();
		for(int i=0;i<rs.size();i++){
			Root r = rs.get(i);
			r.setType("root");
			r.setChildren(true);
			jsonArray.add(g.toJsonTree(rs.get(i)));
		}
		return jsonArray.toString();
	}
	@Override
	public String childrenByRoot(int id) {
		List<TDevinfo> rs = devInfoMapper.childrenByRoot(id);
		JsonArray jsonArray = new JsonArray();
		Gson g = new Gson();
		for(int i=0;i<rs.size();i++){
			TDevinfo r = rs.get(i);
			Node node = new Node();
			node.setChildren(false);
			node.setId("son"+r.getId());
			node.setText(r.getTName());
			jsonArray.add(g.toJsonTree(node));
		}
		return jsonArray.toString();
	}
	
	

}