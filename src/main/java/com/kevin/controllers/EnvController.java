package com.kevin.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.entity.TWeather;
import com.kevin.service.ILogService;

import java.rmi.RemoteException;

import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import cn.com.WebXml.WeatherWebServiceLocator;

import cn.com.WebXml.WeatherWebServiceSoap;

@Controller
public class EnvController {

	@Autowired
	private ILogService logService;
	@RequestMapping(value="/envInfo")
	public String envInfo(HttpSession session){
		return "envInfo";
	}
	@RequestMapping(value="/getWeatherMsg")
	@ResponseBody
	public TWeather getWeatherMsg(String city) throws ServiceException, RemoteException{
		WeatherWebServiceLocator weatherWebServiceLocator=new WeatherWebServiceLocator();
		WeatherWebServiceSoap weatherWebServiceSoap=weatherWebServiceLocator.getWeatherWebServiceSoap();
		String[] rs = weatherWebServiceSoap.getWeatherbyCityName(city);
		TWeather we = new TWeather();
		we.setCondition(rs[6]);
		we.setUpdateTime(rs[4]);
		we.setLifeCondition(rs[11]);
		we.setTemperature(rs[5]);
		we.setWindDirectionAndSize(rs[7]);
		we.setRealCondition(rs[10]);
		return we;
	}
}
