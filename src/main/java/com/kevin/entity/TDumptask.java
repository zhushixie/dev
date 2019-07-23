package com.kevin.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TDumptask{
    /** 报废任务编号 */
    private Integer id ;
    /** 任务名称 */
    private String tName ;
    /** 任务状态 */
    private String tState ;
    /** 任务发起人 */
    private Integer tStarterid ;
    /** 任务发起人名称 */
    private String tStarter ;
    /** 设备编号 */
    private String tDevcode ;
    /** 报废时间 */
    private Date tDumptime ;
    /** 主管编号 */
    private Integer tDirectorid ;
    /** 主管意见 */
    private String tDirectorview ;
    /** 经理编号 */
    private Integer tManagerid ;
    /** 经理意见 */
    private String tManagerview ;
    /** 检查人编号 */
    private Integer tCheckerid ;
    /** 检查人意见 */
    private String tCheckerview ;
    /**
     * 报废缘由
     */
	private String tContent;

    /** 报废任务编号 */
    public Integer getId(){
        return this.id;
    }
    /** 报废任务编号 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 任务名称 */
    public String getTName(){
        return this.tName;
    }
    /** 任务名称 */
    public void setTName(String tName){
        this.tName = tName;
    }
    /** 任务状态 */
    public String getTState(){
        return this.tState;
    }
    /** 任务状态 */
    public void setTState(String tState){
        this.tState = tState;
    }
    /** 任务发起人 */
    public Integer getTStarterid(){
        return this.tStarterid;
    }
    /** 任务发起人 */
    public void setTStarterid(Integer tStarterid){
        this.tStarterid = tStarterid;
    }
    /** 设备编号 */
    public String getTDevcode(){
        return this.tDevcode;
    }
    /** 设备编号 */
    public void setTDevcode(String tDevcode){
        this.tDevcode = tDevcode;
    }
    /** 报废时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public Date getTDumptime(){
        return this.tDumptime;
    }
    /** 报废时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public void setTDumptime(Date tDumptime){
        this.tDumptime = tDumptime;
    }
    /** 主管编号 */
    public Integer getTDirectorid(){
        return this.tDirectorid;
    }
    /** 主管编号 */
    public void setTDirectorid(Integer tDirectorid){
        this.tDirectorid = tDirectorid;
    }
    /** 主管意见 */
    public String getTDirectorview(){
        return this.tDirectorview;
    }
    /** 主管意见 */
    public void setTDirectorview(String tDirectorview){
        this.tDirectorview = tDirectorview;
    }
    /** 经理编号 */
    public Integer getTManagerid(){
        return this.tManagerid;
    }
    /** 经理编号 */
    public void setTManagerid(Integer tManagerid){
        this.tManagerid = tManagerid;
    }
    /** 经理意见 */
    public String getTManagerview(){
        return this.tManagerview;
    }
    /** 经理意见 */
    public void setTManagerview(String tManagerview){
        this.tManagerview = tManagerview;
    }
    /** 检查人编号 */
    public Integer getTCheckerid(){
        return this.tCheckerid;
    }
    /** 检查人编号 */
    public void setTCheckerid(Integer tCheckerid){
        this.tCheckerid = tCheckerid;
    }
    /** 检查人意见 */
    public String getTCheckerview(){
        return this.tCheckerview;
    }
    /** 检查人意见 */
    public void setTCheckerview(String tCheckerview){
        this.tCheckerview = tCheckerview;
    }
    /** 报废原因 */
    public String getTContent(){
        return this.tContent;
    }
    /** 报废原因 */
    public void setTContent(String tContent){
        this.tContent = tContent;
    }
	public String gettStarter() {
		return tStarter;
	}
	public void settStarter(String tStarter) {
		this.tStarter = tStarter;
	}
}