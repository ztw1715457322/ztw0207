package com.ztw.student.entity;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Student {
	
	private Integer id;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date enterDate ;
	private String name;
	
	private int provinceId;
	private int cityId;
	private int countyId;
	
	// 省
	private Area province;
	//市
	private Area city;
	//县
	private Area county;
	
	// 选修的课程
	private List<Subject> selSubjects; 
	
	
	public List<Subject> getSelSubjects() {
		return selSubjects;
	}
	public void setSelSubjects(List<Subject> selSubjects) {
		this.selSubjects = selSubjects;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getEnterDate() {
		return enterDate;
	}
	public void setEnterDate(Date enterDate) {
		this.enterDate = enterDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public int getCountyId() {
		return countyId;
	}
	public void setCountyId(int countyId) {
		this.countyId = countyId;
	}
	public Area getProvince() {
		return province;
	}
	public void setProvince(Area province) {
		this.province = province;
	}
	public Area getCity() {
		return city;
	}
	public void setCity(Area city) {
		this.city = city;
	}
	public Area getCounty() {
		return county;
	}
	public void setCounty(Area county) {
		this.county = county;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", enterDate=" + enterDate + ", name=" + name + ", provinceId=" + provinceId
				+ ", cityId=" + cityId + ", countyId=" + countyId + ", province=" + province + ", city=" + city
				+ ", county=" + county + ", selSubjects=" + selSubjects + "]";
	}
	
	
	


}
