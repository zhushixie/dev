package com.kevin.controllers.ware;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.R;
import com.kevin.entity.TLog;
import com.kevin.entity.TWarerecord;
import com.kevin.entity.TWaretask;
import com.kevin.entity.TWareview;
import com.kevin.entity.UserBean;
import com.kevin.service.ILogService;
import com.kevin.service.IUserService;
import com.kevin.service.IWareService;

@Controller
public class WareDirectorController {

	@Autowired
	private IWareService wareService;
	@Autowired
	private IUserService userService;
	@RequestMapping(value="/directorWareSysHome")
	public String keeperSysHome(){
		return "ware/directorWareSysHome";
	}
	/**
	 * 审批流程
	 */
	@RequestMapping(value="/directorWareInTask")
	public String directorWareInTask(){
		
		return "ware/directorWareInTask";
	}
	/**
	 * 任务状态分为start -> apply -> agree ->purchase ->done
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/directorWareInTask/list")
	@ResponseBody
	public String directorWareInTaskList(HttpSession session){
		String s = (String)session.getAttribute("roleName");
		if(s==null){return "";}
		String state = "start";
		R r = new R();
		r.setData("");
		r.setCode(0);
		List<TWaretask>  list = wareService.getTaskListByState(state);
		List<TWaretask> rsList = new ArrayList<TWaretask>();
		for (TWaretask task : list) {
			UserBean user = userService.findById(task.getTStarter());
			task.settStartername(user.getName());
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}
	@RequestMapping(value="/directorWareInTaskDetail")
	public String directorWareInTaskDetail(int id,Model m){
		System.out.println("当前任务ID:"+id);
		TWaretask task =wareService.findTaskById(id);
		UserBean user = userService.findById(task.getTStarter());
		task.settStartername(user.getName());
		m.addAttribute("task", task);
		return "ware/directorWareInTaskDetail";
	}
	@RequestMapping(value="/directorWareInTask/taskOperate")
	@ResponseBody
	public String directorWareInTaskOperate(TWareview view,HttpSession session){
		String state ="";
		String act = view.getAct();
		if(act.equals("agree")){
			state = "apply";
		}else{
			state = "no apply";
		}
		view.setTExecuterid((int)session.getAttribute("userId"));
		view.setTState(state);
		wareService.updateTaskDirectorView((int)session.getAttribute("userId"), view.getTView(), view.getTTaskid());
		wareService.updateTaskState(view.getTTaskid(),state);
		return "success";
	}
	@RequestMapping(value="/directorWareInBillRecords")
	public String directorWareInBillRecords(){
		return "ware/directorWareInBillRecords";
	}
	@RequestMapping(value="/directorWareInBillRecords/list")
	@ResponseBody
	public String directorWareInBillRecordsList(HttpSession session){
		R r = new R();
		r.setData("");
		r.setCode(0);
		List<TWarerecord>  list = wareService.getWareRecordsByType("入库");
		List<TWarerecord> rsList = new ArrayList<TWarerecord>();
		for (TWarerecord task : list) {
			UserBean user = userService.findById(task.getTUser());
			task.settUsername(user.getName());
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}
	@RequestMapping(value="/directorWareInTaskRecords")
	public String directorWareInTaskRecords(){
		return "ware/directorWareInTaskRecords";
	}
	@RequestMapping(value="/directorWareInTaskRecords/list")
	@ResponseBody
	public String directorWareInTaskRecordsList(HttpSession session){
		R r = new R();
		r.setData("");
		r.setCode(0);
		List<TWaretask>  list = wareService.getTaskListByExecuterId((int)session.getAttribute("userId"));
		List<TWaretask> rsList = new ArrayList<TWaretask>();
		for (TWaretask task : list) {
			UserBean user = userService.findById(task.getTStarter());
			task.settStartername(user.getName());
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}
}