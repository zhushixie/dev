package com.kevin.controllers.config;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kevin.entity.R;
import com.kevin.entity.RoleBean;
import com.kevin.entity.TLog;
import com.kevin.entity.UserRoleBean;
import com.kevin.service.ILogService;
import com.kevin.service.IRoleService;

@Controller
public class RoleController {
	@Autowired
	private IRoleService roleService;
	@Autowired
	private ILogService logService;
	/**
	 * @param 
	 * @return 
	 */
	   @RequestMapping(value={"/roleMana",""},method=RequestMethod.GET)
	   public String roleMana(HttpSession session){ 
			TLog log = new TLog();
			log.setTUser((String)session.getAttribute("user"));
			log.setTAuth("roleMana");
			Date currentTime = new Date();  
			log.setTTime(currentTime);
			logService.insertLog(log);
	    return "config/configRole";
	   }
		@RequestMapping(value="/roleMana/findAllRole",method=RequestMethod.POST)
		@ResponseBody
		public String findAllRole(){
			R r = new R();
			List<RoleBean> rs = roleService.findAllRole();
			r.setData(rs);
			r.setCode(0);
			return r.toJson();
		}
		/**
		 * 选择用户角色，包含已选择的角色
		 * 
		 * 
		 * 
		 * @return
		 */
		@RequestMapping(value="/roleMana/findSelectedRoles",method=RequestMethod.POST)
		@ResponseBody
		public String findSelectedRole(int id){
			R r = new R();
			List<RoleBean> rs = roleService.findSelectedRoles(id);
			r.setData(rs);
			r.setCode(0);
			return r.toJson();
		}
		@RequestMapping(value="/roleMana/addUserRole",method=RequestMethod.POST)
		@ResponseBody
		public String addUserRole(UserRoleBean user,HttpSession session){
			System.out.println(user.getRoleId());
			if(roleService.addUserRole(user)>0){
				return "success";
			}else{
				return "failure";
			}
			
		}
		@RequestMapping(value="/roleMana/deleteUserRole",method=RequestMethod.POST)
		@ResponseBody
		public String deleteRole(UserRoleBean user,HttpSession session){
			System.out.println(user.getRoleId());
			if(roleService.deleteUserRole(user)>0){
				return "success";
			}else{
				return "failure";
			}
		}
		@RequestMapping(value="/roleMana/addRole",method=RequestMethod.POST)
		@ResponseBody
		public int addRole(RoleBean user){
			int rs = roleService.addRole(user);
			if(rs>0){
				return rs;
			}else{
				return 0;
			}
		}
		@RequestMapping(value="/roleMana/deleteRole",method=RequestMethod.POST)
		@ResponseBody
		public int deleteRole(RoleBean user){
			int rs = roleService.addRole(user);
			if(rs>0){
				return rs;
			}else{
				return 0;
			}
		}
		@RequestMapping(value = "/selectAuth")
		public ModelAndView selectAuth(@RequestParam ("id") Integer id,HttpSession session){
			TLog log = new TLog();
			log.setTUser((String)session.getAttribute("user"));
			log.setTAuth("selectAuth");
			Date currentTime = new Date();  
			log.setTTime(currentTime);
			logService.insertLog(log);
			System.out.println("当前用户ID："+id);
			ModelAndView mav = new ModelAndView("config/configSelectAuth");
			mav.addObject("id", id);
			return mav;
		}
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   

}
