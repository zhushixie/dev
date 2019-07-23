package com.kevin.controllers.dump;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.R;
import com.kevin.entity.TDumptask;
import com.kevin.service.IDumpService;
/**
 * 
 * @author kevin
 * @role 设备管理员
 *
 */
@Controller
public class DumpApplicantController {
	@Autowired
	private IDumpService dumpService;
	/**
	 * @author kevin
	 * @since 2019.5.1
	 * @note 
	 * @return 设备报废单路径
	 */
	@RequestMapping(value="/applicantDumpTaskForm")
	public String applicantDumpTaskForm(){
		return "dump/applicantDumpTaskForm";
	}
	/**
	 * @author kevin
	 * @since 2019.5.1
	 * @note 报废任务保存
	 * @return 报废任务成功与否
	 */
	@RequestMapping(value="/applicantDumpTaskForm/saveTask", method = RequestMethod.POST)
	@ResponseBody
	public String applicantDumpTaskFormSave(TDumptask task,HttpSession session){
		if(task.getId()==null){
			System.out.println("任务编号为空");
		}
		task.setTState("save");
		int userId = (int)session.getAttribute("userId");
		task.setTStarterid(userId);
		dumpService.saveTask(task);
		System.out.println(task.getTName());
		return "success";
	}
	/**
	 * 
	 * @author kevin
	 * @since 2019.5.1
	 * @note 开启报废任务
	 * @return 报废任务开启成功与否
	 */
	@RequestMapping(value="/applicantDumpTaskForm/startTask", method = RequestMethod.POST)
	@ResponseBody
	public String applicantDumpTaskFormStart(TDumptask task,HttpSession session){
		System.out.println(task.getTName());
		task.setTState("start");
		int userId = (int)session.getAttribute("userId");
		task.setTStarterid(userId);
		Date currentTime = new Date();  
		task.setTDumptime(currentTime);
		if(task.getId()==null){
			System.out.println("任务编号为空");
		}
		dumpService.startTask(task);
		System.out.println(task.getTName());
		return "success";
	}
	/**
	 * 我的任务
	 * @return
	 */
	@RequestMapping(value="/applicantDumpTask")
	public String applicantDumpTask(){
		return "dump/applicantDumpTask";
	}
	@RequestMapping(value="/applicantDumpTask/list")
	@ResponseBody
	public String applicantDumpTaskList(HttpSession session){
		R r = new R();
		r.setCode(0);
		List<TDumptask> list =dumpService.selectOnTasksByStaterid((int)session.getAttribute("userId")) ;
		List<TDumptask> rsList = new ArrayList<TDumptask>();
		for (TDumptask task : list) {
			task.settStarter((String) session.getAttribute("user"));
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}
	
	@RequestMapping(value="/applicantDumpSaveTask")
	public String applicantDumpSaveTask(){
		return "dump/applicantDumpSaveTask";
	}
	@RequestMapping(value="/applicantDumpSaveTask/list")
	@ResponseBody
	public String applicantDumpSaveTaskList(HttpSession session){
		R r = new R();
		r.setCode(0);
		List<TDumptask> list =dumpService.selectSaveTasksByStaterid((int)session.getAttribute("userId")) ;
		List<TDumptask> rsList = new ArrayList<TDumptask>();
		for (TDumptask task : list) {
			task.settStarter((String) session.getAttribute("user"));
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}
	@RequestMapping(value="/applicantDumpTaskRecord")
	public String applicantDumpTaskRecord(){
		return "dump/applicantDumpTaskRecord";
	}
	
	@RequestMapping(value="/applicantDumpTaskRecord/list")
	@ResponseBody
	public String applicantDumpTaskRecordList(HttpSession session){
		R r = new R();
		r.setCode(0);
		List<TDumptask> list =dumpService.selectTaskRecordByStaterid((int)session.getAttribute("userId")) ;
		List<TDumptask> rsList = new ArrayList<TDumptask>();
		for (TDumptask task : list) {
			task.settStarter((String) session.getAttribute("user"));
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}
	@RequestMapping(value="/applicantDumpDevRecord")
	public String applicantDumpDevRecord(){
		return "dump/applicantDumpDevRecord";
	}
	
}
