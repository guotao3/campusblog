package com.campusblog.utils.miaodiyun.httpApiDemo;

import com.campusblog.utils.Result;
import com.campusblog.utils.miaodiyun.httpApiDemo.common.Config;
import com.campusblog.utils.miaodiyun.httpApiDemo.common.HttpUtil;

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private  String to;
	private  String smsContent;

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSmsContent() {
		return smsContent;
	}

	public void setSmsContent(String smsContent) {
		this.smsContent = smsContent;
	}

	/**
	 * 验证码通知短信
	 */
	public Result execute()
	{
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + smsContent
				+ HttpUtil.createCommonParam();

		// 提交请求
		String result = HttpUtil.post(url, body);
		System.out.println("result:" + System.lineSeparator() + result);
		Result result1 = new Result();
		String[] res = result.split(",");
		if ("\"00104\"}".equals(res[0].split(":")[1])){
			result1.setRespcode("00000");
			return result1;
		}else {
			result1.setRespcode("other");
			return result1;
		}

	}
}
