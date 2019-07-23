package com.kevin.entity;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
public class TLog{
    private Integer id =0;
    /** 用户信息 */
    private String tUser ;
    /** 操作时间 */
    private Date tTime ;
    /** 权限内容 */
    private String tAuth ;

    /** 主键Id */
    public Integer getId(){
        return this.id;
    }
    /** 主键Id */
    public void setId(Integer id){
        this.id = id;
    }
    /** 用户信息 */
    public String getTUser(){
        return this.tUser;
    }
    /** 用户信息 */
    public void setTUser(String tUser){
        this.tUser = tUser;
    }
    /** 操作时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public Date getTTime(){
        return this.tTime;
    }
    /** 操作时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public void setTTime(Date tTime){
        this.tTime = tTime;
    }
    /** 权限内容 */
    public String getTAuth(){
        return this.tAuth;
    }
    /** 权限内容 */
    public void setTAuth(String tAuth){
        this.tAuth = tAuth;
    }
}