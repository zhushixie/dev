package com.kevin.controllers.ware;
import java.util.Date;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kevin.entity.TLog;
import com.kevin.service.ILogService;

@Controller
public class WareController {
	@Autowired
	private ILogService logService;
	@RequestMapping(value="/wareMana")
	public String wareMana(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String) session.getAttribute("user"));
		log.setTAuth("wareMana");
		Date currentTime = new Date();
		log.setTTime(currentTime);
		logService.insertLog(log);
		String role = (String) session.getAttribute("roleName");
		if (role.equals("仓库主管")) {
			return "ware/directorWareMana";
		} else if (role.equals("仓检员")) {
			return "ware/receiverWareMana";
		}else if (role.equals("仓库经理")) {
			return "ware/managerWareMana";
		}else if (role.equals("仓管员")) {
			return "ware/keeperWareMana";
		} else {
			return "ware/allWareMana";
		}
	}
	
	
}