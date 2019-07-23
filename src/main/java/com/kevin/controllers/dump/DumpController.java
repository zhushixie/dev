package com.kevin.controllers.dump;

import java.util.Date;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kevin.entity.TLog;
import com.kevin.service.IDumpService;
import com.kevin.service.ILogService;
@Controller
public class DumpController {
	@Autowired
	private ILogService logService;
	@Autowired
	private IDumpService dumpService;
	
	@RequestMapping(value="/dumpMana")
	public String dumpMana(HttpSession session) {

		TLog log = new TLog();
		log.setTUser((String) session.getAttribute("user"));
		log.setTAuth("dumpMana");
		Date currentTime = new Date();
		log.setTTime(currentTime);
		logService.insertLog(log);
		String role = (String) session.getAttribute("roleName");
		if (role.equals("设备管理员")) {
			return "dump/applicantDumpMana";
		} else if (role.equals("设备主管")) {
			return "dump/directorDumpMana";
		} else if(role.equals("设备经理")){
			return "dump/managerDumpMana";
		}else if(role.equals("设备检查员")){
			return "dump/checkerDumpMana";
		}else{
			return "dump/allDumpMana";
		}
	}
}
