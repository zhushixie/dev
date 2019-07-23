package com.kevin.controllers.config;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kevin.entity.TLog;
import com.kevin.service.ILogService;
@Controller
public class ConfigController {
	@Autowired
	private ILogService logService;
	@RequestMapping(value = "/homeSys")
	public String homeSys(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("homeSys");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "main/sysHome";
	}
//	@RequestMapping(value = "/deptMana")
//	public String deptMana(){
//		return "deptMana";
//	}
//	@RequestMapping(value = "/userMana")
//	public String userMana(){
//		return "userMana";
//	}
//	@RequestMapping(value = "/roleMana")
//	public String roleMana(){
//		return "roleMana";
//	}
//	@RequestMapping(value = "/authMana")
//	public String authMana(){
//		return "authMana";
//	}
	@RequestMapping(value = "/task")
	public String task(){
		return "task";
	}

	
}
