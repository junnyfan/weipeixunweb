package com.doggadata.teach.service;

import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.http.client.utils.HttpClientUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.doggadata.teach.pojo.WxPaySendData;
import com.doggadata.teach.utils.UrlUtil;
import com.doggadata.teach.utils.UrlUtil.HttpRequestData;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
public class UnifiedorderService {
	
	
	private final static Logger logger = LoggerFactory.getLogger(UnifiedorderService.class);
    
	  public static String unifiedOrder(WxPaySendData data,String key){
	    //统一下单支付
	    String returnXml = null;
	    try {
	      //生成sign签名
	      SortedMap<Object,Object> parameters = new TreeMap<Object,Object>();
	      parameters.put("appid", data.getAppid()); 
	      parameters.put("attach", data.getAttach());
	      parameters.put("body", data.getBody());
	      parameters.put("mch_id", data.getMch_id());
	      parameters.put("nonce_str", data.getNonce_str());
	      parameters.put("notify_url", data.getNotify_url());
	      parameters.put("out_trade_no", data.getOut_trade_no());
	      parameters.put("total_fee", data.getTotal_fee());
	      parameters.put("trade_type", data.getTrade_type());
	      parameters.put("spbill_create_ip", data.getSpbill_create_ip());
	      parameters.put("openid", data.getOpenid());
	      parameters.put("device_info", data.getDevice_info());
	      
	      
	      logger.info("SIGN:"+WxSign.createSign(parameters,key));
	      
	      data.setSign(WxSign.createSign(parameters,key));
	      XStream xs = new XStream(new DomDriver("UTF-8",new XmlFriendlyNameCoder("-_", "_")));
	      xs.alias("xml", WxPaySendData.class);
	      String xml = xs.toXML(data);
	      logger.info("统一下单xml为:\n" + xml);
	      HttpRequestData dataString=UrlUtil.sendPost("https://api.mch.weixin.qq.com/pay/unifiedorder", null, xml);
	      returnXml=dataString.getResult();
	      System.out.println("返回结果:" + returnXml);
	    } catch (Exception e) {
	      e.printStackTrace();
	    } 
	    return returnXml;
	  }
	  
	  
	  
	  
	  
	  
	  
	  
	  
	/*  
	  WxPaySendData data = new WxPaySendData();
	    data.setAppid(WxPayConfig.APPID);
	    data.setAttach("微信支付");
	    data.setBody("微信公众号支付");
	    data.setMch_id(WxPayConfig.MCHID);
	    data.setNonce_str(nonceStr);
	    data.setNotify_url(WxPayConfig.NOTIFY_URL);
	    data.setOut_trade_no(tradeNo);
	    data.setTotal_fee((int)(fee*100));//单位：分
	    data.setTrade_type("JSAPI");
	    data.setSpbill_create_ip(ip);
	    data.setOpenid(at.getOpenid());
	    String returnXml = UnifiedorderService.unifiedOrder(data,WxPayConfig.KEY);
	    WxPayReturnData reData = new WxPayReturnData();
	    XStream xs1 = new XStream(new DomDriver());
	    xs1.alias("xml", WxPayReturnData.class);
	    reData = (WxPayReturnData) xs1.fromXML(returnXml);*/

}
