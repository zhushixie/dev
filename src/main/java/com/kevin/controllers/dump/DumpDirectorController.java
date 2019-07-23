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
public class DumpDirectorController {
	@Autowired
	private IDumpService dumpService;
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="/directorDumpTask")
	public String directorDumpTask(){
		return "dump/directorDumpTask";
	}
	@RequestMapping(value="/directorDumpTask/list")
	@ResponseBody
	public String directorDumpTaskList(HttpSession session){
		R r = new R();
		r.setCode(0);
		List<TDumptask> list =dumpService.selectTaskByState("verify");
		List<TDumptask> rsList = new ArrayList<TDumptask>();
		for (TDumptask task : list) {
			UserBean user = userService.findById(task.getTStarterid());
			task.settStarter(user.getName());
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}
	@RequestMapping(value="/directorDumpDevRecord")
	public String directorDumpDevRecord(){
		return "dump/directorDumpDevRecord";
	}
	@RequestMapping(value="/directorDumpTaskRecord")
	public String directorDumpTaskRecord(){
		return "dump/directorDumpTaskRecord";
	}
	@RequestMapping(value="/directorDumpTaskDetail")
	public String directorDumpTaskDetail(Model m,int id){
		System.out.println(id);
		TDumptask task = dumpService.selectTaskById(id);
		m.addAttribute("task", task);
		return "dump/directorDumpTaskDetail";
	}
	@RequestMapping(value="/directorDumpMana/taskOperate")
	@ResponseBody
	public String directorDumpManaTaskOperate(TView view,HttpSession session){
		System.out.println(view.getCurrentState());
		int userId = (int)session.getAttribute("userId");
		if(view.getAct().equals("disagree")){
			dumpService.updateTaskDirectorState(view.getId(), userId, "no apply", view.getReason());
		}else{
			dumpService.updateTaskDirectorState(view.getId(), userId, "apply", view.getReason());
		}
		return "success";
	}
	
}
