package com.kevin.controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.kevin.entity.Rest;
import com.kevin.entity.AcUserBean;
import com.kevin.service.ISysUserService;
@Controller
public class LoginController {
	private static Logger logger =Logger.getLogger(LoginController.class);

	@Autowired
	private ISysUserService sysUserService;
	
	@RequestMapping(value="/doLogin",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String doLogin(String userName,String password,HttpServletRequest request,HttpServletResponse response,HttpSession session){
		logger.info("登录测试");
		if(StringUtils.isBlank(userName) || StringUtils.isBlank(password)){
			return new Gson().toJson(Rest.failure(500,"用户名或密码不能为空",null,"RuntimeException"));
		}
		AcUserBean user2 = sysUserService.selectOne(userName,password);
		if(user2 == null){
			return new Gson().toJson(Rest.failure(500,"用户名或密码错误",null,"RuntimeException"));
		}
		if(user2.getAc_state() == -1){
			return new Gson().toJson(Rest.failure(500,"该用户已锁定,请联系超级管理员",null,"RuntimeException"));
		}
		request.getSession().setAttribute("session_user",user2);
		
		session.setAttribute("user", user2.getAc_name());
		session.setAttribute("userId", user2.getAc_id());
		
		return new Gson().toJson(Rest.ok("登录成功"));
	}
	//跳转到登陆页面
	@RequestMapping(value = {"/login","/"})
	public String login(){
		return "main/sysLogin";
	}
	/**
	 * 注销
	 * @return
	 */
	@RequestMapping("/loginOut")
    public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "main/sysLogin";
    }
	
}
