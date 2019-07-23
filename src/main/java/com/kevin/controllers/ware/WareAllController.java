package com.kevin.controllers.ware;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.TWaretask;
import com.kevin.entity.UserBean;
import com.kevin.service.IUserService;
import com.kevin.service.IWareService;

/**
 * 
 * 设备管理员调用配件，填写调用单，发起任务（start）,
 * 维修员填写调用单（wait）,维修主管审批（start）,
 * 待仓库主管审批（agree）,仓管员接受任务（accept）,出库（out）,设备管理员，维修员 验收（finish）
 * @author kevin
 *
 */
@Controller
public class WareAllController {

	@Autowired
	private IWareService wareService;
	@Autowired
	private IUserService userService;

	/**
	 * 根据ID 查看任务详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/wareInTaskDetail")
	public String wareInTaskDetail(int id,Model m){
		System.out.println("当前任务ID:"+id);
		TWaretask task =wareService.findTaskById(id);
		UserBean user = userService.findById(task.getTStarter());
		task.settStartername(user.getName());
		m.addAttribute("task", task);
		return "ware/wareInTaskDetail";
	}
	@RequestMapping(value="/allWareOutStartTask")
	public String allWareOutStartTask(){
		return "ware/allWareOutStartTask";
	}
	@RequestMapping(value="/allWareOutSaveTask")
	public String allWareOutSaveTask(){
		return "ware/allWareOutSaveTask";
	}
	@RequestMapping(value="/allWareOutTask")
	public String allWareOutTask(){
		return "ware/allWareOutTask";
	}
	@RequestMapping(value="/allWareOutTask/deleteTask")
	@ResponseBody
	public String allWareOutTaskDeleteTask(int id,HttpSession session){
		wareService.deleteTask(id);
		return "success";
	}
	@RequestMapping(value="/allWareOutTask/startTask")
	@ResponseBody
	public String allWareOutTaskSubmitTask(TWaretask task,HttpSession session){
		System.out.println(task.getTName());
		task.setTType("出库");
		task.setTState("start");
		task.setTStarter((Integer)session.getAttribute("userId"));
		if(task.getId()!=null){
			wareService.updateTask(task);
		}else{
			wareService.insertTask(task);
		}
		return "success";
	}
	@RequestMapping(value="/allWareOutTask/saveTask")
	@ResponseBody
	public String allWareOutTaskSaveTask(TWaretask task,HttpSession session){
		System.out.println(task.getTName());
		task.setTState("save");
		task.setTType("采购");
		task.setTStarter((Integer)session.getAttribute("userId"));
		if(task.getId()!=null){
			wareService.updateTask(task);
		}else{
			wareService.insertTask(task);
		}
		return "success";
	}
	@RequestMapping(value="/allWareSupplier")
	public String allWareSupplier(){
		return "ware/allWareSupplier";
	}
}