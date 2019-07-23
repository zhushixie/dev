package com.kevin.controllers.dump;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.R;
import com.kevin.entity.TDumptask;
import com.kevin.entity.TView;
import com.kevin.entity.UserBean;
import com.kevin.service.IDumpService;
import com.kevin.service.IUserService;

@Controller
public class DumpManagerController {
	@Autowired
	private IDumpService dumpService;
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="/managerDumpTask")
	public String managerDumpTask(){
		return "dump/managerDumpTask";
	}
	@RequestMapping(value="/managerDumpTask/list")
	@ResponseBody
	public String managerDumpTaskList(HttpSession session){
		R r = new R();
		r.setCode(0);
		List<TDumptask> list =dumpService.selectTaskByState("apply");
		List<TDumptask> rsList = new ArrayList<TDumptask>();
		for (TDumptask task : list) {
			UserBean user = userService.findById(task.getTStarterid());
			task.settStarter(user.getName());
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}
	@RequestMapping(value="/managerDumpDevRecord")
	public String managerDumpDevRecord(){
		return "dump/managerDumpDevRecord";
	}
	@RequestMapping(value="/managerDumpTaskRecord")
	public String managerDumpTaskRecord(){
		return "dump/managerDumpTaskRecord";
	}
	@RequestMapping(value="/managerDumpTaskDetail")
	public String managerDumpTaskDetail(Model m,int id){
		System.out.println(id);
		TDumptask task = dumpService.selectTaskById(id);
		m.addAttribute("task", task);
		return "dump/managerDumpTaskDetail";
	}
	@RequestMapping(value="/managerDumpMana/taskOperate")
	@ResponseBody
	public String managerDumpManaTaskOperate(TView view,HttpSession session){
		System.out.println(view.getCurrentState());
		int userId = (int)session.getAttribute("userId");
		if(view.getAct().equals("disagree")){
			dumpService.updateTaskManagerState(view.getId(), userId, "no agree", view.getReason());
		}else{
			dumpService.updateTaskManagerState(view.getId(), userId, "agree", view.getReason());
		}
		return "success";
	}
}
