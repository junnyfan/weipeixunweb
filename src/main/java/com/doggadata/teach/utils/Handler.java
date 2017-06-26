package com.doggadata.teach.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.doggadata.teach.pojo.PublicWx;
import com.doggadata.teach.pojo.PublicWxUtil;
import com.doggadata.teach.service.WXinterfaceService;

public class Handler implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {  
		String shId=request.getParameter("shId");
		System.out.println("===========HandlerInterceptor1 pre-----preGandel------------"+shId+"---------"+PublicWxUtil.getPublicWx());
		if(PublicWxUtil.getPublicWx()==null){
			
			PublicWx wx=WXinterfaceService.getShOperation(shId);
			System.out.println("===========HandlerInterceptor1 pre22-----preGandel------------"+wx.getAppId());
			request.getSession().setAttribute("publicwx", wx);
		}
		System.out.println("===========HandlerInterceptor1 preGandel------------"+shId);  
        return true;  
    }  

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("===========HandlerInterceptor1 postHandle");  
    }  

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {  
        System.out.println("===========HandlerInterceptor1 afterCompletion");  
    }  

}
