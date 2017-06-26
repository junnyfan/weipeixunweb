package com.doggadata.teach.pojo;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.doggadata.teach.utils.SpringContextUtils;

public class PublicWxUtil extends  SpringContextUtils{
	public static PublicWx getPublicWx() {
		PublicWx wx = null;
		try {
			wx = (PublicWx) ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession().getAttribute("publicwx");

		} catch (Exception e) {
			// TODO: handle exception
		}
		if(wx==null){
			//wx=new PublicWx();
		}
		return wx;
	}

}
