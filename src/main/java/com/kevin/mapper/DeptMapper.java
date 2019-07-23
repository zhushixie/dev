package com.kevin.mapper;

import java.util.List;

import com.kevin.entity.DeptBean;

public interface DeptMapper {
    public List<DeptBean> selectAll();
    public List<DeptBean> selectName();
    int deleteByPrimaryKey(Integer id);
    public DeptBean findById(String id);
    int insert(DeptBean deptBean);
    DeptBean selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(DeptBean record);
}
