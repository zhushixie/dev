package com.kevin.controllers.config;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.AuthBean;
import com.kevin.entity.R;
import com.kevin.entity.TLog;
import com.kevin.entity.TRoleauth;
import com.kevin.entity.UserRoleBean;
import com.kevin.service.IAuthService;
import com.kevin.service.ILogService;

@Controller
@RequestMapping(value="/authMana")
public class AuthController {
	@Autowired
	private IAuthService authService;
	@Autowired
	private ILogService logService;
	@RequestMapping(value="")
	public String configAuth(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("configAuth");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "config/configAuth";
	}
	@RequestMapping(value="/findAllAuth",method=RequestMethod.POST)
	@ResponseBody
	public String findAllAuth(){
		R r = new R();
		List<AuthBean> rs = authService.findAllAuth();
		r.setData(rs);
		r.setCode(0);
		return r.toJson();
	}
	@RequestMapping(value="/findSelectedAuths",method=RequestMethod.POST)
	@ResponseBody
	public String findSelectedAuths(int id){
		R r = new R();
		List<AuthBean> rs = authService.findSelectedAuths(id);
		r.setData(rs);
		r.setCode(0);
		return r.toJson();
	}
	@RequestMapping(value="/addRoleAuth",method=RequestMethod.POST)
	@ResponseBody
	public String addRoleAuth(TRoleauth role){
		if(authService.addRoleAuth(role)>0){
			return "success";
		}else{
			return "failure";
		}
		
	}
	@RequestMapping(value="/deleteRoleAuth",method=RequestMethod.POST)
	@ResponseBody
	public String deleteRoleAuth(TRoleauth role){
		if(authService.deleteRoleAuth(role)>0){
			return "success";
		}else{
			return "failure";
		}
	}
	
	
	
	
}
