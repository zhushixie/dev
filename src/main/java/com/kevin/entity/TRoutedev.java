package com.kevin.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TRoutedev{
    /** 主键 */
    private Integer id ;
    /** 设备名称 */
    private String tName ;
    /** 设备编码 */
    private String tCode ;
    /** 巡检人 */
    private String tChecker ;
    /** 检查内容 */
    private String tContent ;
    /** 状况类型 */
    private String tType ;

    private Date tTime ;

    private int tCheckerId ;
    /** 主键 */
    public Integer getId(){
        return this.id;
    }
    /** 主键 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 设备名称 */
    public String getTName(){
        return this.tName;
    }
    /** 设备名称 */
    public void setTName(String tName){
        this.tName = tName;
    }
    /** 设备编码 */
    public String getTCode(){
        return this.tCode;
    }
    /** 设备编码 */
    public void setTCode(String tCode){
        this.tCode = tCode;
    }
    /** 巡检人 */
    public String getTChecker(){
        return this.tChecker;
    }
    /** 巡检人 */
    public void setTChecker(String tChecker){
        this.tChecker = tChecker;
    }
    /** 检查内容 */
    public String getTContent(){
        return this.tContent;
    }
    /** 检查内容 */
    public void setTContent(String tContent){
        this.tContent = tContent;
    }
    /** 状况类型 */
    public String getTType(){
        return this.tType;
    }
    /** 状况类型 */
    public void setTType(String tType){
        this.tType = tType;
    }
	public int gettCheckerId() {
		return tCheckerId;
	}
	public void settCheckerId(int tCheckerId) {
		this.tCheckerId = tCheckerId;
	}
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	public Date gettTime() {
		return tTime;
	}
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	public void settTime(Date tTime) {
		this.tTime = tTime;
	}
}