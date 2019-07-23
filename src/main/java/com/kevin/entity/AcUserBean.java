package com.kevin.entity;
public class AcUserBean{

	private Integer ac_id;  
	
	private String ac_name ; 
	private String ac_pwd  ;
	private String ac_addr  ;
	private String ac_phone ;
	 private Integer ac_state ;
	public AcUserBean() {
	}
	public Integer getAc_id() {
		return ac_id;
	}
	public void setAc_id(Integer ac_id) {
		this.ac_id = ac_id;
	}
	public String getAc_name() {
		return ac_name;
	}
	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}
	public String getAc_pwd() {
		return ac_pwd;
	}
	public void setAc_pwd(String ac_pwd) {
		this.ac_pwd = ac_pwd;
	}
	public String getAc_addr() {
		return ac_addr;
	}
	public void setAc_addr(String ac_addr) {
		this.ac_addr = ac_addr;
	}
	public String getAc_phone() {
		return ac_phone;
	}
	public void setAc_phone(String ac_phone) {
		this.ac_phone = ac_phone;
	}
	public Integer getAc_state() {
		return ac_state;
	}
	public void setAc_state(Integer ac_state) {
		this.ac_state = ac_state;
	}
}
