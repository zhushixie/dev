package com.kevin.entity;
public class TDevtype{
    /** 主键 */
    private Integer id ;
    /** 名字 */
    private String tName ;
    /** 设备类型 */
    private String tType ;
    /** 描述 */
    private String tDescript ;
    /** 说明书 */
    private Integer tInstructionid ;
    /** 图片 */
    private Integer tDwgid ;
    /** 制造商 */
    private Integer tPlantid ;
    /** 模型Id */
    private Integer tModelid ;

    /** 主键 */
    public Integer getId(){
        return this.id;
    }
    /** 主键 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 名字 */
    public String getTName(){
        return this.tName;
    }
    /** 名字 */
    public void setTName(String tName){
        this.tName = tName;
    }
    /** 设备类型 */
    public String getTType(){
        return this.tType;
    }
    /** 设备类型 */
    public void setTType(String tType){
        this.tType = tType;
    }
    /** 描述 */
    public String getTDescript(){
        return this.tDescript;
    }
    /** 描述 */
    public void setTDescript(String tDescript){
        this.tDescript = tDescript;
    }
    /** 说明书 */
    public Integer getTInstructionid(){
        return this.tInstructionid;
    }
    /** 说明书 */
    public void setTInstructionid(Integer tInstructionid){
        this.tInstructionid = tInstructionid;
    }
    /** 图片 */
    public Integer getTDwgid(){
        return this.tDwgid;
    }
    /** 图片 */
    public void setTDwgid(Integer tDwgid){
        this.tDwgid = tDwgid;
    }
    /** 制造商 */
    public Integer getTPlantid(){
        return this.tPlantid;
    }
    /** 制造商 */
    public void setTPlantid(Integer tPlantid){
        this.tPlantid = tPlantid;
    }
    /** 模型Id */
    public Integer getTModelid(){
        return this.tModelid;
    }
    /** 模型Id */
    public void setTModelid(Integer tModelid){
        this.tModelid = tModelid;
    }
}