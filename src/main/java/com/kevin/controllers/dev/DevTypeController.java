package com.kevin.controllers.dev;

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
import com.kevin.entity.TDevtype;
import com.kevin.entity.TFile;
import com.kevin.entity.TLog;
import com.kevin.entity.TRoutetask;
import com.kevin.service.IDevTypeService;
import com.kevin.service.IFileService;
import com.kevin.service.ILogService;

@Controller
public class DevTypeController {
	@Autowired
	private ILogService logService;
	@Autowired
	private IDevTypeService devTypeService;
	@Autowired
	private IFileService fileService;
	/**
	 * 
	 * @return 设备类型管理
	 */
	@RequestMapping(value={"/devTypeMana"})
	public String devTypeMana(HttpSession session){
		TLog log = new TLog();
		log.setTUser((String)session.getAttribute("user"));
		log.setTAuth("devTypeMana");
		Date currentTime = new Date();  
		log.setTTime(currentTime);
		logService.insertLog(log);
		return "devtype/devTypeMana";
	}
	/**
	 * 
	 * @return 通用设备界面
	 */
	@RequestMapping(value={"/devTypeUniversal"})
	public String universalDev(){
		return "devtype/devTypeUniversal";
	}
	@RequestMapping(value={"/devTypeUniversal/list"})
	@ResponseBody
	public String listUniversalDev(){
		
		return "universalDev";
	}
	
	/**
	 * 
	 * @return 工业设备界面
	 */
	@RequestMapping(value={"/devTypeIndustry"})
	public String industryDev(){
		return "devtype/devTypeIndustry";
	}
	/**
	 * 
	 * @return 工业设备界面
	 */
	@RequestMapping(value={"/devTypeIndustry/list"})
	@ResponseBody
	public String listIndustryDev(HttpSession session){
		List<TDevtype> rs = devTypeService.getAllDevTypes("industry");
		R r = new R();
		r.setData(rs);
		r.setCode(0);
		return r.toJson();
	}
	@RequestMapping(value={"/devTypeDetail"})
	public String devTypeDetail(int id,Model m){
		System.out.println("当前设备ID:"+id);
		TDevtype dev = devTypeService.findDevTypeById(id);
		Integer dwgId = dev.getTDwgid();
		if(dwgId!=null&&dwgId!=0){
			TFile file = fileService.findFileById(dwgId);
			m.addAttribute("dwgId", file.getTAddr());
			m.addAttribute("dwgName", file.getTName());
			
		}
		Integer instructionId = dev.getTInstructionid();
		if(instructionId!=null&&instructionId!=0){
			TFile file = fileService.findFileById(instructionId);
			m.addAttribute("instructionId", file.getTAddr());
			m.addAttribute("instructionName", file.getTName());
		}
		Integer modelId = dev.getTModelid();
		if(modelId!=null&&modelId!=0){
			TFile file = fileService.findFileById(modelId);
			m.addAttribute("modelId", file.getTAddr());
			m.addAttribute("modelName", file.getTName());
		}
		return "devtype/devTypeDetail";
	}
	@RequestMapping(value={"/showModel"})
	public String showModel(String model,Model m){
		m.addAttribute("modelpath", model);
		return "devtype/devTypeModelView";
	}
	//devTypeAddDev
	@RequestMapping(value={"/devTypeAddDev"})
	public String devTypeAddDev(String type,Model m){
		m.addAttribute("type", type);
		return "devtype/devTypeAddDev";
	}
	@RequestMapping(value={"/devTypeEditDev"})
	public String devTypeEditDev(Model m){
		return "devtype/devTypeEditDev";
	}
	
	
	
}
