package com.kevin.controllers.fault;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kevin.entity.TLog;
import com.kevin.service.ILogService;

public class FaultController {
	@Autowired
	private ILogService logService;
	@RequestMapping("/faultMana")
	public String faultMana(HttpSession session) {

		TLog log = new TLog();
		log.setTUser((String) session.getAttribute("user"));
		log.setTAuth("faultMana");
		Date currentTime = new Date();
		log.setTTime(currentTime);
		logService.insertLog(log);
		String role = (String) session.getAttribute("roleName");
		if (role == null){
			return "";
		}
		return "faultMana";
	}
	
	
	
}
