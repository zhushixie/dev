package com.kevin.controllers.fix;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.R;
import com.kevin.entity.TFault;
import com.kevin.service.IFaultService;
@Controller
public class FixApplicantController {
	@Autowired
	private IFaultService faultService;
	@RequestMapping(value="/applicantFixTask")
	public String applicantFixTask(){
		return "fix/applicantFixTask";
	}
	@RequestMapping(value="/applicantFixTask/saveTask")
	@ResponseBody
	public String applicantFixTaskSaveTask(TFault fault,HttpSession session){
		System.out.println(fault.getTName());
		Date date = new Date();
		fault.setTTime(date);
		fault.setTState("save");
		fault.setTStarter((Integer)session.getAttribute("userId"));
		faultService.insertInitFault(fault);
		return "success";
	}
	@RequestMapping(value="/applicantFixTask/startTask")
	@ResponseBody
	public String applicantFixTaskStartTask(TFault fault,HttpSession session){
		System.out.println(fault.getTName());
		Date date = new Date();
		fault.setTTime(date);
		fault.setTState("start");
		fault.setTStarter((Integer)session.getAttribute("userId"));
		faultService.insertInitFault(fault);
		return "success";
	}
	@RequestMapping(value="/applicantFixSaveTask")
	public String applicantFixSaveTask(){
		return "fix/applicantFixSaveTask";
	}
	@RequestMapping(value="/applicantFixSaveTask/list")
	@ResponseBody
	public String applicantFixSaveTaskList(HttpSession session){
		R r = new R();
		r.setCode(0);
		List<TFault> list = faultService.getStarterFaultsByState((Integer)session.getAttribute("userId"),"save");
		r.setData(list);
		return r.toJson();

	}
	@RequestMapping(value="/applicantFixStartTask")
	public String applicantFixStartTask(){
		return "fix/applicantFixStartTask";
	}
	@RequestMapping(value="/applicantFixStartTask/list")
	@ResponseBody
	public String applicantFixStartTaskList(HttpSession session){
		R r = new R();
		r.setCode(0);
		List<TFault> list = faultService.getStartFaultsByStarter((Integer)session.getAttribute("userId"));
		r.setData(list);
		return r.toJson();
	}
	@RequestMapping(value="/applicantFixTaskRecords")
	public String applicantFixTaskRecords(){
		return "fix/applicantFixTaskRecords";
	}
	@RequestMapping(value="/applicantFixTaskRecords/list")
	@ResponseBody
	public String applicantFixTaskRecordsList(HttpSession session){
		R r = new R();
		r.setCode(0);
		List<TFault> list = faultService.getStarterFaultsByState((Integer)session.getAttribute("userId"),"finish");
		r.setData(list);
		return r.toJson();
	}
}
