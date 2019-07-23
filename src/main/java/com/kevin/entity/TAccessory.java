package com.kevin.entity;

public class TAccessory {
    /** 编码 */
    private String tCode ;
    /** 名称 */
    private String tName ;
    /** 数量 */
    private Integer tCount ;
    /** 说明 */
    private String tDescript ;
    /** 父编码 */
    private String tParcode ;
    /** 供应商 */
    private Integer tSupply ;

    /** 编码 */
    public String getTCode(){
        return this.tCode;
    }
    /** 编码 */
    public void setTCode(String tCode){
        this.tCode = tCode;
    }
    /** 名称 */
    public String getTName(){
        return this.tName;
    }
    /** 名称 */
    public void setTName(String tName){
        this.tName = tName;
    }
    /** 数量 */
    public Integer getTCount(){
        return this.tCount;
    }
    /** 数量 */
    public void setTCount(Integer tCount){
        this.tCount = tCount;
    }
    /** 说明 */
    public String getTDescript(){
        return this.tDescript;
    }
    /** 说明 */
    public void setTDescript(String tDescript){
        this.tDescript = tDescript;
    }
    /** 父编码 */
    public String getTParcode(){
        return this.tParcode;
    }
    /** 父编码 */
    public void setTParcode(String tParcode){
        this.tParcode = tParcode;
    }
    /** 供应商 */
    public Integer getTSupply(){
        return this.tSupply;
    }
    /** 供应商 */
    public void setTSupply(Integer tSupply){
        this.tSupply = tSupply;
    }
}