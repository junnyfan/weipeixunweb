package com.doggadata.teach.utils;

import java.io.InputStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.doggadata.teach.msgresp.Article;
import com.doggadata.teach.msgresp.NewsMsgResp;
import com.doggadata.teach.msgresp.TextMsgResp;
import com.thoughtworks.xstream.XStream;


/**
 * 微信公众号-消息工具类
 * @author chend
 *
 */
public class MessageUtil {
	public static final String RESP_MESSAGE_TYPE_TEXT = "text";
	public static final String RESP_MESSAGE_TYPE_MUSIC = "music";
	public static final String RESP_MESSAGE_TYPE_NEWS = "news";

	public static final String REQ_MESSAGE_TYPE_TEXT = "text";
	public static final String REQ_MESSAGE_TYPE_IMAGE = "image";
	public static final String REQ_MESSAGE_TYPE_LINK = "link";
	public static final String REQ_MESSAGE_TYPE_LOCATION = "location";
	public static final String REQ_MESSAGE_TYPE_EVENT = "event";

	public static final String EVENT_TYPE_SUBSCRIBE = "subscribe";
	public static final String EVENT_TYPE_UNSUBSCRIBE = "unsubscribe";
	public static final String EVENT_TYPE_CLICK = "CLICK";

	/**
	 * 
	 * 解析易信发来的请求
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> parseXml(HttpServletRequest request)
			throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		InputStream inputStream = request.getInputStream();
		SAXReader reader = new SAXReader();
		Document document = reader.read(inputStream);
		Element root = document.getRootElement();
		// @SuppressWarnings("unchecked")
		List<Element> elementsList = root.elements();

		for (Element e : elementsList){
			map.put(e.getName(), e.getText());
		System.out.println(e.getName()+"==============MessageUtil============"+e.getText());
		}
		inputStream.close();
		inputStream = null;

		return map;
	}

	/**
	 * 响应的文本消息对象转换为XML
	 * 
	 * @param textMsgResp
	 * @return
	 */
	public static String textMessageToXml(TextMsgResp textMsgResp) {
		XStream xStream = new XStream();
		xStream.alias("xml", textMsgResp.getClass());
		return xStream.toXML(textMsgResp);

	}

	public static String newsMessageToXml(NewsMsgResp newsMsgResp) {
		XStream xStream = new XStream();
		xStream.alias("xml", newsMsgResp.getClass());
		xStream.alias("item", new Article().getClass());
		return xStream.toXML(newsMsgResp);
	}
	
	/*public static String musicMessageToXml(MusicMsgResp musicMessage) {  
	    xstream.alias("xml", musicMessage.getClass());  
	    return xstream.toXML(musicMessage);  
	}  */

