package com.doggadata.teach.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.doggadata.teach.pojo.AccessToken;

public class TokenThread implements Runnable {
	private static Logger log = LoggerFactory.getLogger(TokenThread.class);   
	public static AccessToken accessToken=null;
	public static String appid="";
	public static String appSecret="";
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
		while (true) {    
        }    
   

	}

}
