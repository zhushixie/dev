package com.kevin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HistoryController {
	@RequestMapping(value="/hisMana")
	public String hisMana(){
		return "hisMana";
	}

}
