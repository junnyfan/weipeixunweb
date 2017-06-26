package com.doggadata.teach.pojo;

import java.util.List;

public class CourseDay {
	
	
	private String day;
	private String subjectId;
	private String subjectName;
	private String totalNum;
	private String canBookNum;
	private String totalNumOfam;
	private String canBookNumOfam;
	private String canBookNumOfpm;
	private String totalNumOfpm;
	private List<Course> courseofam;
	private List<Course> courseofpm;
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(String totalNum) {
		this.totalNum = totalNum;
	}
	public String getCanBookNum() {
		return canBookNum;
	}
	public void setCanBookNum(String canBookNum) {
		this.canBookNum = canBookNum;
	}
	public String getTotalNumOfam() {
		return totalNumOfam;
	}
	public void setTotalNumOfam(String totalNumOfam) {
		this.totalNumOfam = totalNumOfam;
	}
	public String getCanBookNumOfam() {
		return canBookNumOfam;
	}
	public void setCanBookNumOfam(String canBookNumOfam) {
		this.canBookNumOfam = canBookNumOfam;
	}
	public String getCanBookNumOfpm() {
		return canBookNumOfpm;
	}
	public void setCanBookNumOfpm(String canBookNumOfpm) {
		this.canBookNumOfpm = canBookNumOfpm;
	}
	public String getTotalNumOfpm() {
		return totalNumOfpm;
	}
	public void setTotalNumOfpm(String totalNumOfpm) {
		this.totalNumOfpm = totalNumOfpm;
	}
	
	public List<Course> getCourseofam() {
		return courseofam;
	}
	public void setCourseofam(List<Course> courseofam) {
		this.courseofam = courseofam;
	}
	public List<Course> getCourseofpm() {
		return courseofpm;
	}
	public void setCourseofpm(List<Course> courseofpm) {
		this.courseofpm = courseofpm;
	}
	
	
	
}
