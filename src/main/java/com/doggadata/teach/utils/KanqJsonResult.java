package com.doggadata.teach.utils;

public class KanqJsonResult {
	private boolean success;
	private String message;
	private Object data;
	
	public KanqJsonResult(){
	}
	
	public KanqJsonResult(boolean success){
		this.success = success;
	}
	
	public KanqJsonResult(boolean success, String message){
		this.success = success;
		this.message = message;
	}
	
	public KanqJsonResult(boolean success, Object data){
		this.data = data;
		this.success = success;
	}
	
	public KanqJsonResult(boolean success, String message, Object data){
		this.data = data;
		this.message = message;
		this.success = success;
	}
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
}
