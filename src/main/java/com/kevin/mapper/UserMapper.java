package com.kevin.mapper;

import java.util.List;
import com.kevin.entity.UserBean;
public interface UserMapper{
    public List<UserBean> selectAll();
    int deleteByPrimaryKey(Integer id);
    public UserBean findById(int id);
    int insert(UserBean user);
    UserBean selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(UserBean user);
}
