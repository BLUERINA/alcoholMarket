package com.korea.market;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MessageController {

	@RequestMapping(value = {"sendSms.do", "find/sendSms.do"})
	@ResponseBody
	public String sendSms(String userPhoneNo) throws Exception {
		  Integer randomNumber = (int) (Math.random() * (999999 - 100000 + 1)) + 100000;
		  String api_key = "NCS2MHTTFSQE9T0O";
		  String api_secret = "RNRFH0T36H0IEJQCCVU0PFUBM2AY3CDO";
		  Message coolsms = new Message(api_key, api_secret);

		  HashMap<String, String> set = new HashMap<String, String>();
		  set.put("to", "userPhoneNo"); // 수신번호
		  set.put("from", "01029573689"); // 발신번호
		  set.put("text", "[TEST] 인증번호는 " + "[" + randomNumber + "]" + "입니다.");
		  set.put("type", "sms"); // 문자 타입
		  set.put("app_version", "test app 1.2"); 
		  
		  System.out.println(randomNumber);
		  try {
		  JSONObject result = coolsms.send(set); // 보내기&전송결과받기
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }

		  return Integer.toString(randomNumber);
		}
}
