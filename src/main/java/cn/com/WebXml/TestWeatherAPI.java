package cn.com.WebXml;

 

import java.rmi.RemoteException;

 

import javax.xml.rpc.ServiceException;

 

import cn.com.WebXml.WeatherWebServiceLocator;

import cn.com.WebXml.WeatherWebServiceSoap;

 

public class TestWeatherAPI {

	

	public static void main(String[] args) throws ServiceException ,RemoteException{

		WeatherWebServiceLocator weatherWebServiceLocator=new WeatherWebServiceLocator();

		WeatherWebServiceSoap weatherWebServiceSoap=weatherWebServiceLocator.getWeatherWebServiceSoap();

		String[] weatherInfos=weatherWebServiceSoap.getWeatherbyCityName("深圳");

		int i=0;

		for (String str : weatherInfos) {

			System.out.println(i++ +":"+str);

		}

	}

 

}
