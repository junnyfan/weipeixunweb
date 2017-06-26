package com.doggadata.teach.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dt.dtpt.mybatis.model.publicwx.WxUserPublic;
import com.dt.dtpt.mybatis.model.sijiao.EduStudent;
import com.doggadata.teach.pojo.EduCourse;
import com.doggadata.teach.pojo.PublicWx;
import com.doggadata.teach.pojo.WxPaySendData;
import com.doggadata.teach.utils.JsonDateValueProcessor;
import com.doggadata.teach.utils.PropertyUtils;
import com.doggadata.teach.utils.UrlUtil;
import com.doggadata.teach.utils.UrlUtil.HttpRequestData;
import com.doggadata.teach.utils.YiXinUtil;

public class WXinterfaceService {
	private final static Logger logger = LoggerFactory.getLogger(WXinterfaceService.class);

	/**
	 * 是否为管理员
	 * 
	 * @param shId 管理员用户编号，不能为空
	 * @param openId 当前操作用户微信OPENID，不能为空
	 * @return 是返回对象的success属性为true，否则为false public Result isWxManerger(String shId,String userOpenID);
	 */
	public static String isWxManerger(String shId,String openId){
		//绑定	
		String url= PropertyUtils.getWebServiceProperty("user.exits");
		url=url.replace("openId", openId);
		url=url.replace("shId", shId);
		HttpRequestData data = UrlUtil.sendGet(url);
		String json=data.getResult();
		JSONObject obj = JSONObject.fromObject(json);
		String state =obj.get("success").toString();
		
		logger.info("---is manager json-isWxManerger(inteface:-user.exits):"+json);
		return state;
	}
	public static String addCourseByWx(String shId,String openId,EduCourse course){
		//绑定	
		String url= PropertyUtils.getWebServiceProperty("course.fb");
		url=url.replace("openId", openId);
		url=url.replace("shId", shId);
		url=url.replace("eduCourse", JSONObject.fromObject(course)+"");
		HttpRequestData data = UrlUtil.sendGet(url);
		String json=data.getResult();
		logger.info("---addCourseByWx course fb json(inteface:-course.fb):"+json);
		
		return json;
	}
	
