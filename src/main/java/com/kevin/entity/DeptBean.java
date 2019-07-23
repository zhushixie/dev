package com.kevin.entity;

import java.sql.Timestamp;

public class DeptBean {
	private int id;
	private String name;
	private Timestamp createtime;
	private String job;
	private String phone;
	@Override
	public String toString() {
		return "DeptBean [id=" + id + ", name=" + name + ", createtime=" + createtime + ", job=" + job + ", phone="
				+ phone + "]";
	}
	public DeptBean() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
