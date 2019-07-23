package com.kevin.controllers.dev;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kevin.entity.TLog;
import com.kevin.service.ILogService;

@Controller
public class DevStateController {
	@Autowired
	private ILogService logService;
	@RequestMapping(value = "/sysDevState")
	public String sysDevState(HttpSession session){
//		boolean rs = (boolean)session.getAttribute("sysDevState");
//		if(!rs){return "";}
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("config");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "main/sysDevState";
	}
}