	/**
	 * 我的课程
	 * @param shId
	 * @param openId
	 * @return
	 */
	public static Map<String, Object> findMineCourses(String shId,String openId) {
		String url = PropertyUtils.getWebServiceProperty("user.min.course.list");
		url=url.replace("shId", shId).replace("userOpenID", openId);
		String json = "";
		try {
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		logger.info("---findMineCourse mine course url(indeface:user.min.course.list)"+url);
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);
		List<Map> listMap=new ArrayList<Map>();
		if(state==true){
			JSONArray users=obj.getJSONArray("result");
			int len=users.size();
			for(int i=0;i<len;i++){
				Map m=new HashMap<String, Object>();
				JSONObject user=(JSONObject)users.get(i);
				JSONObject course=user.getJSONObject("eduCourse");
				JSONObject edcourse=user.getJSONObject("eduCourseStudent");
				JsonToHashMap(course,m);
				JsonToHashMap(edcourse,m);
				listMap.add(m);
			}
			if(listMap!=null && listMap.size()!=0){
				result.put("data", listMap);
				result.put("times", listMap.get(0).get("editDate")+"-"+listMap.get(len-1).get("editDate"));
				result.put("sizes", len);
			}
		}else{
			result.put("sizes", "0");
		}
		
		return result;

	}
	/**
	 * 我的课程历程
	 * @param shId
	 * @param openId
	 * @return
	 */
	public static Map<String, Object> findMineCoursesProcess(String shId,String openId) {
		String url = PropertyUtils.getWebServiceProperty("user.min.course.process");
		url=url.replace("shId", shId).replace("userOpenID", openId);
		String json = "";
		try {
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		logger.info("---findMineCoursesProcess mine course process url(indeface:user.min.course.process)"+url);
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);
		List<Map> listMap=new ArrayList<Map>();
		if(state==true){
			JSONArray users=obj.getJSONArray("result");
			int len=users.size();
			for(int i=0;i<len;i++){
				Map m=new HashMap<String, Object>();
				JSONObject user=(JSONObject)users.get(i);
				JSONObject course=user.getJSONObject("eduCourse");
				JSONObject edcourse=user.getJSONObject("eduCourseStudent");
				JsonToHashMap(course,m);
				JsonToHashMap(edcourse,m);
				listMap.add(m);
			}
			if(listMap!=null && listMap.size()!=0){
				result.put("data", listMap);
				result.put("times", listMap.get(0).get("editDate")+"-"+listMap.get(len-1).get("editDate"));
				result.put("sizes", len);
			}else{
				result.put("data", new ArrayList<Map>());
				result.put("times", "暂无数据");
				result.put("sizes", 0);
			}
		}
		
		return result;

	}
	/**
	 * 用户获取课程列表
	 * 
	 * @param shId 管理员用户编号，不能为空
	 * @param eduCourse 精准匹配的课程条件对象
	 * @param pageNumber  页码，不能为空
	 * @param pageSize  每页数据行数，不能为空
	 * @return 返回对象的success为true时，result属性为List<EduCourse>
	 * @GET
	 * @Path("/findWxCourses/{shId /{pageNumber}/{pageSize}")
	 */
	public static Map<String, Object> findWxCourses(EduCourse eduCourse,String shId,String pageNumber,String pageSize) {
		String url = PropertyUtils.getWebServiceProperty("course.list");
		url=url.replace("shId", shId).replace("pageNuber", pageNumber).replace("pageSize", pageSize);
		
		JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		String json = "";
		try {
				
			String params=eduCourse==null?"{}":JSONObject.fromObject(eduCourse,jsonConfig).toString();
			json = UrlUtil.httUrl(url, params);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			logger.error(e.getMessage());
		}
		logger.info("---findWxCourses  course list url(indeface:course.list)"+url);
		System.out.println("---findWxCourses  course list url(indeface:course.list)"+url);
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);
		List<Map> listMap=new ArrayList<Map>();
		if(state==true){
			JSONArray users=obj.getJSONArray("result");
			int len=users.size();
			for(int i=0;i<len;i++){
				Map m=new HashMap<String, Object>();
				JSONObject user=(JSONObject)users.get(i);
				JsonToHashMap(user,m);
				listMap.add(m);
			}
			
			result.put("data", listMap);
		}
		result.put("size", listMap.size());
		return result;

	}
	 public static void JsonToHashMap(JSONObject jsonData, Map<String, Object> rstList) {  
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 SimpleDateFormat sdfs=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        try {  
	            for (Iterator<String> keyStr = jsonData.keys(); keyStr.hasNext();) {  
	  
	                String key1 = keyStr.next().trim();
	                String value=jsonData.get(key1)+"";
	                value=value.equals("null")?"":value;	
	                if(key1.equals("startDate") || key1.equals("endDate") || key1.equals("editDate") ||key1.equals("payDate")){
	                	if(key1.equals("payDate") && StringUtils.isNotBlank(value))
	                		value=sdfs.format(new Date(jsonData.getLong(key1)));
	                	else if(StringUtils.isNotBlank(value))
	                		value=sdf.format(new Date(jsonData.getLong(key1)));
	                }
	                if(!value.equals("null") && !value.equals(""))
	                	rstList.put(key1, value.equals("{}")?"":value);
	            }  
	  
	        } catch (JSONException e) {  
	            e.printStackTrace();  
	        }  
	  
	    }  

	/**
	 * 新增课程
	 * @param shId 管理员用户编号，不能为空
	 * @param openId 当前操作用户微信OPENID，不能为空
	 * @param course  需要添加的课程信息：课程名称、课程类型、老师姓名、学年、学期、开始日期、结束日期、上课时间、上课地点、节数、限制人数、 课程内容
	 * @return 返回对象的success属性为true是，操作成功；否则操作失败
	 * String shId, String userOpenID, 
	 */
	public static Map<String, Object> addCourseByWx(EduCourse course,String openId,String shId) {
		String url = PropertyUtils.getWebServiceProperty("course.fb");
		url=url.replace("shId", shId).replace("openId", openId);
		String json = "";
		JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		try {
			JSONObject jo = JSONObject.fromObject(course,jsonConfig);
			String params=jo.toString();
			logger.info("---addCourseByWx  add course info(indeface:course.fb)"+url+"--param:"+params);
			json = UrlUtil.httUrl(url, params);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		Map<String, Object> result = new HashMap<String, Object>();

		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);

		return result;
	}
	
	/**
	 * 根据openId查询用户信息
	 * @param openId
	 * @return
	 */
	public static Map<String, Object> findStudentByOpenId(String openId) {
		String url = PropertyUtils.getWebServiceProperty("user.find");
		url=url.replace("openId", openId);
		String json = "";
		try {
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
			logger.info("---findStudentByOpenId  find student info by openId(user.find)"+url);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);
		if(state==true){
			JSONArray users=obj.getJSONArray("result");
			int len=users.size();
			if(len>0){
				JSONObject user=(JSONObject)users.get(0);
				String userId=user.getString("studentId");
				result.put("studentId", userId);
				result.put("studentName", user.getString("studentName"));
			}else
				result.put("studentId", "");
		}
		return result;
	}
	
	/**
	 * 根据studentId查询用户信息详细信息
	 * @param studentId
	 * @return
	 */
	public static Map<String, Object> findStudentByStudentId(String studentId) {
		String url = PropertyUtils.getWebServiceProperty("user.get");
		url=url.replace("studentId", studentId);
		String json = "";
		
		try {
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
			logger.info("---findStudentByStudentId  find student info by studentId(user.get)"+url);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);
		if(state==true){
			JSONArray users=obj.getJSONArray("result");
			int len=users.size();
			if(len>0){
				JSONObject user=(JSONObject)users.get(0);
				String userId=user.getString("studentName");
				result.put("studentName", userId);
			}else
				result.put("studentName", "");
		}
		return result;
	}
	
	

	/**
	 * 添加学员
	 * @param shId  管理员用户编号，不能为空
	 * @param openId  当前操作用户微信OPENID，不能为空
	 * @param eduStudent  需要添加的学员信息：姓名、手机、住址、出生年月、性别、学年级
	 * @return 返回对象的success属性值为true时，添加成功，result值为EduStudent对象；否则添加失败
	 * String shId, String userOpenID,
	 */
	public static Map<String, Object> addStudentByWx(EduStudent eduStudent,String openId,String shId) {
		String url = PropertyUtils.getWebServiceProperty("user.add");
		url=url.replace("shId", shId).replace("openId", openId);
		String json = "";
		String app = PropertyUtils.getWebServiceProperty("app");
		JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		try {
			JSONObject jo = JSONObject.fromObject(eduStudent,jsonConfig);
			String params=jo.toString();
			json = UrlUtil.httUrl(url, params);
			logger.info("---addStudentByWx  add user info(user.add)"+url);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			System.out.println(e.getMessage());
		}
		Map<String, Object> result = new HashMap<String, Object>();

		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);
		
		if (state) {
			JSONObject reObj = JSONObject.fromObject(obj.get("result"));
			result.put("userId", reObj.get("studentId"));
		}

		return result;
	}
	/**
	 * 关注接口
	 * @param wxuser
	 * @param shId
	 * @return
	 */
	public static Map<String, Object> attentionUser(WxUserPublic wxuser,String shId) {
		String url = PropertyUtils.getWebServiceProperty("user.attention");
		url=url.replace("shId", shId);
		String json = "";
		JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		try {
				JSONObject jo = JSONObject.fromObject(wxuser,jsonConfig);
				String params=jo.toString();
				logger.info("---addStudentByWx  add user info(user.add)"+url);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		System.out.println("---------attention------------------关注接口"+json);
		Map<String, Object> result = new HashMap<String, Object>();

		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		result.put("reason", obj.get("reason"));
		result.put("title", obj.get("title"));
		return result;
	}
	
	/**
	 * 学员添加课程
	 * 
	 * @param openId  当前操作用户微信OPENID，不能为空
	 * @param courseId    需要添加的课程编号，不能为空
	 * @return 返回对象的success属性值为true时，添加成功；否则添加失败
	 * String userOpenID, String courseId
	 */
	public static Map<String, Object> addCourseByWx(String openId,String courseId) {
		String url = PropertyUtils.getWebServiceProperty("course.add.user");
		url=url.replace("openId", openId).replace("courseId", courseId);
		String json = "";
		String app = PropertyUtils.getWebServiceProperty("app");
		try {
			if (app.equals("true")) {
				HttpRequestData data = UrlUtil.sendPost(url, "", "");
				json = data.getResult();
			} else
				json = "{\"success\":true,\"title\":\"操作成功\",\"reason\":\"操作成功\",\"result\":{studentId:0bd22f1f-2aee-4e74-8ee0-144ffedd3822}}";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		System.out.println("-----------addCourseByWx----------------url:"+url);
		System.out.println("-----------addCourseByWx----------------json:"+json);
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);
		result.put("courseSid", obj.get("result"));
		
		return result;
	}
//判断是否在支付范围内
	public static Map<String,Object> isZhifuOut(String courseSid,String orderId){
		
		String url = PropertyUtils.getWebServiceProperty("course.isout");
		url=url.replace("courseSid", courseSid).replace("payId", orderId);
		String json = "";
		String app = PropertyUtils.getWebServiceProperty("app");
		try {
			if (app.equals("true")) {
				HttpRequestData data = UrlUtil.sendGet(url);
				json = data.getResult();
			} else
				json = "{\"success\":true,\"title\":\"操作成功\",\"reason\":\"操作成功\",\"result\":{studentId:0bd22f1f-2aee-4e74-8ee0-144ffedd3822}}";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		System.out.println("-----------isZhifuOut----------------url:"+url);
		System.out.println("-----------isZhifuOut----------------json:"+json);
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);

		return result;
	}
	/**
	 * 预付款确认课程详细信息
	 * 
	 * @param courseId   课程编号，不能为空
	 * @return 返回对象的success属性值为true时，result属性为EduCourse
	 */
	public static Map<String, Object> getCourse(String courseId) {
		String url = PropertyUtils.getWebServiceProperty("course.get");
		url=url.replace("courseId", courseId);
		String json = "";
		String app = PropertyUtils.getWebServiceProperty("app");
		try {
			if (app.equals("true")) {
				HttpRequestData data = UrlUtil.sendGet(url);
				json = data.getResult();
			} else
				json = "{\"success\":true,\"title\":\"操作成功\",\"reason\":\"操作成功\",\"result\":{studentId:0bd22f1f-2aee-4e74-8ee0-144ffedd3822}}";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		System.out.println("-----------getCourse----------------url:"+url);
		System.out.println("-----------getCourse----------------json:"+json);
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);

		if (state) {
			JSONObject reObj = JSONObject.fromObject(obj.get("result"));
			
			Map m=new HashMap<String, Object>();
			
			
			JsonToHashMap(reObj,m);
			result.put("data", m);
		}
		
		return result;
	}

	/**
	 * 预付款确认学员信息
	 * 
	 * @param studentId   学员编号，不能为空
	 * @return 返回对象的success属性值为true时，result属性为EduStudent
	 */
	public static Map<String, Object> geStudent(String studentId) {
		String url = PropertyUtils.getWebServiceProperty("sijiao.getCourse");
		String json = "";
		String app = PropertyUtils.getWebServiceProperty("app");
		try {
			if (app.equals("true")) {
				HttpRequestData data = UrlUtil.sendGet(url);
				json = data.getResult();
			} else
				json = "{\"success\":true,\"title\":\"操作成功\",\"reason\":\"操作成功\",\"result\":{studentId:0bd22f1f-2aee-4e74-8ee0-144ffedd3822}}";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		result.put("reason", obj.get("reason"));
		result.put("title", obj.get("title"));

		System.out.println("预付款确认学员信息:"+result.get("state").toString() 
				+ result.get("reason").toString() + result.get("title").toString());
		
		return result;
	}

	/**
	 * 课程付款完成
	 * 
	 * @param courseId 学员选课编号(订单编号)，不能为空
	 * @param payJe 实际付款金额
	 * @return 返回对象的success属性值为true时，操作成功；否则操作失败
	 */
	public static Map<String, Object> payOk(String courseId, String payJe) {
		String url = PropertyUtils.getWebServiceProperty("user.payOk");
		url=url.replace("courseSid", courseId);
		String json = "";
		JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		String app = PropertyUtils.getWebServiceProperty("app");
		List pa=new ArrayList();
		pa.add(payJe);
		try {
			if (app.equals("true")) {
				//JSONObject jo = JSONObject.fromObject("{"+payJe+"}",jsonConfig);
				JSONObject jObject = new JSONObject();
		    	jObject.put("payJe", payJe);
		    	String params=payJe;
		    	System.out.println(jObject.toString());
				System.out.println("---------------------------url:"+url);
				System.out.println("---------------------------param:"+params);
				json = UrlUtil.httUrl(url, params);
					
			} else
				json = "{\"success\":true,\"title\":\"操作成功\",\"reason\":\"操作成功\",\"result\":{studentId:0bd22f1f-2aee-4e74-8ee0-144ffedd3822}}";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		System.out.println("-----------payOk----------------url:"+url);
		System.out.println("-----------payOk----------------json:"+json);
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);
		
		return result;
	}
	
	public static Map<String, Object> findStId(String shId,String courseSId) {
		String url = PropertyUtils.getWebServiceProperty("course.min.list");
		url=url.replace("courseSid", courseSId).replace("shId", shId);
		String json = "";
		try {
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
					
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		System.out.println("-----------findStId----------------url:"+url);
		System.out.println("-----------findStId----------------json:"+json);
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(json);
		boolean state = Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		String reason=obj.getString("reason");
		String title=obj.getString("title");
		if(!reason.equals("null"))
			result.put("reason", reason);
		if(!title.equals("null"))
			result.put("title", title);
		if(state){
			JSONObject user=obj.getJSONObject("result");
				JSONObject course=user.getJSONObject("eduCourse");
				JSONObject edcourse=user.getJSONObject("eduCourseStudent");
				JsonToHashMap(course,result);
				JsonToHashMap(edcourse,result);
		}
		return result;
	}
	
	
	
	public static void wxPay(int fee,String openId,String ip,String name){
		String shAppId=PropertyUtils.getWebServiceProperty("appid");
		String mchid=PropertyUtils.getWebServiceProperty("WxPayConfig.MCHID");
		String notifyurl=PropertyUtils.getWebServiceProperty("WxPayConfig.NOTIFY_URL");
		String device=PropertyUtils.getWebServiceProperty("WxPayConfig.DEVICE");
		String key=PropertyUtils.getWebServiceProperty("WxPayConfig.KEY");
				
		WxPaySendData data = new WxPaySendData();
        data.setAppid(shAppId);
        data.setAttach("微信支付");
        data.setBody(name);
        data.setMch_id(mchid); //微信支付分配的商户号
        data.setNonce_str(WxSign.getNonceStr());//随机字符串，不长于32位。推荐随机数生成算法s
        data.setNotify_url(notifyurl);//接收微信支付异步通知回调地址，通知url必须为直接可访问的url，不能携带参数。
        //data.setOut_trade_no(""); //商户系统内部的订单号,32个字符内、可包含字母, 其他说明见商户订单号
        data.setTotal_fee((int)(fee*100));//订单总金额，单位为分，详见支付金额
        data.setTrade_type("JSAPI");
        data.setSpbill_create_ip(ip);//APP和网页支付提交用户端ip，Native支付填调用微信支付API的机器IP
        data.setOpenid(openId);
        data.setDevice_info(device);//终端设备号(门店号或收银设备ID)，注意：PC网页或公众号内支付请传"WEB"
        String returnXml = UnifiedorderService.unifiedOrder(data,key);
        System.out.println("-----------------------------UnifiedorderService.unifiedOrder------------------------------");
        System.out.println(returnXml);
        
        SortedMap<String, String> finalpackage = new TreeMap<String, String>();
		
	}
	
	//支付统一订单
	public static Map<String,String> zhifu(String openId,String courseSid,String userId,String courseName,String ip){
		Map<String,String> map=new HashMap<String, String>();
		String shAppId=PropertyUtils.getWebServiceProperty("appid");
		String mchid=PropertyUtils.getWebServiceProperty("WxPayConfig.MCHID");
		String notifyurl=PropertyUtils.getWebServiceProperty("WxPayConfig.NOTIFY_URL");
		String device=PropertyUtils.getWebServiceProperty("WxPayConfig.DEVICE");
		String key=PropertyUtils.getWebServiceProperty("WxPayConfig.KEY");
		String appSecret=PropertyUtils.getWebServiceProperty("appSecret");
		map.put("appid", shAppId);
		map.put("partner",mchid);
		map.put("appsecret",appSecret);
		map.put("openid",openId);
		map.put("key",key);
		map.put("money", "1");
		map.put("userid", userId);
		map.put("courseid", courseSid);
		map.put("ip", ip);
		map.put("body", courseName);
		return map;
	}
	//交易提示发给管理员，配置文件可配置
	public static void sendMessageToManager(String shId,String userId,String courseName,String jine,String courseSid){
		String sendFalg=PropertyUtils.getWebServiceProperty("sendMessage");
		String openId=PropertyUtils.getWebServiceProperty("managerId");
		String [] openIds=openId.split(",");
		String templateId="AVf9t7mkPGLbxfFBQu7i66Aibqw7nN_UeL-auV0_eGQ";
		if(sendFalg.equals("true")){
			Map map=findStudentByOpenId(userId);
			String title="您的会员"+map.get("studentName")+"购买课程成功付款通知";
			for(String op:openIds){
				YiXinUtil.templateManagerMessage(shId,templateId, op, title, courseName, jine,courseSid);
			}
		}
		
	}
	
	public static String isBuy(String shId,String openId,String courseId) {
		String url = PropertyUtils.getWebServiceProperty("user.isBuy");
		System.out.println(url);
		url=url.replace("courseId", courseId).replace("shId", shId).replace("userOpenID",openId);
		String json = "";
		try {
			System.out.println(courseId+";"+shId+";"+openId);
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
					System.out.println(json);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return json;
	}
	
	public static List<Map> getOrderList(String shId,String userOpenID,String courseId){
		Map<String,Object> result=new HashMap<String,Object>();
		String url = PropertyUtils.getWebServiceProperty("course.getOrderInfo");
		url=url.replace("courseId", courseId).replace("shId", shId).replace("userOpenID",userOpenID);
		String json = "";
		List<Map> listMap=new ArrayList<Map>();
		try {
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
			System.out.println("order info message:"+json);
			JSONArray array=JSONArray.fromObject(json);
			int len=array.size();
			for(int i=0;i<len;i++){
				Map m=new HashMap<String, Object>();
				JSONObject user=(JSONObject)array.get(i);
				JsonToHashMap(user,m);
				listMap.add(m);
			}
					
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return listMap;
	}
	public static String getConfirmPay(String courseSid){
		String url = PropertyUtils.getWebServiceProperty("course.confirmPay");
		url=url.replace("courseSid", courseSid);
		String json = "";
		try {
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
			JSONObject obj = JSONObject.fromObject(json);
			json = obj.get("success")+"";
					
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return json;
	}
	public static void sendTkNoticeMessage(String shId,List<Map> dataList,String courseName,String type,String remark){
		//for(Map map:dataList){
		int i=0;
		//for(String id:aa){
		for(Map map:dataList){
			String openId=map.get("studentId")+"";
			String studentName=map.get("studentName")+"";
			/**String openId=id;
			String studentName=name[i];**/
			String title=type.equals("0")?"亲爱的，"+studentName+"，您报名的课程发生变更。":"亲爱的，"+studentName+"，您报名的课程有通知消息，";
			String tName=type.equals("0")?"调课通知":"其他通知";
			YiXinUtil.templateTkNoticeMessage(shId,openId, studentName, title,tName, courseName,remark);
			i++;
		}

	}

	public static PublicWx getShOperation(String shId){
		PublicWx wx=new PublicWx();
		Map<String,Object> map=new HashMap<String,Object>();
		String url = PropertyUtils.getWebServiceProperty("sh.public");
		url=url.replace("shId", shId);
		String json = "";
		try {
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
			JSONObject obj = JSONObject.fromObject(json);
			JsonToHashMap(obj,map);
			wx.setPublicId(map.get("publicId")+"");
			wx.setShId(map.get("userId")+"");
			wx.setPublicName(map.get("publicName")+"");
			wx.setAppId(map.get("appId")+"");
			wx.setAppSecret(map.get("appSecret")+"");
			wx.setWxfwId(map.get("wxfwId")+"");
			wx.setWxToken(map.get("wxToken")+"");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return wx;
	}
	
	public static Map<String,String> getCourseTotal(String shId,String openId){
		String url = PropertyUtils.getWebServiceProperty("course.totals");
		String full=getSeason(new Date());
		String semter=full.split(":")[1];
		String year=full.split(":")[0];
		Map<String,String>  map=new HashMap<String,String>();
		url=url.replace("shId", shId).replace("openId", openId).replace("year", year).replace("semter", semter);
		
		String json = "";
		try {
			HttpRequestData data = UrlUtil.sendGet(url);
			json = data.getResult();
			JSONArray array=JSONArray.fromObject(json);
			JSONObject obj = array.getJSONObject(0);
			map.put("year",obj.get("year")+"");
			map.put("semester",obj.get("semester")+"");
			map.put("order_students",obj.get("order_students")+"");
			map.put("wx_payed_students",obj.get("wx_payed_students")+"");
			map.put("xj_payed_students",obj.get("xj_payed_students")+"");
			map.put("payed_je",obj.get("payed_je")+"");
			map.put("wx_payed_je",obj.get("wx_payed_je")+"");
			map.put("xj_payed_je",obj.get("xj_payed_je")+"");
			
					
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return map;
	}
	public static String getSeason(Date date) {  
		  
        int season = 0;  
  
        Calendar c = Calendar.getInstance();  
        c.setTime(date);  
        int year=c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);  
        switch (month) {  
        
        case Calendar.FEBRUARY:  
        case Calendar.MARCH:  
        case Calendar.APRIL:  
        case Calendar.MAY:  
        case Calendar.JUNE: 
            season = 1;  
            break;  
        case Calendar.AUGUST:  
        case Calendar.SEPTEMBER:  
            season = 2;  
            break;  
        case Calendar.JULY:  
        
        case Calendar.OCTOBER:  
        case Calendar.NOVEMBER:
            season = 3;  
            break;  
          
        case Calendar.DECEMBER: 
        case Calendar.JANUARY:  
            season =4;  
            break;  
        default:  
            break;  
        }  
        return year+":"+season;  
    }
	


}
