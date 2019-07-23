package com.kevin.service;

import java.util.List;

import com.kevin.entity.TFile;

public interface IFileService {
	public TFile findFileById(int id);
	public int updateFile(TFile file);
	public int deleteFile(int id);
	public int insertFile(TFile file);
}
