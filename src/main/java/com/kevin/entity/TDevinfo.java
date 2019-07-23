package com.kevin.entity;
public class TDevinfo {
    /** 设备Id */
    private Integer id ;
    /** 设备名称 */
    private String tName ;
    /** 设备型号 */
    private Integer tDevtype ;
    /** 设备编码 */
    private String tCode ;
    /** 购置日期 */
    private String tPurchasetime ;
    /** 生产厂家 */
    private String tManu ;
    /** 使用部门 */
    private Integer tDeptid ;
    /** 安装地点 */
    private Integer tRoomid ;
    /** 维保到期 */
    private String tTotime ;
    /** 联系人 */
    private String tPerson ;
    /** 联系电话 */
    private String tTel ;

    /** 设备Id */
    public Integer getId(){
        return this.id;
    }
    /** 设备Id */
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
    /** 设备型号 */
    public Integer getTDevtype(){
        return this.tDevtype;
    }
    /** 设备型号 */
    public void setTDevtype(Integer tDevtype){
        this.tDevtype = tDevtype;
    }
    /** 设备编码 */
    public String getTCode(){
        return this.tCode;
    }
    /** 设备编码 */
    public void setTCode(String tCode){
        this.tCode = tCode;
    }
    /** 购置日期 */
    public String getTPurchasetime(){
        return this.tPurchasetime;
    }
    /** 购置日期 */
    public void setTPurchasetime(String tPurchasetime){
        this.tPurchasetime = tPurchasetime;
    }
    /** 生产厂家 */
    public String getTManu(){
        return this.tManu;
    }
    /** 生产厂家 */
    public void setTManu(String tManu){
        this.tManu = tManu;
    }
    /** 使用部门 */
    public Integer getTDeptid(){
        return this.tDeptid;
    }
    /** 使用部门 */
    public void setTDeptid(Integer tDeptid){
        this.tDeptid = tDeptid;
    }
    /** 安装地点 */
    public Integer getTRoomid(){
        return this.tRoomid;
    }
    /** 安装地点 */
    public void setTRoomid(Integer tRoomid){
        this.tRoomid = tRoomid;
    }
    /** 维保到期 */
    public String getTTotime(){
        return this.tTotime;
    }
    /** 维保到期 */
    public void setTTotime(String tTotime){
        this.tTotime = tTotime;
    }
    /** 联系人 */
    public String getTPerson(){
        return this.tPerson;
    }
    /** 联系人 */
    public void setTPerson(String tPerson){
        this.tPerson = tPerson;
    }
    /** 联系电话 */
    public String getTTel(){
        return this.tTel;
    }
    /** 联系电话 */
    public void setTTel(String tTel){
        this.tTel = tTel;
    }
}