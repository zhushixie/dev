package com.kevin.controllers.fix;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kevin.entity.TLog;
import com.kevin.service.ILogService;

@Controller
public class FixController {
	@Autowired
	private ILogService logService;
	@RequestMapping(value = "/fixMana")
	public String fixMana(HttpSession session) {

		TLog log = new TLog();
		log.setTUser((String) session.getAttribute("user"));
		log.setTAuth("fixMana");
		Date currentTime = new Date();
		log.setTTime(currentTime);
		logService.insertLog(log);
		String role = (String) session.getAttribute("roleName");
		if (role == null)
			return "";
		if (role.equals("维修主管")) {
			return "fix/directorFixMana";
		} else if (role.equals("维修员")) {
			return "fix/workerFixMana";
		} else {
			return "fix/applicantFixMana";
		}
	}
	/**
	 * 报修人员
	 * @param session 
	 * @return
	 */
	@RequestMapping(value = "/workerFixFault")
	public String workerFixFault(HttpSession session) {
		return "workerFixFault";
	}
	@RequestMapping(value = "/workerFixFaultSaveTask")
	public String workerFixFaultSaveTask(HttpSession session) {
		
		return "workerFixFaultSaveTask";
	}
	@RequestMapping(value = "/workerFixFaultStartTask")
	public String workerFixFaultStartTask(HttpSession session) {
		return "workerFixFaultStartTask";
	}
	@RequestMapping(value = "/workerFixReceiveReportTask")
	public String workerFixReceiveReportTask(HttpSession session) {
		return "workerFixReceiveReportTask";
	}
	@RequestMapping(value = "/workerFixTaskRecords")
	public String workerFixTaskRecords(HttpSession session) {
		return "workerFixTaskRecords";
	}	
	/**
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
}
