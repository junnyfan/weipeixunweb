package com.doggadata.teach.utils;

import java.text.NumberFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class Tool 
{
	/**
	 * 生成json数据
	 * 
	 * @author javayuan
	 */
	public static String composeJson(String name) 
	{
		StringBuffer sb=new StringBuffer();
		
	    sb.append("{\"").append(name+".x\":").append("\"3\",\"");
	                  sb.append(name+".y\":").append("\"5\"}");
//		System.out.println(sb.toString());
		
		return sb.toString();
	}
	
	/**
	 * 字符转换
	 * 
	 * @author javayuan
	 */
	public  static String unUnicode(String text) 
	{
		StringBuffer bf = new StringBuffer();
		String reg = "\\&\\#(.*?);";
		Matcher m = Pattern.compile(reg).matcher(text);
		
		while (m.find()) 
		{
			bf.append((char) Integer.valueOf(m.group(1)).intValue());
		}
		
		return bf.toString();
	}
	
	/**
	 * 匹配字符串
	 * 
	 * @author javayuan
	 */
	public static boolean getStringsByRegex(String txt) 
	{
        String regex="src=\"/mondrian/jpivot/table/drill-position-expand.gif\"";   
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(txt);
        
        if (m.find())
        {
            return true;
        }  
        
        return false;
    }

	/**
	 * 百分数格式化输出数据
	 * 
	 * @author javayuan
	 */
	public String getPer(double num) 
	{
		double percent = num / 600;
		NumberFormat nt = NumberFormat.getPercentInstance();
		nt.setMinimumFractionDigits(2);
		    
		return nt.format(percent);
	}
	
	/**
	 * 字符串转换整型
	 * 
	 * @author javayuan
	 */
	public static float String2Int(String str)
	{
		/*if (str==null) {
			str="0";
		}*/
		/*if ("".equals(str)) {
			str="0";
		}*/
		
		str = str.trim();
		float fResult;
		
		int i = str.indexOf(",");
		int j = str.indexOf("%");
		int k = str.indexOf(".");

		if(k == 0)
		{
			str = str.replace(".", "");
			fResult = Float.parseFloat(str);
		}
		
		if(i >= 0)
		{
			str = str.replace(",", "");
		}
		
		if(j >= 0)
		{
			str = str.replace("%", "");
			str = str.replace(".", "");
			//System.out.println("---------------------------->"+str);
//			fResult = (Integer.parseInt(str))/10000;
			fResult = (Integer.parseInt(str))/100;
		}else
		{
			fResult = Integer.parseInt(str);
		}
		
		return fResult;
	}
	
	/**
	 * 判断是否存在网络连接 :返回 true表示连接成功
	 * 
	 * @author 
	 */
	
}



