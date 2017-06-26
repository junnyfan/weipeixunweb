package com.doggadata.teach.menu;



import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.doggadata.teach.pojo.AccessToken;
import com.doggadata.teach.pojo.Button;
import com.doggadata.teach.pojo.ComplexButton;
import com.doggadata.teach.pojo.Menu;
import com.doggadata.teach.pojo.ViewButton;
import com.doggadata.teach.utils.YiXinUtil;

public class MenuManagerRJ {
	private static Logger logger = LoggerFactory.getLogger(MenuManagerRJ.class);
/**
 * 微信3*5动态菜单生成，软件创业
 * @param args
 * @throws IOException
 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub

		
		/*String	appid =PropertyUtils.getWebServiceProperty("appid");
		String	appSecret =PropertyUtils.getWebServiceProperty("appSecret");*/
		String shId="9055be7a45a5425da1c44b2e2126411a";//软件创业
		AccessToken at = YiXinUtil.getAccessToken(shId);

		if (null != at) {
			int det = YiXinUtil.deleteMenu(at.getToken());
			if (0 == det) {
				logger.info("删除菜单成功！");
			} else {
				logger.info("菜单删除失败，错误码：" +det);
			}
			
			int res = YiXinUtil.createMenu(getMenu(), at.getToken());

			if (0 == res) {
				logger.info("创建菜单成功！");
			} else {
				logger.info("菜单创建失败，错误码：" + res);
			}

		}

	}

	public static Menu getMenu() {
		//shId=6827b4cf-0eff-4545-9e4f-da8510351fca

		ViewButton btn11 = new ViewButton();
		btn11.setName("课程列表");
		btn11.setType("view");
		btn11.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa76644985975ad93&redirect_uri=http%3a%2f%2foepp.cn%2fWxschoolPen%2findex%2ftempMinCourse.do&response_type=code&scope=snsapi_base&state=2343#wechat_redirect");
		
		ViewButton btn12 = new ViewButton();
		btn12.setName("学习历程");
		btn12.setType("view");
		btn12.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa76644985975ad93&redirect_uri=http%3a%2f%2foepp.cn%2fWxschoolPen%2findex%2ftempProcess.do&response_type=code&scope=snsapi_base&state=2343#wechat_redirect");
		
		
		ViewButton btn21 = new ViewButton();
		btn21.setName("课程表");
		btn21.setType("view");
		btn21.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa76644985975ad93&redirect_uri=http%3a%2f%2foepp.cn%2fWxschoolPen%2findex%2ftempCourse.do&response_type=code&scope=snsapi_base&state=2343#wechat_redirect");
		
		ViewButton btn22 = new ViewButton();
		btn22.setName("老师介绍");
		btn22.setType("view");
		btn22.setUrl("http://mp.weixin.qq.com/s?__biz=MzIyNjIxOTM0NA==&mid=100000003&idx=1&sn=ef06b77456a3ac8dcf85ae41575c8ccc&scene=23&srcid=0624pxtWRiBMigMt5ukVNNwC#rd");
		
		
		
		
		ViewButton btn31 = new ViewButton();
		btn31.setName("个人中心");
		btn31.setType("view");
		btn31.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa76644985975ad93&redirect_uri=http%3a%2f%2foepp.cn%2fWxschoolPen%2findex%2ftempMyCenter.do&response_type=code&scope=snsapi_base&state=2343#wechat_redirect");
		
		
		ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("我的课程");
		mainBtn1.setSub_button(new Button[] {btn11,btn12});

		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("课程购买 ");
		mainBtn2.setSub_button(new Button[] {btn21, btn22});

		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("个人中心 ");
		mainBtn3.setSub_button(new Button[] {btn31});


		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1, mainBtn2 ,mainBtn3});

		return menu;

	}

}




