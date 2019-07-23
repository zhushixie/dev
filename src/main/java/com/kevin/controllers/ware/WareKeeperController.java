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
import com.kevin.entity.TAccessory;
import com.kevin.entity.TWarerecord;
import com.kevin.entity.TWaretask;
import com.kevin.entity.TWareview;
import com.kevin.entity.UserBean;
import com.kevin.service.IUserService;
import com.kevin.service.IWareService;
/**
 * 任务流程
 * 发起任务（start），主管审批(apply),经理审批（agree）,执行采购（purchase）,申请验收（accepting）,验收（accept）,确认（finish）
 * @author kevin
 *
 */
@Controller
public class WareKeeperController {
	@Autowired
	private IWareService wareService;
	@Autowired
	private IUserService userService;
	@RequestMapping(value="/keeperWareSysHome")
	public String keeperSysHome(){
		return "ware/keeperWareSysHome";
	}
	@RequestMapping(value="/keeperWareInTaskDetail")
	public String wareInTaskDetail(int id,Model m){
		System.out.println("当前任务ID:"+id);
		TWaretask task =wareService.findTaskById(id);
		UserBean user = userService.findById(task.getTStarter());
		task.settStartername(user.getName());
		m.addAttribute("task", task);
		return "ware/keeperWareInTaskDetail";
	}
	/**
	 * 入库管理
	 * @return
	 */
		@RequestMapping(value="/keeperWareInBill")
		public String keeperWareInBill(){
			return "ware/keeperWareInBill";
		}
		@RequestMapping(value="/keeperWareInBill/submitBill")
		@ResponseBody
		public String keeperWareInBillSubmitBill(TAccessory accessory,HttpSession session){
			String tCode = accessory.getTCode();
			if(wareService.checkCodeIsInTable(tCode)>0){
				int count = wareService.getAccessoryMountByCode(tCode);
				wareService.updateAccessory(accessory.getTCount()+count, accessory.getTCode());
			}else{
				wareService.insertAccessory(accessory);
			}
			TWarerecord record = new TWarerecord();
			String content = "添加零部件"+accessory.getTName()+",数量为"+accessory.getTCount()+"个";
			record.setTContent(content);
			record.setTUser((Integer)session.getAttribute("userId"));
			Date currentTime = new Date();  
			record.setTTime(currentTime);
			record.setTType("入库");
			wareService.insertRecord(record);
			return "success";
		}
		@RequestMapping(value="/keeperWareInBillRecords")
		public String keeperWareInBillRecords(){
			return "ware/keeperWareInBillRecords";
		}
		@RequestMapping(value="/keeperWareInBillRecords/list")
		@ResponseBody
		public String keeperWareInBillRecordsList(HttpSession session){
			R r = new R();
			r.setData("");
			r.setCode(0);
			List<TWarerecord>  list = wareService.getRecordsByUserIdAndType((int)session.getAttribute("userId"),"入库");
			List<TWarerecord> rsList = new ArrayList<TWarerecord>();
			for (TWarerecord task : list) {
				task.settUsername((String)session.getAttribute("user"));
				rsList.add(task);
			}
			r.setData(rsList);
			return r.toJson();
		}
		@RequestMapping(value="/keeperWareInTask")
		public String keeperWareInTask(){
			return "ware/keeperWareInTask";
		}
		@RequestMapping(value="/keeperWareInTask/startTask")
		@ResponseBody
		public String keeperWareInTaskSubmitTask(TWaretask task,HttpSession session){
			System.out.println(task.getTName());
			task.setTType("采购");
			task.setTState("start");
			task.setTStarter((Integer)session.getAttribute("userId"));
			if(task.getId()!=null){
				wareService.updateTask(task);
			}else{
				wareService.insertTask(task);
			}
			return "success";
		}
		@RequestMapping(value="/keeperWareInTask/deleteTask")
		@ResponseBody
		public String keeperWareInTaskDeleteTask(int id,HttpSession session){
			wareService.deleteTask(id);
			return "success";
		}

