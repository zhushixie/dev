package com.kevin.controllers.config;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.kevin.entity.DeptBean;
import com.kevin.entity.TLog;
import com.kevin.entity.UserBean;
import com.kevin.service.IDeptService;
import com.kevin.service.ILogService;

@Controller
@RequestMapping(value="/deptMana")
public class DeptController {
	@Autowired
	private ILogService logService;
	@Autowired
	private IDeptService deptService;
	
	@RequestMapping(value="")
	public String DeptMana(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("DeptMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "config/configDept";
	}
    /**
     * pagesize：每页条数
     * page:当前页
     **/
   @RequestMapping(value="/list",method=RequestMethod.POST)
   @ResponseBody
   public Map<String, Object>findAllByPage(int page,int pageSize){ 
    Map<String, Object> resultMap = new HashMap<String, Object>();
    PageInfo<DeptBean> pager = deptService.findDeptsByPage(page,pageSize);
    //总条数
    resultMap.put("total", pager.getTotal());
    //获取每页数据
    resultMap.put("rows", pager.getList());
    return resultMap;
   }
   //查找所有的部门名称
   @RequestMapping(value="/listName",method=RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> findListName(){ 
    Map<String, Object> resultMap = new HashMap<String, Object>();
    List<DeptBean> deptList = deptService.selectName();
    //总条数
    resultMap.put("list", deptList);
    return resultMap;
   }
}
