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
import com.kevin.entity.TWarerecord;
import com.kevin.entity.TWaretask;
import com.kevin.entity.TWareview;
import com.kevin.entity.UserBean;
import com.kevin.service.IUserService;
import com.kevin.service.IWareService;

@Controller
public class WareManagerController {

	@Autowired
	private IWareService wareService;
	@Autowired
	private IUserService userService;
	@RequestMapping(value="/managerWareSysHome")
	public String managerWareSysHome(){
		return "ware/managerWareSysHome";
	}
	/**
	 * 审批流程
	 */
	@RequestMapping(value="/managerWareInTask")
	public String managerWareInTask(){
		
		return "ware/managerWareInTask";
	}
	/**
	 * 任务状态分为start -> apply -> agree ->purchase ->done
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/managerWareInTask/list")
	@ResponseBody
	public String managerWareInTaskList(HttpSession session){
		String s = (String)session.getAttribute("roleName");
		if(s==null){return "";}
		String state = "apply";
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
	@RequestMapping(value="/managerWareInTaskDetail")
	public String managerWareInTaskDetail(int id,Model m){
		System.out.println("当前任务ID:"+id);
		TWaretask task =wareService.findTaskById(id);
		UserBean user = userService.findById(task.getTStarter());
		task.settStartername(user.getName());
		m.addAttribute("task", task);
		return "ware/managerWareInTaskDetail";
	}
	@RequestMapping(value="/managerWareInTask/taskOperate")
	@ResponseBody
	public String managerWareInTaskOperate(TWareview view,HttpSession session){
		String state ="";
		String act = view.getAct();
		if(act.equals("agree")){
			state = "agree";
		}else{
			state = "no agree";
		}
		view.setTExecuterid((int)session.getAttribute("userId"));
		view.setTState(state);
		wareService.updateTaskManagerView((int)session.getAttribute("userId"), view.getTView(), view.getTTaskid());
		wareService.updateTaskState(view.getTTaskid(),state);
		return "success";
	}
	@RequestMapping(value="/managerWareInBillRecords")
	public String managerWareInBillRecords(){
		return "ware/managerWareInBillRecords";
	}
	@RequestMapping(value="/managerWareInBillRecords/list")
	@ResponseBody
	public String managerWareInBillRecordsList(HttpSession session){
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
	@RequestMapping(value="/managerWareInTaskRecords")
	public String managerWareInTaskRecords(){
		return "ware/managerWareInTaskRecords";
	}
	@RequestMapping(value="/managerWareInTaskRecords/list")
	@ResponseBody
	public String managerWareInTaskRecordsList(HttpSession session){
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