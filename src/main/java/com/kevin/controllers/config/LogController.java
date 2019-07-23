package com.kevin.controllers.config;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.activiti.engine.repository.ModelQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.R;
import com.kevin.entity.TLog;
import com.kevin.service.ILogService;

@Controller
public class LogController {
	@Autowired
	private ILogService logService;
	
//	Date currentTime = new Date();  
//    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
//    String dateString = formatter.format(currentTime);  
	@RequestMapping(value="/logMana")
	public String logMana(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("logMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "config/configLog";
	}
	@RequestMapping(value="/logMana/tableList")
	@ResponseBody
	public String dataList(){
		 List<TLog> rs = logService.getAllLogs();
		 R r = new R();
		 r.setData(rs);
		 r.setCode(0);
		return r.toJson();
	}
}
