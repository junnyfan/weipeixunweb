package com.doggadata.teach.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.CookieStore;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.HttpClientParams;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 模拟请求工具类
 * 
 * @author zhangy
 * 
 */
public class UrlUtil {
	private static Logger logger = LoggerFactory.getLogger(UrlUtil.class);
	private static int connectCount=0;
	/**
	 * 向指定URL发送GET方法的请求
	 * 
	 * @param url
	 *            发送请求的URL
	 * @param params
	 *            请求参数，请求参数应该是name1=value1&name2=value2的形式。
	 * @return URL所代表远程资源的响应
	 */
	public static HttpRequestData sendGet(String url) {
		HttpRequestData data = null;
		String result = "";
		BufferedReader in = null;
		try {
			// URL realUrl = new URL(params == null ? url : url + "?" +
			// URLEncoder.encode(params, "UTF-8"));
			URL realUrl = new URL(url);
			System.out.println("sendGet.url=" + realUrl.toString());
			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();
			// 设置通用的请求属性
			conn.setRequestProperty("accept", "*/*");
			conn.setRequestProperty("Connection", "Keep-Alive");
			conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)");

			// 建立实际的连接
			conn.connect();

			// 定义BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}

			data = new HttpRequestData();
			data.setHead(conn.getHeaderFields());
			data.setResult(result);
		} catch (Exception e) {
			System.out.println("发送GET请求出现异常！" + e);
			e.printStackTrace();
		}
		// 使用finally块来关闭输入流
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return data;
	}

	/**
	 * 向指定URL发送POST方法的请求
	 * 
	 * @param url
	 *            发送请求的URL
	 * @param params
	 *            请求参数，请求参数应该是name1=value1&name2=value2的形式。
	 * @return URL所代表远程资源的响应
	 */
	public static HttpRequestData sendPost(String url, String jsession, String params) {
		logger.debug("url=" + url);
		logger.debug("jsession=" + jsession);
		logger.debug("params=" + params);
		HttpRequestData data = null;
		PrintWriter out = null;
		BufferedReader br = null;
		InputStream in = null;
		InputStreamReader inr = null;
		String result = "";
		try {
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();
			// 设置通用的请求属性
			conn.setRequestProperty("accept", "*/*");
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("Connection", "Keep-Alive");
			conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)");
			if (StringUtils.isNotBlank(jsession)) {
				
				conn.setRequestProperty("Cookie", "JSESSIONID="+jsession);
			}

			// 发送POST请求必须设置如下两行
			conn.setDoOutput(true);
			conn.setDoInput(true);
			// 获取URLConnection对象对应的输出流
			out = new PrintWriter(conn.getOutputStream());
			// 发送请求参数
			// if (params != null) {
			// System.out.println("params=" + params);
			 params = URLEncoder.encode(params, "UTF-8");
			out.print(params);
			// System.out.println("encode|params=" + params);
			// }
			// flush输出流的缓冲
			out.flush();

			// 定义BufferedReader输入流来读取URL的响应
			in = conn.getInputStream();
			inr = new InputStreamReader(in,"UTF-8");
			br = new BufferedReader(inr);
			String line;
			while ((line = br.readLine()) != null) {
				result += "\n" + line;
			}

			data = new HttpRequestData();
			data.setHead(conn.getHeaderFields());
			data.setResult(result);
		} catch (Exception e) {
			logger.info("发送POST请求异常"+e);
			System.out.println("发送POST请求出现异常！" + e);
			e.printStackTrace();
			
		}
		// 使用finally块来关闭输出流、输入流
		finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return data;
	}
	
	
	public static HttpRequestData sendPostEn(String url, String jsession, String param) {
		logger.debug("url=" + url);
		logger.debug("jsession=" + jsession);
		//logger.debug("params=" + params);
		HttpRequestData data = null;
		String result = "";
	
		//params.add(new BasicNameValuePair("JSESSIONID", jsession));  
		CookieStore cookieStore = new BasicCookieStore(); 
		BasicClientCookie cookie = new BasicClientCookie("JSESSIONID", jsession);

		
		try {
			HttpParams  httpParams = new BasicHttpParams();  
	        // 设置连接超时和 Socket 超时，以及 Socket 缓存大小  
	        HttpConnectionParams.setConnectionTimeout(httpParams, 20 * 1000);  
	        HttpConnectionParams.setSoTimeout(httpParams, 20 * 1000);  
	        HttpConnectionParams.setSocketBufferSize(httpParams, 8192);  
	        // 设置重定向，缺省为 true  
	        HttpClientParams.setRedirecting(httpParams, true);  
	        // 设置 user agent  
	        String userAgent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2) Gecko/20100115 Firefox/3.6";  
	        HttpProtocolParams.setUserAgent(httpParams, userAgent);  
	        // 创建一个 HttpClient 实例  
	        // 注意 HttpClient httpClient = new HttpClient(); 是Commons HttpClient  
	        // 中的用法，在 Android 1.5 中我们需要使用 Apache 的缺省实现 DefaultHttpClient  
	        HttpClient httpClient = new DefaultHttpClient(httpParams);  
	        cookieStore.addCookie(cookie); 
	        //httpClient.setCookieStore(cookieStore); 
			HttpPost postMethod = new HttpPost(url); 
			
			postMethod.setHeader("Cookie" , "JSESSIONID="+jsession);
		   // postMethod.setEntity(new UrlEncodedFormEntity(params, "utf-8")); //将参数填入POST Entity中  
		    postMethod.setEntity(new StringEntity(param, Charset.forName("UTF-8")));                
		    HttpResponse response = httpClient.execute(postMethod); //执行POST方法  

			

			
			data = new HttpRequestData();
			//data.setHead(response.ge);
			data.setResult(EntityUtils.toString(response.getEntity(), "utf-8"));
		} catch (Exception e) {
			connectCount++;
			logger.info("发送POST请求异常"+e);
			System.out.println("发送POST请求出现异常！" + e);
			e.printStackTrace();
			//if(connectCount<=2)
			//	sendPost(url, jsession, params,timeOut);
			
		}
		
		return data;
	}
	
	
	public static HttpRequestData sendPost1(String url, String jsession, String param,int timeOut) {
		logger.debug("url=" + url);
		logger.debug("jsession=" + jsession);
		//logger.debug("params=" + params);
		HttpRequestData data = null;
		String result = "";
		LinkedList<BasicNameValuePair> params = new LinkedList<BasicNameValuePair>(); 
		String [] res = param.split("&");
		for(String s:res){
			String [] p = s.split("=");
			params.add(new BasicNameValuePair(p[0], p[1]));  
		}
		//params.add(new BasicNameValuePair("JSESSIONID", jsession));  
		CookieStore cookieStore = new BasicCookieStore(); 
		BasicClientCookie cookie = new BasicClientCookie("JSESSIONID", jsession);

		
		try {
			HttpParams  httpParams = new BasicHttpParams();  
	        // 设置连接超时和 Socket 超时，以及 Socket 缓存大小  
	        HttpConnectionParams.setConnectionTimeout(httpParams, 20 * 1000);  
	        HttpConnectionParams.setSoTimeout(httpParams, 20 * 1000);  
	        HttpConnectionParams.setSocketBufferSize(httpParams, 8192);  
	        // 设置重定向，缺省为 true  
	        HttpClientParams.setRedirecting(httpParams, true);  
	        // 设置 user agent  
	        String userAgent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2) Gecko/20100115 Firefox/3.6";  
	        HttpProtocolParams.setUserAgent(httpParams, userAgent);  
	        // 创建一个 HttpClient 实例  
	        // 注意 HttpClient httpClient = new HttpClient(); 是Commons HttpClient  
	        // 中的用法，在 Android 1.5 中我们需要使用 Apache 的缺省实现 DefaultHttpClient  
	        HttpClient httpClient = new DefaultHttpClient(httpParams);  
	        cookieStore.addCookie(cookie); 
	        //httpClient.setCookieStore(cookieStore); 
			HttpPost postMethod = new HttpPost(url); 
			
			postMethod.setHeader("Cookie" , "JSESSIONID="+jsession);
		    postMethod.setEntity(new UrlEncodedFormEntity(params, "utf-8")); //将参数填入POST Entity中  
		                  
		    HttpResponse response = httpClient.execute(postMethod); //执行POST方法  

			

			
			data = new HttpRequestData();
			//data.setHead(response.ge);
			data.setResult(EntityUtils.toString(response.getEntity(), "utf-8"));
		} catch (Exception e) {
			connectCount++;
			logger.info("发送POST请求异常"+e);
			System.out.println("发送POST请求出现异常！" + e);
			e.printStackTrace();
			//if(connectCount<=2)
			//	sendPost(url, jsession, params,timeOut);
			
		}
		
		return data;
	}

	public static HttpRequestData sendPost(String url, String jsession, String params,int timeOut) {
		logger.debug("url=" + url);
		logger.debug("jsession=" + jsession);
		logger.debug("params=" + params);
		HttpRequestData data = null;
		PrintWriter out = null;
		BufferedReader br = null;
		InputStream in = null;
		InputStreamReader inr = null;
		String result = "";
		try {
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();
			conn.setConnectTimeout(timeOut);
			// 设置通用的请求属性
			conn.setRequestProperty("accept", "*/*");
			conn.setRequestProperty("Connection", "Keep-Alive");
			conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)");
			if (StringUtils.isNotBlank(jsession)) {
				conn.setRequestProperty("Cookie", "JSESSIONID="+jsession);
			}

			// 发送POST请求必须设置如下两行
			conn.setDoOutput(true);
			conn.setDoInput(true);
			// 获取URLConnection对象对应的输出流
			out = new PrintWriter(conn.getOutputStream());
			// 发送请求参数
			// if (params != null) {
			// System.out.println("params=" + params);
			// params = URLEncoder.encode(params, "UTF-8");
			out.print(params);
			// System.out.println("encode|params=" + params);
			// }
			// flush输出流的缓冲
			out.flush();

			// 定义BufferedReader输入流来读取URL的响应
			in = conn.getInputStream();
			inr = new InputStreamReader(in,"UTF-8");
			br = new BufferedReader(inr);
			String line;
			while ((line = br.readLine()) != null) {
				result += "\n" + line;
			}

			data = new HttpRequestData();
			data.setHead(conn.getHeaderFields());
			data.setResult(result);
		} catch (Exception e) {
			connectCount++;
			logger.info("发送POST请求异常"+e.getMessage());
			//e.printStackTrace();
			//if(connectCount<=2)
				//sendPost(url, jsession, params,timeOut);
			
		}
		// 使用finally块来关闭输出流、输入流
		finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return data;
	}
	
	 public static String httUrl(String ADD_URL,String params){
		 String resData="";
	    	try {
	    		
				DefaultHttpClient httpClient = new DefaultHttpClient();
				HttpPost method = new HttpPost(ADD_URL);
				StringEntity entity = new StringEntity(params,"utf-8");//解决中文乱码问题    
				entity.setContentEncoding("UTF-8");    
				entity.setContentType("application/json");    
				method.setEntity(entity);
				HttpResponse result = httpClient.execute(method);  
				  
	            // 请求结束，返回结果  
	            resData = EntityUtils.toString(result.getEntity());  
	            
			} catch (Exception e) {
				e.printStackTrace();
			}    
	    	return resData;
	    }
	
	
	/**
	 * 返回内容类
	 * 
	 * @author zhangy
	 * 
	 */
	public static final class HttpRequestData {
		/**
		 * 返回的头部信息
		 */
		private Map<String, List<String>> head;
		/**
		 * 返回的内容
		 */
		private String result;

		public Map<String, List<String>> getHead() {
			return head;
		}

		public void setHead(Map<String, List<String>> head) {
			this.head = head;
		}

		public String getResult() {
			return result;
		}

		public void setResult(String result) {
			this.result = result;
		}

	}
}
