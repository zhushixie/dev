package com.kevin.entity;

public class TRoleauth{
    /** 主键 */
    private Integer id ;
    /** 角色Id */
    private Integer roleid ;
    /** 权限Id */
    private Integer authid ;
    /** 权限设置 */
    private String own ;

    /** 主键 */
    public Integer getId(){
        return this.id;
    }
    /** 主键 */
    public void setId(Integer id){
        this.id = id;
    }
    /** 角色Id */
    public Integer getRoleid(){
        return this.roleid;
    }
    /** 角色Id */
    public void setRoleid(Integer roleid){
        this.roleid = roleid;
    }
    /** 权限Id */
    public Integer getAuthid(){
        return this.authid;
    }
    /** 权限Id */
    public void setAuthid(Integer authid){
        this.authid = authid;
    }
    /** 权限设置 */
    public String getOwn(){
        return this.own;
    }
    /** 权限设置 */
    public void setOwn(String own){
        this.own = own;
    }
}