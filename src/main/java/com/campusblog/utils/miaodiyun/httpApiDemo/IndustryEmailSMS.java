package com.campusblog.utils.miaodiyun.httpApiDemo;


import com.campusblog.utils.miaodiyun.httpApiDemo.common.Config;
import com.campusblog.utils.miaodiyun.httpApiDemo.common.HttpUtil;

/**
 * 短信邮验证码通知短信接口
 * 
 * @ClassName: IndustryEmailSMS
 * @Description: 短信邮验证码通知短信接口
 *
 */
public class IndustryEmailSMS
{
	private static String operation = "/industryEmailSMS/sendEmailSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String to = "649522441@qq.com";
	private static String smsContent = "【帆船博客】登录验证码：{1}，如非本人操作，请忽略此短信。";

	/**
	 * 短信邮验证码通知短信
	 */
	public static void execute()
	{
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + smsContent
				+ HttpUtil.createCommonParam();

		// 提交请求
		String result = HttpUtil.post(url, body);
		System.out.println("result:" + System.lineSeparator() + result);
	}
}
