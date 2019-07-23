package com.kevin.entity;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TWarerecord{
    /** 主键 */
    private Integer id ;
    /** 操作人 */
    private Integer tUser ;
    private String tUsername ;
    /** 内容 */
    private String tContent ;
    /** 时间 */
    private Date tTime ;
	private String tType;

    /** 主键 */
    public Integer getId(){
        return this.id;
    }
    /** 主键 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 操作人 */
    public Integer getTUser(){
        return this.tUser;
    }
    /** 操作人 */
    public void setTUser(Integer tUser){
        this.tUser = tUser;
    }
    /** 内容 */
    public String getTContent(){
        return this.tContent;
    }
    /** 内容 */
    public void setTContent(String tContent){
        this.tContent = tContent;
    }
    /** 时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public Date getTTime(){
        return this.tTime;
    }
    /** 时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public void setTTime(Date tTime){
        this.tTime = tTime;
    }
    /** 类型 */
    public String getTType(){
        return this.tType;
    }
    /** 类型 */
    public void setTType(String tType){
        this.tType = tType;
    }
	public String gettUsername() {
		return tUsername;
	}
	public void settUsername(String tUsername) {
		this.tUsername = tUsername;
	}
}