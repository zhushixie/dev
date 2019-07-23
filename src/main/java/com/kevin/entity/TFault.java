package com.kevin.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
public class TFault{
    /** 主键ID */
    private Integer id ;
    /** 申请人 */
    private Integer tStarter ;
    /** 设备名称 */
    private String tName ;
    /** 设备编码 */
    private String tCode ;
    /** 故障描述 */
    private String tContent ;
    /** 状态 */
    private String tState ;
    /** 问题分析 */
    private String tAnalysis ;
    /** 维修员 */
    private Integer tCheckerid ;
    /** 任务时间 */
    private Date tTime ;

    /** 主键ID */
    public Integer getId(){
        return this.id;
    }
    /** 主键ID */
    public void setId(Integer id){
        this.id = id;
    }
    /** 申请人 */
    public Integer getTStarter(){
        return this.tStarter;
    }
    /** 申请人 */
    public void setTStarter(Integer tStarter){
        this.tStarter = tStarter;
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
    /** 故障描述 */
    public String getTContent(){
        return this.tContent;
    }
    /** 故障描述 */
    public void setTContent(String tContent){
        this.tContent = tContent;
    }
    /** 状态 */
    public String getTState(){
        return this.tState;
    }
    /** 状态 */
    public void setTState(String tState){
        this.tState = tState;
    }
    /** 问题分析 */
    public String getTAnalysis(){
        return this.tAnalysis;
    }
    /** 问题分析 */
    public void setTAnalysis(String tAnalysis){
        this.tAnalysis = tAnalysis;
    }
    /** 维修员 */
    public Integer getTCheckerid(){
        return this.tCheckerid;
    }
    /** 维修员 */
    public void setTCheckerid(Integer tCheckerid){
        this.tCheckerid = tCheckerid;
    }
    /** 任务时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public Date getTTime(){
        return this.tTime;
    }
    /** 任务时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public void setTTime(Date tTime){
        this.tTime = tTime;
    }
}