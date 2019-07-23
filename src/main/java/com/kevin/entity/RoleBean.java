package com.kevin.entity;

import java.sql.Timestamp;

public class RoleBean {
	private  int id;
	private int pId;
	private String name;
	private Timestamp createtime;
	private String descript;
	private boolean lay_is_checked=false;
	
	public boolean isLay_is_checked() {
		return lay_is_checked;
	}
	public void setLay_is_checked(boolean lay_is_checked) {
		this.lay_is_checked = lay_is_checked;
	}
	@Override
	public String toString() {
		return "RoleBean [id=" + id + ", pId=" + pId + ", name=" + name + ", createtime=" + createtime + ", descript="
				+ descript + "]";
	}
	public RoleBean() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	

}
