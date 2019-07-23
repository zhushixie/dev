package com.kevin.controllers.config;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.kevin.entity.RoleBean;
import com.kevin.entity.TLog;
import com.kevin.entity.UserBean;
import com.kevin.service.ILogService;
import com.kevin.service.IUserService;

@Controller
public class UserController {
	@Autowired
	private IUserService userService;
	@Autowired
	private ILogService logService;

	/**
	 * pagesize：每页条数 page:当前页
	 **/
	@RequestMapping(value = "/userMana/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findAllByPage(int page, int pageSize) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		PageInfo<UserBean> pager = userService.findUserByPage(page, pageSize);
		// 总条数
		resultMap.put("total", pager.getTotal());
		// 获取每页数据
		resultMap.put("rows", pager.getList());
		return resultMap;
	}
	
	@RequestMapping(value = { "/userMana", "/userMana/" }, method = RequestMethod.GET)
	public String userMana(HttpSession session) {
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("authMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "config/configUser";
	}

	@RequestMapping(value = "/userMana/findById", method = RequestMethod.POST)
	@ResponseBody
	public UserBean findById(@RequestBody UserBean user) {
		UserBean info = userService.findById(user.getId());
		if (info != null) {
			return info;
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/userMana/editUser", method = RequestMethod.POST)
	@ResponseBody
	public String updateUser(UserBean user,HttpSession session) {
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("authMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		int rs = userService.updateUser(user);
		if (rs != 0) {
			System.out.println("测试");
		}
		return "success";
	}

	@RequestMapping(value = "/userMana/addUser", method = RequestMethod.POST)
	@ResponseBody
	public String addUser(UserBean user,HttpSession session) {
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("authMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		int rs = userService.addUser(user);
		if (rs != 0) {
			System.out.println("测试");
		}
		return "success";
	}

	@RequestMapping(value = "/userMana/deleteUser", method = RequestMethod.POST)
	@ResponseBody
	public String deleteUser(int id,HttpSession session) {
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("authMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		int rs = userService.deleteUser(id);
		if (rs != 0) {
			System.out.println("测试");
		}
		return "success";
	}

	@RequestMapping(value = "/selectRoleAndDefault", method = RequestMethod.POST)
	public String selectRoleAndDefault(UserBean user) {
		List<RoleBean> rs = userService.selectRoleAndDefault(user);
		return "success";
	}
	@RequestMapping(value = "/selectRole")
	public ModelAndView selectRole(@RequestParam ("id") Integer id,HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("authMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		System.out.println("当前用户ID："+id);
		ModelAndView mav = new ModelAndView("/config/configSelectRole");
		mav.addObject("id", id);
		return mav;
	}
}
