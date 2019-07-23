package com.kevin.entity;
import java.util.Date;
public class TFile{
    /** 主键 */
    private Integer id ;
    /** 名称 */
    private String tName ;
    /** 类型 */
    private String tType ;
    /** 地址 */
    private String tAddr ;
    /** 创建时间 */
    private Date tTime ;

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
    /** 类型 */
    public String getTType(){
        return this.tType;
    }
    /** 类型 */
    public void setTType(String tType){
        this.tType = tType;
    }
    /** 地址 */
    public String getTAddr(){
        return this.tAddr;
    }
    /** 地址 */
    public void setTAddr(String tAddr){
        this.tAddr = tAddr;
    }
    /** 创建时间 */
    public Date getTTime(){
        return this.tTime;
    }
    /** 创建时间 */
    public void setTTime(Date tTime){
        this.tTime = tTime;
    }
}