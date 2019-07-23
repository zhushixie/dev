package com.kevin.entity;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
public class TRoutetask{
    /** 主键 */
    private Integer id ;
    /** 名称 */
    private String tName ;
    /** 发起人 */
    private String tStarter ;
    private int tStarterId ;
    
    /** 联系方式 */
    private String tPhone ;
    /** 委托人 */
    private String tDepositor ;
    private int tDepositorId ;
    /** 任务发起时间 */
    private Date tTime ;
    /** 任务内容 */
    private String tContent ;
    /** 任务类型 */
    private String tType ;
    /** 缘由 */
    private String tReason ;
    /** 缘由 */
    public String getTReason(){
        return this.tReason;
    }
    /** 缘由 */
    public void setTReason(String tReason){
        this.tReason = tReason;
    }
    /** 主键 */
    public Integer getId(){
        return this.id;
    }
    /** 主键 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 名称 */
    public String getTName(){
        return this.tName;
    }
    /** 名称 */
    public void setTName(String tName){
        this.tName = tName;
    }
    /** 发起人 */
    public String getTStarter(){
        return this.tStarter;
    }
    /** 发起人 */
    public void setTStarter(String tStarter){
        this.tStarter = tStarter;
    }
    /** 联系方式 */
    public String getTPhone(){
        return this.tPhone;
    }
    /** 联系方式 */
    public void setTPhone(String tPhone){
        this.tPhone = tPhone;
    }
    /** 委托人 */
    public String getTDepositor(){
        return this.tDepositor;
    }
    /** 委托人 */
    public void setTDepositor(String tDepositor){
        this.tDepositor = tDepositor;
    }
    /** 任务发起时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public Date getTTime(){
        return this.tTime;
    }
    /** 任务发起时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public void setTTime(Date tTime){
        this.tTime = tTime;
    }
    /** 任务内容 */
    public String getTContent(){
        return this.tContent;
    }
    /** 任务内容 */
    public void setTContent(String tContent){
        this.tContent = tContent;
    }
    /** 任务类型 */
    public String getTType(){
        return this.tType;
    }
    /** 任务类型 */
    public void setTType(String tType){
        this.tType = tType;
    }
	public int gettStarterId() {
		return tStarterId;
	}
	public void settStarterId(int tStarterId) {
		this.tStarterId = tStarterId;
	}
	public int gettDepositorId() {
		return tDepositorId;
	}
	public void settDepositorId(int tDepositorId) {
		this.tDepositorId = tDepositorId;
	}
}