package com.kevin.controllers;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.AuthBean;
import com.kevin.entity.RoleBean;
import com.kevin.entity.TLog;
import com.kevin.entity.TRoleauth;
import com.kevin.service.IAuthService;
import com.kevin.service.ILogService;
import com.kevin.service.IRoleService;

@Controller
public class MainController {
	@Autowired
	private ILogService logService;
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IAuthService authService;
	//跳转到主页面
	@RequestMapping(value = {"/main","/sysMain"})
	public String main(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("main");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		loadAuthMsg(session);
		return "main/sysMain";
	}
	/**
	 * 角色不分等级
	 * 
	 *
	 * @param session
	 */
	public void loadAuthMsg(HttpSession session){
		int id = (int)session.getAttribute("userId");
		//获取一级角色
		RoleBean role= roleService.findRoleByUserId(id);
		if(role==null){
			return;
		}
		session.setAttribute("roleId", role.getId());
		session.setAttribute("roleName", role.getName());
		//加载权限设置
		List<TRoleauth> rs = authService.findAuthByRoleId(role.getId());
		for(int i=0;i<rs.size();i++){
			TRoleauth ele = rs.get(i);
			AuthBean auth = authService.findEleByAuthId(ele.getAuthid());
			session.setAttribute(auth.getName(), true);
		}
	}
	@RequestMapping(value = "/sysConfig")
	public String sysConfig(HttpSession session){
		boolean rs = (boolean)session.getAttribute("sysconfig");
		if(!rs){return "";}
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("config");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "main/sysConfig";
	}
	@RequestMapping(value = "/test")
	public String test(){
		return "test";
	}
	@RequestMapping(value = "/test2")
	public String test2(){
		return "test2";
	}
	@RequestMapping(value = "/sysEnvInfo")
	public String sysEnvInfo(HttpSession session){
		boolean rs = (boolean)session.getAttribute("sysconfig");
		if(!rs){return "";}
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("config");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "main/sysEnvInfo";
	}

	@RequestMapping(value = "/myInformation")
	public String myInformation(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("config");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "main/myInformation";
	}
	@RequestMapping(value = "/myPwdModify")
	public String myPwdModify(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("config");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "main/myPwdModify";
	}
	@RequestMapping(value = "/myNotify")
	public String myNotify(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("config");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "main/myNotify";
	}
	@RequestMapping(value = "/mainCheckAuth",method = RequestMethod.POST)
	@ResponseBody
	public String checkAuth(String auth,HttpSession session){
		System.out.println(auth);
		return "success";		
	}
	
	
	

}
