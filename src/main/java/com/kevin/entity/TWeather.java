package com.kevin.entity;

public class TWeather{
	private String updateTime;
	private String condition;
	private String temperature;
	private String windDirectionAndSize;
	private String realCondition;
	private String lifeCondition;
	public TWeather() {
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getWindDirectionAndSize() {
		return windDirectionAndSize;
	}
	public void setWindDirectionAndSize(String windDirectionAndSize) {
		this.windDirectionAndSize = windDirectionAndSize;
	}
	public String getRealCondition() {
		return realCondition;
	}
	public void setRealCondition(String realCondition) {
		this.realCondition = realCondition;
	}
	public String getLifeCondition() {
		return lifeCondition;
	}
	public void setLifeCondition(String lifeCondition) {
		this.lifeCondition = lifeCondition;
	}
	
}