package com.kevin.entity;

public class AuthBean {
	private int id;
	private int pId;
	private String  name;
	private String descript;
	private boolean lay_is_checked=false;
	
	public boolean isLay_is_checked() {
		return lay_is_checked;
	}
	public void setLay_is_checked(boolean lay_is_checked) {
		this.lay_is_checked = lay_is_checked;
	}
	public AuthBean(){
		
	}
	@Override
	public String toString() {
		return "AuthBean [id=" + id + ", pId=" + pId + ", name=" + name + ", descript=" + descript + "]";
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
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	
	

}
