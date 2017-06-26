package com.doggadata.teach.jssigin;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.http.HttpRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.doggadata.teach.pay.util.GetWxOrderno;
import com.doggadata.teach.pay.util.RequestHandler;
import com.doggadata.teach.pay.util.Sha1Util;
import com.doggadata.teach.pay.util.TenpayUtil;
import com.doggadata.teach.utils.YiXinUtil;

import net.sf.json.JSONObject;
/**
 * 微信支付jsapi认证入口
 * @author chend
 *
 */
public class jsapiWx extends HttpServlet {
	private static Logger log=LoggerFactory.getLogger(jsapiWx.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				request.setCharacterEncoding("GBK");
				response.setCharacterEncoding("GBK");
				response.setContentType("text/html;charset=GBK");
				String openId=request.getParameter("openId")+"";
				String shId=request.getParameter("shId")+"";
				//商户订单号
				String url=request.getParameter("url");
				
				String currTime = TenpayUtil.getCurrTime();
				//8位日期
				String strTime = currTime.substring(8, currTime.length());
				//四位随机数
				String strRandom = TenpayUtil.buildRandom(4) + "";
				//10位序列号,可以自行调整。
				String strReq = strTime + strRandom;
				//随机数 
				String nonce_str = strReq;
				String timestamp = Sha1Util.getTimeStamp();
				//商品描述		
				String trade_type = "JSAPI";
				String jsapi=YiXinUtil.getJsapiCode(shId);
				RequestHandler reqHandler = new RequestHandler(request, response);
				SortedMap<String, String> packageParams = new TreeMap<String, String>();
				packageParams.put("jsapi_ticket", jsapi);  
				packageParams.put("timestamp", timestamp);  
				packageParams.put("noncestr", nonce_str);  
				packageParams.put("url", url);  
				 
					
				String sign = reqHandler.createSign(packageParams);
					System.out.println("sign:"+sign);
					System.out.println("timestamp:"+timestamp);
					System.out.println("noncestr:"+nonce_str);
			response.sendRedirect(url+"?timeStamp="+timestamp+"&nonceStr="+nonce_str+"&sign="+sign);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		doGet(request, response);
	}

}
