package com.doggadata.teach.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;










import com.dt.dtpt.mybatis.model.publicwx.WxUserPublic;
import com.doggadata.teach.msgresp.Article;
import com.doggadata.teach.msgresp.NewsMsgResp;
import com.doggadata.teach.msgresp.TextMsgResp;
import com.doggadata.teach.pojo.AccessToken;
import com.doggadata.teach.utils.MessageUtil;
import com.doggadata.teach.utils.PropertyUtils;
import com.doggadata.teach.utils.YiXinUtil;


public class CoreService {

	public static String processRequest(HttpServletRequest request,HttpServletResponse response) {
		String respMessage = null;
		boolean falg=Boolean.valueOf(PropertyUtils.getWebServiceProperty("rabot.isReply"));
		try {
			String respContent = "此功能还在开发中，敬请期待！";
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			String fromUserName = requestMap.get("FromUserName");
			//request.getSession().setAttribute("openIdtest", fromUserName);
			String toUserName = requestMap.get("ToUserName");
			String msgType = requestMap.get("MsgType");
			String shId=PropertyUtils.getWebServiceProperty("shId");
			AccessToken at = YiXinUtil.getAccessToken(shId);
			// 回复文本信息
			TextMsgResp textMsgResp = new TextMsgResp();
			textMsgResp.setToUserName(fromUserName);
			textMsgResp.setFromUserName(toUserName);
			textMsgResp.setCreateTime(new Date().getTime());
			textMsgResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			// textMsgResp.setFuncFlag(0);
			
			/*//回复图片信息
			ImageMsgResp imageMsgResp = new ImageMsgResp();
			imageMsgResp.setToUserName(fromUserName);
			imageMsgResp.setFromUserName(toUserName);
			imageMsgResp.setCreateTime(new Date().getTime());
			imageMsgResp.setMsgType(MessageUtil.REQ_MESSAGE_TYPE_IMAGE);*/

			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				if(!falg){
					String content = requestMap.get("Content").trim();
					respMessage =MessageUtil.parseFileString(null, "text", content, falg,fromUserName,toUserName);
				}else{
					textMsgResp.setContent(respContent);  
					respMessage = MessageUtil.textMessageToXml(textMsgResp);  
				}
			} else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				String eventType = requestMap.get("Event");
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					respContent =MessageUtil.parseFileString(null, "attention", null, falg,fromUserName,toUserName);
					textMsgResp.setContent(respContent);
					System.out.println(respContent);
					respMessage = MessageUtil.textMessageToXml(textMsgResp);
					attentionEvnent(at.getToken(),fromUserName);
				} else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					System.out.println("------解绑开始--------");
					//InterfaceService.unbinded(fromUserName);
					respContent = "感谢你关注蔡老师培训班！祝你生活愉快\n";
					textMsgResp.setContent(respContent);
					respMessage = MessageUtil.textMessageToXml(textMsgResp);
				} else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {

					String eventKey = requestMap.get("EventKey");

					NewsMsgResp newsMsgResp = new NewsMsgResp();
					newsMsgResp.setToUserName(fromUserName);
					newsMsgResp.setFromUserName(toUserName);
					newsMsgResp.setCreateTime(new Date().getTime());
					newsMsgResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					List<Article> articlelList = new ArrayList<Article>();

					if (eventKey.equals("a1")) {
						articlelList = MessageUtil.parseFileXml("a1.xml");
						for(int i=0;i<articlelList.size();i++){
							articlelList.get(i).setUrl(articlelList.get(i).getUrl()+"&openId="+fromUserName);
							System.out.println("---"+articlelList.get(i).getUrl());
						}
						newsMsgResp.setArticleCount(articlelList.size());
						newsMsgResp.setArticles(articlelList);
						respMessage = MessageUtil.newsMessageToXml(newsMsgResp);
					} else if (eventKey.equals("a2")) {
						//respContent ="/害羞";
						respContent="此功能还在开发中.";
						textMsgResp.setContent(respContent);
						respMessage = MessageUtil.textMessageToXml(textMsgResp);
					} else if (eventKey.equals("a3")) {
						articlelList = MessageUtil.parseFileXml("a3.xml");
						for(int i=0;i<articlelList.size();i++){
							String opt="?";
							if(articlelList.get(i).getUrl().indexOf("?")>=0)
								opt="&";
							articlelList.get(i).setUrl(articlelList.get(i).getUrl()+opt+"openId="+fromUserName);
						}
						newsMsgResp.setArticleCount(articlelList.size());
						newsMsgResp.setArticles(articlelList);
						respMessage = MessageUtil.newsMessageToXml(newsMsgResp);
					} else if (eventKey.equals("a4")) {
						articlelList = MessageUtil.parseFileXml("a4.xml");
						for(int i=0;i<articlelList.size();i++){
							String opt="?";
							if(articlelList.get(i).getUrl().indexOf("?")>=0)
								opt="&";
							articlelList.get(i).setUrl(articlelList.get(i).getUrl()+opt+"openId="+fromUserName);
						}
						newsMsgResp.setArticleCount(articlelList.size());
						newsMsgResp.setArticles(articlelList);
						respMessage = MessageUtil.newsMessageToXml(newsMsgResp);
					} else if (eventKey.equals("a5")) {
						articlelList = MessageUtil.parseFileXml("a5.xml");
						newsMsgResp.setArticleCount(articlelList.size());
						articlelList.get(0).setPicUrl("http://wxreports.bringbi.com/image/menu/banner_big.jpg");
						articlelList.get(0).setUrl(articlelList.get(0).getUrl()+"&openId="+fromUserName);
						newsMsgResp.setArticles(articlelList);
						respMessage = MessageUtil.newsMessageToXml(newsMsgResp);
					} else if (eventKey.equals("b1")) {
						respContent = "/嘘";
						textMsgResp.setContent(respContent);
						respMessage = MessageUtil.textMessageToXml(textMsgResp);
					} else if (eventKey.equals("b2")) {
						respContent = "/调皮";
						textMsgResp.setContent(respContent);
						respMessage = MessageUtil.textMessageToXml(textMsgResp);
					}else if (eventKey.equals("b3")) {
						respContent = "暂无信息";
						textMsgResp.setContent(respContent);
						respMessage = MessageUtil.textMessageToXml(textMsgResp);
					}else if (eventKey.equals("b4")) {
						articlelList = MessageUtil.parseFileXml("b4.xml");
						newsMsgResp.setArticleCount(articlelList.size());
						newsMsgResp.setArticles(articlelList);
						respMessage = MessageUtil.newsMessageToXml(newsMsgResp);
					} else if (eventKey.equals("c1")) {
						respContent = "/鬼脸";
						textMsgResp.setContent(respContent);
						respMessage = MessageUtil.textMessageToXml(textMsgResp);
					} else if (eventKey.equals("c2")) {
						respContent = "/敲";
						textMsgResp.setContent(respContent);
						respMessage = MessageUtil.textMessageToXml(textMsgResp);
					} else if (eventKey.equals("c3")) {
						respContent = "/爱心";
						textMsgResp.setContent(respContent);
						respMessage = MessageUtil.textMessageToXml(textMsgResp);
					} else if (eventKey.equals("c4")) {
						respContent = "/飞机";
						textMsgResp.setContent(respContent);
						respMessage = MessageUtil.textMessageToXml(textMsgResp);
					} else if (eventKey.equals("c5")) {
						respContent = "/公交";
						textMsgResp.setContent(respContent);
						respMessage = MessageUtil.textMessageToXml(textMsgResp);
					}

					}else if(eventType.equals("VIEW")){//type eq view (eg: http://www.wxreport/index.jsp)
					   String eventKey = requestMap.get("EventKey");
					   System.out.println("view--------"+eventKey);
					   String opt="?";
                  if(eventKey.indexOf("?")>=0)
                     opt="&";
                  /*String reqUrl="http://html5demo.bringbi.com/main?type=login"+opt+"openId="+fromUserName;
                  System.out.println("reqUrl--------"+reqUrl);
                  request.getRequestDispatcher(reqUrl).forward(request, response);*/
					}
				

			}else if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)){
				//Image image=new Image();
				//imageMsgResp.setImage(image);
				textMsgResp.setContent("用户A发送一条信息给您，包含一张图片信息");
				respMessage = MessageUtil.textMessageToXml(textMsgResp);
				
			}else {

				textMsgResp.setContent(respContent);
				respMessage = MessageUtil.textMessageToXml(textMsgResp);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return respMessage;
	}
	
	public static void attentionEvnent(String accessToken,String openId){
		String shId=PropertyUtils.getWebServiceProperty("shId");
		System.out.println("accessToken:"+accessToken);
		Map<String,Object> map=YiXinUtil.getUserInfo(accessToken, openId);
		WxUserPublic wx=new WxUserPublic();
		wx.setInCity(map.get("country")+"-"+map.get("province")+"-"+map.get("city"));
		wx.setAsName(map.get("nickname")+"");
		wx.setLogo(map.get("headimgurl")+"");
		wx.setWxOpenid(openId);
		//wx.setWxUnionid(map.get("unionid")+"");
		wx.setUserId(shId);
		WXinterfaceService.attentionUser(wx, shId);
	}
    
    public static String subscribeStr(){
    	StringBuffer buffer = new StringBuffer();  
        buffer.append("操作指南").append("\n\n");  
        buffer.append("回复：用户名和密码").append("\n");  
        buffer.append("例如：admin:123456").append("\n");  
        buffer.append("只有通过校验之后才能访问资源信息公众号,如带来不便请谅解./可爱").append("\n\n");  
        return buffer.toString();  
    }
    
    
    public static void main(String[] args){
    	String openId="oO-NhuACmuY_0z-f-921RUkGFgIc";

    	
    	
    	
    }
}
