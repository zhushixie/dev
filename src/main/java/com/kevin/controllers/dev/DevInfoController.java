package com.kevin.controllers.dev;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kevin.entity.Node;
import com.kevin.entity.TLog;
import com.kevin.service.IDevInfoService;
import com.kevin.service.ILogService;
import com.kevin.service.IRoomService;

@Controller
public class DevInfoController {
	@Autowired
	private IDevInfoService devInfoService;
	@Autowired
	private ILogService logService;
	@RequestMapping(value="/devInfoMana")
	public String devInfoMana(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("devInfoMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "devinfo/devInfoMana";
	}
	@RequestMapping(value = "/devInfoMana/allRoots",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String allRoots(HttpServletResponse response){
		return devInfoService.selectAllRooms();
	}
	@RequestMapping(value = "/devInfoMana/childrenByRoot",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String  childrenByRoot(int id){
		return  devInfoService.childrenByRoot(id);
	}
	@RequestMapping(value="/devInfoDetail")
	public String devInfoDetail(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("devInfoMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "devinfo/devInfoDetail";
	}
	
	@RequestMapping(value="/devInfoMana/loadImg")
	@ResponseBody		
	public String loadImg(int id){
		System.out.println(id);
		return "<div><img src='./img/t1.jpg' height='440px' weight='778px' alt=''></div>";
	}
}
