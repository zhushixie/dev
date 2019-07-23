package com.kevin.entity;
import java.util.Date;

public class TWareview{
    /** 主键 */
    private Integer id ;
    /** 执行人 */
    private Integer tExecuterid ;
    /** 任务状态 */
    private String tState ;
    /** 任务Id */
    private Integer tTaskid ;
    /** 意见 */
    private String tView ;
    
    private String act;
    /** 审批时间 */
    private Date tTime ;

    /** 主键 */
    public Integer getId(){
        return this.id;
    }
    /** 主键 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 执行人 */
    public Integer getTExecuterid(){
        return this.tExecuterid;
    }
    /** 执行人 */
    public void setTExecuterid(Integer tExecuterid){
        this.tExecuterid = tExecuterid;
    }
    /** 任务状态 */
    public String getTState(){
        return this.tState;
    }
    /** 任务状态 */
    public void setTState(String tState){
        this.tState = tState;
    }
    /** 任务Id */
    public Integer getTTaskid(){
        return this.tTaskid;
    }
    /** 任务Id */
    public void setTTaskid(Integer tTaskid){
        this.tTaskid = tTaskid;
    }
    /** 意见 */
    public String getTView(){
        return this.tView;
    }
    /** 意见 */
    public void setTView(String tView){
        this.tView = tView;
    }
    /** 审批时间 */
    public Date getTTime(){
        return this.tTime;
    }
    /** 审批时间 */
    public void setTTime(Date tTime){
        this.tTime = tTime;
    }
	public String getAct() {
		return act;
	}
	public void setAct(String act) {
		this.act = act;
	}
}