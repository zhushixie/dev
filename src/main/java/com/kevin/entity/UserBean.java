package com.kevin.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class UserBean implements Serializable{ 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
    
	private String name;
	
	private String phone;
	
	private String sex;
	
	private Timestamp createtime;
	
	private Date born;
	
	private String addr;
	
	private String deptName;
	
	private String deptId;
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public UserBean(int id, String name, String addr, String phone, String sex, Date born, Timestamp createtime) {
		super();
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.sex = sex;
		this.born = born;
		this.createtime = createtime;
	}
	public Date getBorn() {
		return born;
	}
	public void setBorn(Date born) {
		this.born = born;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public UserBean() {
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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", addr=" + addr + ", phone=" + phone + ", sex=" + sex + ", born="
				+ born + ", createtime=" + createtime + "]";
	}

	
}
