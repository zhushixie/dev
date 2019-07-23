package com.kevin.controllers.ware;
import java.util.ArrayList;
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
public class WareReceiverController {

	@Autowired
	private IWareService wareService;
	@Autowired
	private IUserService userService;
	@RequestMapping(value="/receiverWareSysHome")
	public String receiverWareSysHome(){
		return "ware/receiverWareSysHome";
	}
	/**
	 * 审批流程
	 */
	@RequestMapping(value="/receiverWareInTask")
	public String receiverWareInTask(){
		
		return "ware/receiverWareInTask";
	}
	/**
	 * 任务状态分为start -> apply -> agree ->purchase ->done
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/receiverWareInTask/list")
	@ResponseBody
	public String receiverWareInTaskList(HttpSession session){
		String s = (String)session.getAttribute("roleName");
		if(s==null){return "";}
		String state = "purchase";
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
	@RequestMapping(value="/receiverWareInTaskDetail")
	public String receiverWareInTaskDetail(int id,Model m){
		System.out.println("当前任务ID:"+id);
		TWaretask task =wareService.findTaskById(id);
		UserBean user = userService.findById(task.getTStarter());
		task.settStartername(user.getName());
		m.addAttribute("task", task);
		return "ware/receiverWareInTaskDetail";
	}
	@RequestMapping(value="/receiverWareInTask/taskOperate")
	@ResponseBody
	public String receiverWareInTaskOperate(TWareview view,HttpSession session){
		String state ="";
		String act = view.getAct();
		if(act.equals("agree")){
			state = "finish";
		}else{
			state = "no finish";
		}
		view.setTExecuterid((int)session.getAttribute("userId"));
		view.setTState(state);
		wareService.insertView(view);
		wareService.updateTaskState(view.getTTaskid(),state);
		return "success";
	}
	@RequestMapping(value="/receiverWareInBillRecords")
	public String receiverWareInBillRecords(){
		return "ware/receiverWareInBillRecords";
	}
	@RequestMapping(value="/receiverWareInBillRecords/list")
	@ResponseBody
	public String receiverWareInBillRecordsList(HttpSession session){
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
	@RequestMapping(value="/receiverWareInTaskRecords")
	public String receiverWareInTaskRecords(){
		return "ware/receiverWareInTaskRecords";
	}
	@RequestMapping(value="/receiverWareInTaskRecords/list")
	@ResponseBody
	public String receiverWareInTaskRecordsList(HttpSession session){
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