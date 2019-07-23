package com.kevin.entity;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
public class TReport{
    /** 主键 */
    private Integer id ;
    /** 故障主键 */
    private Integer tFaultid ;
    /** 发起人 */
    private String tStarter ;
    /** 验收内容 */
    private String tContent ;
    /** 状态 */
    private String tType ;
    /** 验收时间 */
    private Date tTime ;

    /** 主键 */
    public Integer getId(){
        return this.id;
    }
    /** 主键 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 故障主键 */
    public Integer getTFaultid(){
        return this.tFaultid;
    }
    /** 故障主键 */
    public void setTFaultid(Integer tFaultid){
        this.tFaultid = tFaultid;
    }
    /** 发起人 */
    public String getTStarter(){
        return this.tStarter;
    }
    /** 发起人 */
    public void setTStarter(String tStarter){
        this.tStarter = tStarter;
    }
    /** 验收内容 */
    public String getTContent(){
        return this.tContent;
    }
    /** 验收内容 */
    public void setTContent(String tContent){
        this.tContent = tContent;
    }
    /** 状态 */
    public String getTType(){
        return this.tType;
    }
    /** 状态 */
    public void setTType(String tType){
        this.tType = tType;
    }
    /** 验收时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public Date getTTime(){
        return this.tTime;
    }
    /** 验收时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public void setTTime(Date tTime){
        this.tTime = tTime;
    }
}