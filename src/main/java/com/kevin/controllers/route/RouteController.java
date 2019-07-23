package com.kevin.controllers.route;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.R;
import com.kevin.entity.TLog;
import com.kevin.entity.TRoutedev;
import com.kevin.entity.TRoutetask;
import com.kevin.entity.UserBean;
import com.kevin.service.ILogService;
import com.kevin.service.IRouteService;

@Controller
public class RouteController {
	@Autowired
	private ILogService logService;
	@Autowired
	private IRouteService routeService;

	@RequestMapping("/routeMana")
	public String routeMana(HttpSession session) {

		TLog log = new TLog();
		log.setTUser((String) session.getAttribute("user"));
		log.setTAuth("routeMana");
		Date currentTime = new Date();
		log.setTTime(currentTime);
		logService.insertLog(log);
		String role = (String) session.getAttribute("roleName");
		if (role == null)
			return "";
		if (role.equals("巡检主管")) {
			return "route/adminRouteMana";
		} else if (role.equals("巡检员")) {
			return "route/myRouteMana";
		} else {
			return "route/workerRouteMana";
		}
	}
	@RequestMapping("/adminRouteTaskHistory")
	public String adminRouteTaskHistory(HttpSession session) {
		TLog log = new TLog();
		log.setTUser((String) session.getAttribute("user"));
		log.setTAuth("adminRouteTaskHistory");
		Date currentTime = new Date();
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "route/adminRouteTaskHistory";
	}
	@RequestMapping("/adminRouteTaskHistory/list")
	@ResponseBody
	public String adminRouteTaskHistoryList(HttpSession session) {
		R r = new R();
		r.setCode(0);
		List<TRoutetask> list = routeService.adminRouteTaskHistory((int) session.getAttribute("userId"));
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for (TRoutetask task : list) {
			task.setTStarter((String) session.getAttribute("user"));
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}

	@RequestMapping("/myRouteTask")
	public String myRouteTask(HttpSession session) {
		TLog log = new TLog();
		log.setTUser((String) session.getAttribute("user"));
		log.setTAuth("myRouteTask");
		Date currentTime = new Date();
		log.setTTime(currentTime);
		logService.insertLog(log);

		return "route/myRouteTask";
	}

	@RequestMapping("/myRouteTaskHistory")
	public String myRouteTaskHistory(HttpSession session) {
		TLog log = new TLog();
		log.setTUser((String) session.getAttribute("user"));
		log.setTAuth("myRouteTaskHistory");
		Date currentTime = new Date();
		log.setTTime(currentTime);
		logService.insertLog(log);

		return "route/myRouteTaskHistory";
	}

	@RequestMapping("/myRouteTaskHistory/list")
	@ResponseBody
	public String myRouteTaskHistoryList(HttpSession session) {
		R r = new R();
		r.setCode(0);
		List<TRoutetask> list = routeService.myRouteTaskHistory((int) session.getAttribute("userId"));
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for (TRoutetask task : list) {
			task.setTDepositor((String) session.getAttribute("user"));
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}

	@RequestMapping("/myExecuteTask/list")
	@ResponseBody
	public String myExecuteTaskList(HttpSession session) {
		R r = new R();
		r.setCode(0);
		List<TRoutetask> list = routeService.findMyExecuteTask((int) session.getAttribute("userId"));
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for (TRoutetask task : list) {
			task.setTDepositor((String) session.getAttribute("user"));
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}

	@RequestMapping("/myRouteTask/list")
	@ResponseBody
	public String myRouteTaskList(HttpSession session) {
		R r = new R();
		r.setData("");
		r.setCode(0);
		List<TRoutetask> list = routeService.findMyRouteTask((int) session.getAttribute("userId"));
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for (TRoutetask task : list) {
			task.setTDepositor((String) session.getAttribute("user"));
			rsList.add(task);
		}
		r.setData(rsList);
		return r.toJson();
	}

	@RequestMapping("/myExecuteTask")
	public String myExecuteTask(HttpSession session) {
		TLog log = new TLog();
		log.setTUser((String) session.getAttribute("user"));
		log.setTAuth("myExecuteTask");
		Date currentTime = new Date();
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "route/myRouteExecuteTask";
	}

	@RequestMapping("/adminRouteMana")
	public String routeManaAdmin() {
		return "route/adminRouteMana";
	}

	@RequestMapping("/releaseTask")
	public String releaseTask(Model m) {
		// 获取巡检人员列表
		List<UserBean> rs = routeService.getAllRouteMans();
		m.addAttribute("checkList", rs);
		return "route/adminRouteReleaseTask";
	}

	/**
	 * detail: 在已保存任务中，可以查看任务的详情信息，重新编辑提交
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("/releaseTaskDetail")
	public String releaseTaskDetail(Model m, @RequestParam("id") Integer id) {
		// 获取巡检人员列表
		System.out.println(id);
		m.addAttribute("editAll", true);
		List<UserBean> rs = routeService.getAllRouteMans();
		TRoutetask task = routeService.findTaskById(id);
		m.addAttribute("detail", task);
		m.addAttribute("checkList", rs);
		return "route/myRouteTaskDetail";
	}

	@RequestMapping("/taskDetail")
	public String taskDetail(Model m, @RequestParam("id") Integer id) {
		// 获取巡检人员列表
		System.out.println(id);
		List<UserBean> rs = routeService.getAllRouteMans();
		TRoutetask task = routeService.findTaskById(id);
		m.addAttribute("detail", task);
		m.addAttribute("editAll", false);
		m.addAttribute("checkList", rs);
		return "route/myRouteTaskDetail";
	}

	/**
	 * 已保存的信息可以再次保存
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping(value = "/routeMana/updateTaskDetail", method = RequestMethod.POST)
	@ResponseBody
	public String updateTaskDetail(Model m, TRoutetask task, @RequestParam("id") Integer id) {
		// 获取巡检人员列表
		task.setId(id);
		task.settDepositorId(Integer.valueOf(task.getTDepositor()));
		Date currentTime = new Date();
		task.setTTime(currentTime);
		task.setTType("save");
		routeService.updateTask(task);
		return "success";
	}

	/**
	 * 已保存的信息进行提交
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping(value = "/routeMana/submitTaskDetail", method = RequestMethod.POST)
	@ResponseBody
	public String submitTaskDetail(Model m, TRoutetask task, @RequestParam("id") Integer id) {
		task.setId(id);
		task.settDepositorId(Integer.valueOf(task.getTDepositor()));
		task.setTType("start");
		Date currentTime = new Date();
		task.setTTime(currentTime);
		routeService.updateTask(task);
		return "success";
	}
	

	@RequestMapping("/adminRouteStartTask")
	public String adminRouteStartTask(HttpSession session,Model m) {
		List<UserBean> rs = routeService.getAllRouteMans();
		m.addAttribute("checkList", rs);
		return "route/adminRouteStartTask";
	}

	@RequestMapping("/adminRouteSaveTask")
	public String adminRouteSaveTask(HttpSession session) {
		return "route/adminRouteSaveTask";
	}

	@RequestMapping(value = "/adminRouteSaveTask/list")
	@ResponseBody
	public String adminRouteSaveTaskList(HttpSession session) {
		List<TRoutetask> rs = routeService.findSaveTask((int) session.getAttribute("userId"));
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for (TRoutetask task : rs) {
			task.setTStarter((String) session.getAttribute("user"));
			rsList.add(task);
		}
		R r = new R();
		r.setData(rsList);
		r.setCode(0);
		return r.toJson();
	}

	@RequestMapping(value = "/adminRouteStartTask/list")
	@ResponseBody
	public String adminRouteStartTaskList(HttpSession session) {
		List<TRoutetask> rs = routeService.findStartTask((int) session.getAttribute("userId"));
		List<TRoutetask> rsList = new ArrayList<TRoutetask>();
		for (TRoutetask task : rs) {
			task.setTStarter((String) session.getAttribute("user"));
			rsList.add(task);
		}
		R r = new R();
		r.setData(rsList);
		r.setCode(0);
		return r.toJson();
	}

	// 任务状态：save start accept done,stop,reject
	@RequestMapping(value = "/routeMana/submitTask", method = RequestMethod.POST)
	@ResponseBody
	public String submitTask(TRoutetask task, HttpSession session) {
		task.settStarterId((int) session.getAttribute("userId"));
		task.settDepositorId(Integer.valueOf(task.getTDepositor()));
		task.setTType("start"); 
		Date currentTime = new Date();
		task.setTTime(currentTime);
		routeService.insertTask(task);
		return "success";
	}

	@RequestMapping(value = "/routeMana/saveTask", method = RequestMethod.POST)
	@ResponseBody
	public String saveTask(TRoutetask task, HttpSession session) {
		task.settStarterId((int) session.getAttribute("userId"));
		task.settDepositorId(Integer.valueOf(task.getTDepositor()));
		task.setTType("save");
		Date currentTime = new Date();
		task.setTTime(currentTime);
		routeService.insertTask(task);
		return "success";
	}
	@RequestMapping(value = "/routeMana/operaTaskState", method = RequestMethod.POST)
	@ResponseBody
	public String updateTaskDetail(Model m,@RequestParam("tType") String tType, @RequestParam("id") Integer id) {
		// 获取巡检人员列表
		routeService.updateTaskState(tType,id);
		return "success";
	}
	
	
	@RequestMapping(value = "/routeMana/submitRouteReason", method = RequestMethod.POST)
	@ResponseBody
	public String submitRouteReason(Model m, @RequestParam("tReason") String tReason,@RequestParam("id") Integer id) {
		routeService.updateTaskState("reject",id);
		routeService.updateTaskReason(tReason,id);
		return "success";
	}
	@RequestMapping(value = "/routeMana/deleteTask", method = RequestMethod.POST)
	@ResponseBody
	public String deleteTask(Model m, @RequestParam("id") Integer id) {
		routeService.updateTaskState("reject",id);
		return "success";
	}
	/**
	 * 
	 * @param m
	 * @param tDepositor 更改执行人，原任务状态变为终止
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/routeMana/replaceDepositor", method = RequestMethod.POST)
	@ResponseBody
	public String replaceDepositor(Model m, @RequestParam("tDepositor") Integer tDepositor,@RequestParam("id") Integer id) {
		routeService.updateTaskState("abandon",id);
		TRoutetask task = routeService.findTaskById(id);
		task.settDepositorId(tDepositor);
		task.setTType("start");
		Date currentTime = new Date();
		task.setTTime(currentTime);
		routeService.insertTask(task);
		return "success";
	}
	@RequestMapping(value = "/routeMana/mySubmitCheckDev", method = RequestMethod.POST)
	@ResponseBody
	public String mySubmitCheckDev(Model m,  TRoutedev dev,HttpSession session) {
		dev.settCheckerId((int)session.getAttribute("userId"));
		Date currentTime = new Date();
		dev.settTime(currentTime);
		routeService.insertDevMsg(dev);
		return "success";
	}
	@RequestMapping(value = "/myCheckDev")
	public String myCheckDev(Model m,  TRoutedev dev,HttpSession session) {
		return "route/myRouteCheckDev";
	}
	
	@RequestMapping(value = "/myDevRecord")
	public String myDevRecord(Model m,  TRoutedev dev,HttpSession session) {
		return "route/myRouteDevRecord";
	}
	
	@RequestMapping(value = "/routeMana/myDevRecordList", method = RequestMethod.POST)
	@ResponseBody
	public String myDevRecordList(Model m, HttpSession session) {
		List<TRoutedev> rs = routeService.findDevMsg((int) session.getAttribute("userId"));
		R r = new R();
		r.setData(rs);
		r.setCode(0);
		return r.toJson();
	}
}
