package com.kevin.serviceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kevin.entity.TFile;
import com.kevin.mapper.FileMapper;
import com.kevin.service.IFileService;

@Service
public class FileServiceImpl implements IFileService {

	@Autowired
	FileMapper fileMapper;
	@Override
	public TFile findFileById(int id) {
		return fileMapper.findFileById(id);
	}
	@Override
	public int updateFile(TFile file) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteFile(int id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertFile(TFile file) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
