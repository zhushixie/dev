package com.kevin.entity;
import java.util.Date;
public class TWaretask{
    /** 仓库任务编号 */
    private Integer id ;
    /** 发起人编号 */
    private Integer tStarter ;
    /** 任务名称 */
    private String tName ;
    /** 任务类型 */
    private String tType ;
    /** 任务状态 */
    private String tState ;
    /** 任务内容 */
    private String tContent ;
    /** 任务创建时间 */
    private Date tCreatetime ;
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
    /** 发起人姓名 */
    private String tStartername;
    
    /** 主管姓名 */
    private String tDirectorname;
    
    /** 经理姓名 */
    private String tManagername;
    
    /** 检查人姓名 */
    private String tCheckername;


    /** 仓库任务编号 */
    public Integer getId(){
        return this.id;
    }
    /** 仓库任务编号 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 发起人编号 */
    public Integer getTStarter(){
        return this.tStarter;
    }
    /** 发起人编号 */
    public void setTStarter(Integer tStarter){
        this.tStarter = tStarter;
    }
    /** 任务名称 */
    public String getTName(){
        return this.tName;
    }
    /** 任务名称 */
    public void setTName(String tName){
        this.tName = tName;
    }
    /** 任务类型 */
    public String getTType(){
        return this.tType;
    }
    /** 任务类型 */
    public void setTType(String tType){
        this.tType = tType;
    }
    /** 任务状态 */
    public String getTState(){
        return this.tState;
    }
    /** 任务状态 */
    public void setTState(String tState){
        this.tState = tState;
    }
    /** 任务内容 */
    public String getTContent(){
        return this.tContent;
    }
    /** 任务内容 */
    public void setTContent(String tContent){
        this.tContent = tContent;
    }
    /** 任务创建时间 */
    public Date getTCreatetime(){
        return this.tCreatetime;
    }
    /** 任务创建时间 */
    public void setTCreatetime(Date tCreatetime){
        this.tCreatetime = tCreatetime;
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
	public String gettStartername() {
		return tStartername;
	}
	public void settStartername(String tStartername) {
		this.tStartername = tStartername;
	}
	public String gettDirectorname() {
		return tDirectorname;
	}
	public void settDirectorname(String tDirectorname) {
		this.tDirectorname = tDirectorname;
	}
	public String gettManagername() {
		return tManagername;
	}
	public void settManagername(String tManagername) {
		this.tManagername = tManagername;
	}
	public String gettCheckername() {
		return tCheckername;
	}
	public void settCheckername(String tCheckername) {
		this.tCheckername = tCheckername;
	}
}