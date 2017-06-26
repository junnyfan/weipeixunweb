package com.doggadata.teach.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doggadata.teach.utils.KanqJson;
import com.doggadata.teach.utils.KanqJsonResult;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.doggadata.teach.utils.json.JSONLinedMap;
import com.doggadata.teach.utils.json.JSONObject;



@Controller
public class KanqActionSupport {
	protected HttpServletRequest request;

	protected HttpServletResponse response;

	protected HttpSession session;

	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request,
			HttpServletResponse response) {

		this.request = request;

		this.response = response;

		this.session = request.getSession();

	}
	
	
	public Set resultName = new HashSet();
	
	
	
	public void setResultName(Set resultName) {
		this.resultName = resultName;
	}


	public void toJSON(String key,Object obj){
		resultName.add(key);
		request.setAttribute(key, obj);
	}
	
	public Object getJSON(String key){
		Object o = request.getAttribute(key);
		return o;
	}
	
	
	public void toJSON(String key,Object obj,boolean order){
		resultName.add(key+"-"+order);
		request.setAttribute(key, obj);
	}
	
	public void returnJson(){
		try {
			
		
		JSONObject  json=new JSONObject();
		JSONLinedMap jsonLined =new JSONLinedMap();
		HttpServletResponse IResponse=response;
		IResponse.setContentType("text/javascript;charset=UTF-8");
		for (Iterator it = resultName.iterator(); it.hasNext();) {
			String key = it.next().toString();
			if(key.endsWith("-true")){
				Object o = request.getAttribute(key.substring(0,key.indexOf("-true")));
				jsonLined.put(key.substring(0,key.indexOf("-true")), o == null ? "" : o);
			}else{
				Object o = request.getAttribute(key);
				json.put(key, o == null ? "" : o);
			}
		}
		String strjson="";
		if(0!=jsonLined.length()){
			strjson=json.toString().substring(0, json.toString().length()-1)+","+jsonLined.toString().substring(1, jsonLined.toString().length());
			//System.out.println(strjson);
			outString(IResponse, strjson == null ? "{}" : strjson);
		}else{
			//System.out.println(json.toString());
			outString(IResponse, json == null ? "{}" : json.toString());
		}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static void outString(HttpServletResponse IResponse, String str) {
		PrintWriter out = null;
		try {
			out = IResponse.getWriter();
			out.write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(out!=null)
				out.close();
				out.flush();
		}
	}
	
	protected void responseJson(HttpServletResponse response, Object data) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.write(KanqJson.stringify(data));
		out.flush();
		out.close();
	}
	
	protected void successJson(HttpServletResponse response, String message, Object data) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		KanqJsonResult result = new KanqJsonResult(true, message, data);
		PrintWriter out = response.getWriter();
		out.write(KanqJson.stringify(result));
		out.flush();
		out.close();
	}
	
	protected void successJson(HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		KanqJsonResult result = new KanqJsonResult(true);
		PrintWriter out = response.getWriter();
		out.write(KanqJson.stringify(result));
		out.flush();
		out.close();
	}
	
	protected void successJson(HttpServletResponse response, Object data) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		KanqJsonResult result = new KanqJsonResult(true, data);
		PrintWriter out = response.getWriter();
		out.write(KanqJson.stringify(result));
		out.flush();
		out.close();
	}
	
	protected void errorJson(HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		KanqJsonResult result = new KanqJsonResult(false);
		PrintWriter out = response.getWriter();
		out.write(KanqJson.stringify(result));
		out.flush();
		out.close();
	}
	
	protected void errorJson(HttpServletResponse response, String message) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		KanqJsonResult result = new KanqJsonResult(false, message);
		PrintWriter out = response.getWriter();
		out.write(KanqJson.stringify(result));
		out.flush();
		out.close();
	}
	
	protected void errorJson(HttpServletResponse response, String message, Object data) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		KanqJsonResult result = new KanqJsonResult(false, message, data);
		PrintWriter out = response.getWriter();
		out.write(KanqJson.stringify(result));
		out.flush();
		out.close();
	}
}
