package com.doggadata.teach.service;

import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.SortedMap;

import com.dt.dtpt.util.MD5Util;

/**
 * 支付签名
 * @author chend
 *
 */
public class WxSign {
	
	
	
	private static String characterEncoding = "UTF-8";
	  
	  @SuppressWarnings("rawtypes")
	  public static String createSign(SortedMap<Object,Object> parameters,String key){ 
	    StringBuffer sb = new StringBuffer(); 
	    Set es = parameters.entrySet();//所有参与传参的参数按照accsii排序（升序） 
	    Iterator it = es.iterator(); 
	    while(it.hasNext()) { 
	      Map.Entry entry = (Map.Entry)it.next(); 
	      String k = (String)entry.getKey(); 
	      Object v = entry.getValue(); 
	      if(null != v && !"".equals(v)  
	          && !"sign".equals(k) && !"key".equals(k)) { 
	        sb.append(k + "=" + v + "&"); 
	      } 
	    } 
	    sb.append("key=" + key);
	    String sign = MD5Util.MD5Encode(sb.toString(),characterEncoding).toUpperCase();
	   // String sign=sb.toString();
	    return sign; 
	  }
	    
	  public static String getNonceStr() {
	    Random random = new Random();
	    //return String.valueOf(random.nextInt(10000));
	    return MD5Util.MD5Encode(String.valueOf(random.nextInt(10000)),characterEncoding);
	  }
	  
	  public static String getTimeStamp() {
	    return String.valueOf(System.currentTimeMillis() / 1000);
	  }
	  
	  


}