		@RequestMapping(value="/keeperWareInTask/saveTask")
		@ResponseBody
		public String keeperWareInTaskSaveTask(TWaretask task,HttpSession session){
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
		@RequestMapping(value="/keeperWareInSaveTask")
		public String keeperWareInSaveTask(){
			return "ware/keeperWareInSaveTask";
		}
		/**
		 * 获取任务保存的列表
		 * @return
		 */
		@RequestMapping(value="/keeperWareInSaveTask/list")
		@ResponseBody
		public String keeperWareInSaveTaskList(HttpSession session){
			R r = new R();
			r.setData("");
			r.setCode(0);
			List<TWaretask>  list = wareService.getAllTaskList((Integer)session.getAttribute("userId"),"save");
			List<TWaretask> rsList = new ArrayList<TWaretask>();
			for (TWaretask task : list) {
				task.settStartername((String)session.getAttribute("user"));
				rsList.add(task);
			}
			r.setData(rsList);
			return r.toJson();
		}
		@RequestMapping(value="/keeperWareInStartTask")
		public String keeperWareInStartTask(){
			return "ware/keeperWareInStartTask";
		}
		@RequestMapping(value="/keeperWareInStartTask/list")
		@ResponseBody
		public String keeperWareInStartTaskList(HttpSession session){
			R r = new R();
			r.setData("");
			r.setCode(0);
			List<TWaretask>  list = wareService.getKeeperStartTaskList((Integer)session.getAttribute("userId"));
			List<TWaretask> rsList = new ArrayList<TWaretask>();
			for (TWaretask task : list) {
				task.settStartername((String)session.getAttribute("user"));
				rsList.add(task);
			}
			r.setData(rsList);
			return r.toJson();
		}
		
		@RequestMapping(value="/keeperWareInTaskRecords")
		public String keeperWareInTaskRecords(HttpSession session){

			return "ware/keeperWareInTaskRecords";
		}
		
		@RequestMapping(value="/keeperWareInTaskRecords/list")
		@ResponseBody
		public String keeperWareInTaskRecordsList(HttpSession session){
			R r = new R();
			r.setData("");
			r.setCode(0);
			List<TWaretask>  list = wareService.getKeeperFinishTaskList((Integer)session.getAttribute("userId"));
			List<TWaretask> rsList = new ArrayList<TWaretask>();
			for (TWaretask task : list) {
				task.settStartername((String)session.getAttribute("user"));
				rsList.add(task);
			}
			r.setData(rsList);
			return r.toJson();
		}
		@RequestMapping(value="/keeperWareOutBill")
		public String keeperWareOutBill(){
			return "ware/keeperWareOutBill";
		}
		
		@RequestMapping(value="/keeperWareOutBillRecords")
		public String keeperWareOutBillRecords(){
			return "ware/keeperWareOutBillRecords";
		}
		
		@RequestMapping(value="/keeperWareOutTask")
		public String keeperWareOutTask(){
			return "ware/keeperWareOutTask";
		}
		
		@RequestMapping(value="/keeperWareOutTaskRecords")
		public String keeperWareOutTaskRecords(){
			return "ware/keeperWareOutTaskRecords";
		}
		
		@RequestMapping(value="/keeperWareOutSaveTask")
		public String keeperWareOutSaveTask(){
			return "ware/keeperWareOutTaskRecords";
		}
		
		@RequestMapping(value="/keeperWareOutStartTask")
		public String keeperWareOutStartTask(){
			return "ware/keeperWareOutStartTask";
		}
		/**
		 * 库存管理
		 */
		@RequestMapping(value="/keeperWareStockingRecords")
		public String keeperWareStockingRecords(){
			return "ware/keeperWareStockingRecords";
		}
		@RequestMapping(value="/keeperWareStockSpoilageTask")
		public String keeperWareStockSpoilageTask(){
			return "ware/keeperWareStockSpoilageTask";
		}
		@RequestMapping(value="/keeperWareStockSpoilageCheckin")
		public String keeperWareStockSpoilageCheckin(){
			return "ware/keeperWareStockSpoilageCheckin";
		}
		@RequestMapping(value="/keeperWareStockSpoilageTaskRecords")
		public String keeperWareStockSpoilageTaskRecords(){
			return "ware/keeperWareStockSpoilageTaskRecords";
		}
		@RequestMapping(value="/keeperWareStockSaveSpoilageTask")
		public String keeperWareStockSaveSpoilageTask(){
			return "ware/keeperWareStockSaveSpoilageTask";
		}
		@RequestMapping(value="/keeperWareStockStartSpoilageTask")
		public String keeperWareStockStartSpoilageTask(){
			return "ware/keeperWareStockStartSpoilageTask";
		}
		
		
		
		
		/**
		 * 库存设置
		 */
		@RequestMapping(value="/keeperWareStockSettings")
		public String keeperWareStockSettings(){
			return "ware/keeperWareStockSettings";
		}
}