	/**
	 * 扩展xstrem 使其支持CDATA块
	 * 
	 */
/*
	public static XStream xstream = new XStream(new XppDriver() {
		public HierarchicalStreamWriter createWriter(Writer out) {
			return new PrettyPrintWriter(out) {
				// 对所有xml节点的转换都增加CDATA标记
				boolean cdata = true;

				public void startNode(String name, Class clazz) {
					super.startNode(name, clazz);
				}

				protected void writeText(QuickWriter writer, String text) {
					if (cdata) {
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					} else {
						writer.write(text);
					}
				}
			};
		}
	});*/
	/**
	 * 机器人对话
	 * @param type  是否是关注,type=attention  关注，其他就是机器人对话
	 * @param filename  配置文件名称
	 * @param value  用户输入的值
	 * @param falg 是否回复链接  falg=true  链接，falg=false   图文菜单
	 * @return
	 * @throws Exception
	 */
	public static String parseFileString(String filename,String type,String value,boolean falg,String fromUser,String toUser) throws Exception{
		filename=PropertyUtils.getWebServiceProperty("rabot.xml");
		String result=new String();
		SAXReader reader1 = new SAXReader();
		InputStream inputStream = MessageUtil.class.getClassLoader()
				.getResourceAsStream(filename);
		Document document = reader1.read(inputStream);
		Element root = document.getRootElement();
		Map<String,Object> mapCach=new HashMap<String, Object>();
		List<Map> lists=new ArrayList<Map>();
		List list = root.elements();
		 for (int i = 0, size = list.size(); i < size; i++) {
          Element element = (Element) list.get(i);
          List ce = element.elements();
          Map<String,String> map=new HashMap<String, String>();
          for (int j = 0, csize = ce.size(); j < csize; j++) {

             Element temp = (Element) ce.get(j);
             String qName = temp.getName();

             if(qName.equals("param")){
            	 String paramName=temp.getText();
            	 String param=PropertyUtils.getWebServiceProperty(paramName);
            	 map.put("url", map.get("url")+param);
             }
             if(qName.equals("Title")){
                String title = temp.getText();
                map.put("title", title);
                continue;
             }else if(qName.equals("Description")){
                String description = temp.getText();
                map.put("desc", description);
                continue;
                
             }else if(qName.equals("PicUrl")){
                String picurl = temp.getText();
                map.put("picurl", picurl);
                continue;
                
             }else if(qName.equals("Url")){
                String url = temp.getText();
                map.put("url", url);
                continue;
             }else{
                continue;
             }
          }
          lists.add(map);
          String lang=StringUtils.isBlank(element.attributeValue("lang"))?"机器人异常":element.attributeValue("lang");
          mapCach.put(lang, map);
          
		 }
		 StaticDataCache.getInstance().putCache("robot", mapCach);
		
		if(type.equals("attention")){
			result=root.attributeValue("desc")+"\n";
			
			for (int i = 0, size = list.size(); i < size; i++) {
			   result+="----------------------------------"+"\n";
			   Element element = (Element) list.get(i);
				if(lists.get(i).size()>0){
					if(falg){
						if(StringUtils.isNotBlank(lists.get(i).get("url")+"")){
							
							result+="<a href=\""+lists.get(i).get("url")+"\">"+lists.get(i).get("title")+"</a>\n" ;
						}
						if(StringUtils.isNotBlank(lists.get(i).get("desc")+""))
							result+=lists.get(i).get("desc");
					}else{
						String lang=StringUtils.isBlank(element.attributeValue("lang"))?"机器人异常":element.attributeValue("lang");
						if(!mapCach.containsKey(lang))
						   mapCach.put(lang, lists.get(i));
						result+= "【回复 "+lang+"】查看《"+lists.get(i).get("title")+"》\n";
					}
						
				}
			}
			//StaticDataCache.getInstance().putCache("robot", mapCach);
		}else{
			Map<String,Object> cachMap=(Map<String,Object>)StaticDataCache.getInstance().getCache("robot");
			NewsMsgResp newsMsgResp = new NewsMsgResp();
			newsMsgResp.setToUserName(fromUser);
			newsMsgResp.setFromUserName(toUser);
			newsMsgResp.setCreateTime(new Date().getTime());
			newsMsgResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
			List<Article> articlelList = new ArrayList<Article>();
			if(!falg){
				Map<String,Object> valueMap = (Map<String,Object> )cachMap.get(value);
				if(valueMap!=null){
					Article article = new Article();
					article.setTitle(valueMap.get("title").toString());
					article.setDescription(valueMap.get("desc").toString());
					article.setPicUrl(valueMap.get("picurl").toString());
					article.setUrl(valueMap.get("url").toString());
					articlelList.add(article);
					newsMsgResp.setArticleCount(articlelList.size());
					newsMsgResp.setArticles(articlelList);
					result=MessageUtil.newsMessageToXml(newsMsgResp);
				}else{
				    TextMsgResp textMsgResp = new TextMsgResp();
			        textMsgResp.setToUserName(fromUser);
			        textMsgResp.setFromUserName(toUser);
			        textMsgResp.setCreateTime(new Date().getTime());
			        textMsgResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			        textMsgResp.setContent("您输入\""+value+"\"无法被识别,请按照提示输入，谢谢合作.祝你生活愉快!");
					result=MessageUtil.textMessageToXml(textMsgResp);
				}
			}
		}
		
		return result.toString();
	}
	
	public static List<Article> parseFileXml(String filename) throws Exception {

		SAXReader reader1 = new SAXReader();
		InputStream inputStream = MessageUtil.class.getClassLoader()
				.getResourceAsStream(filename);
		Document document = reader1.read(inputStream);
		Element root = document.getRootElement();

		Article article = null;
		List<Article> articlelList = new ArrayList<Article>();

		List list = root.elements();
		for (int i = 0, size = list.size(); i < size; i++) {

			article = new Article();
			Element element = (Element) list.get(i);
			List ce = element.elements();

			for (int j = 0, csize = ce.size(); j < csize; j++) {

				Element temp = (Element) ce.get(j);
				String qName = temp.getName();

				if(qName.equals("Title")){
					String title = temp.getText();
					article.setTitle(title);

					continue;
				}else if(qName.equals("Description")){
					String description = temp.getText();
					article.setDescription(description);

					continue;
					
				}else if(qName.equals("PicUrl")){
					String picurl = temp.getText();
					article.setPicUrl(picurl);

					continue;
					
				}else if(qName.equals("Url")){
					String url = temp.getText();
					article.setUrl(url);

					continue;
				}else{
					continue;
				}
			}
			articlelList.add(article);
			article = null;

		}

		return articlelList;
	}
	
	

}
