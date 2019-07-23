package com.kevin.entity;

public class UserRoleBean {
	private int id;
	private int userId;
	private int roleId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public UserRoleBean() {
	}
	@Override
	public String toString() {
		return "UserRoleBean [id=" + id + ", userId=" + userId + ", roleId=" + roleId + "]";
	}
	

}
