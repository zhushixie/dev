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
/**
 * 
 * @author kevin
 * @role 设备管理员
 *
 */
@Controller
public class DumpCheckerController {
	@Autowired
	private IDumpService dumpService;
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="/checkerDumpTask")
	public String checkerDumpTask(){
		return "dump/checkerDumpTask";
	}
	@RequestMapping(value="/checkerDumpTask/list")
	@ResponseBody
	public String checkerDumpTaskList(HttpSession session){
		R r = new R();
		r.setCode(0);
		List<TDumptask> list =dumpService.selectTaskByState("start");
		List<TDumptask> rsList = new ArrayList<TDumptask>();
		for (TDumptask task : list) {
			UserBean user = userService.findById(task.getTStarterid());
			task.settStarter(user.getName());
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}
	@RequestMapping(value="/checkerDumpDevRecord")
	public String checkerDumpDevRecord(){
		return "dump/checkerDumpDevRecord";
	}
	@RequestMapping(value="/checkerDumpTaskRecord")
	public String checkerDumpTaskRecord(){
		return "dump/checkerDumpTaskRecord";
	}
	@RequestMapping(value="/checkerDumpTaskDetail")
	public String checkerDumpTaskDetail(Model m,int id){
		System.out.println(id);
		TDumptask task = dumpService.selectTaskById(id);
		m.addAttribute("task", task);
		return "dump/checkerDumpTaskDetail";
	}
	@RequestMapping(value="/checkerDumpMana/taskOperate")
	@ResponseBody
	public String checkerDumpManaTaskOperate(TView view,HttpSession session){
		System.out.println(view.getCurrentState());
		int userId = (int)session.getAttribute("userId");
		if(view.getAct().equals("disagree")){
			dumpService.updateTaskCheckerState(view.getId(), userId, "no verify", view.getReason());
		}else{
			dumpService.updateTaskCheckerState(view.getId(), userId, "verify", view.getReason());
		}
		return "success";
	}
}
