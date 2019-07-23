package com.kevin.controllers.fix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class FixDirectorController {
	@RequestMapping(value="/directorFixTasks")
	public String directorFixTasks(){
		return "directorFixTasks";
	}
	
	@RequestMapping(value="/directorFixTaskRecords")
	public String directorFixTaskRecords(){
		return "directorFixTaskRecords";
	}
	
	@RequestMapping(value="/directorFixAssignTask")
	public String directorFixAssignTask(){
		return "directorFixAssignTask";
	}
	
}
