package com.kevin.mapper;
import com.kevin.entity.TFile;

public interface FileMapper {
	public TFile findFileById(int id);
	public int updateFile(TFile file);
	public int deleteFile(int id);
	public int insertFile(TFile file);
}
