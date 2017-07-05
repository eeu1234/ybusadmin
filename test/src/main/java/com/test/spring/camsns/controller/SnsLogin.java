package com.test.spring.camsns.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.spring.dto.camsns.UserDTO;

@Controller("snsLogin")
public class SnsLogin {

	@RequestMapping(method = { RequestMethod.POST }, value = "/camsns/login.action")
	public void adminSnsboardListlist(HttpServletRequest request
										, HttpSession session
										, HttpServletResponse response
										, String token) throws ParseException, IOException {
		/*
		{"kaccount_email":"eeu1234@nate.com"
		,"kaccount_email_verified":true
		,"id":429243383
		
		,"properties":{"profile_image":"http:\/\/mud-kage.kakao.co.kr\/14\/dn\/btqgkztR2Da\/mVV8babw5SWxFg9HnC3cXk\/o.jpg"
		,"nickname":"이도영"
		,"thumbnail_image":"http:\/\/mud-kage.kakao.co.kr\/14\/dn\/btqgk7DoB2D\/4Tnuv8r6oI9j1jfiYpV8k0\/o.jpg"}
		}
		*/
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( token );
		JSONObject jsonObj = (JSONObject) obj;
		System.out.println(jsonObj.toString());
		
		String kaccountEmail = (String) jsonObj.get("kaccount_email");//카카오이메일
		String kakaoId = jsonObj.get("id").toString();//카카오아이디
		
		
		JSONParser parser2 = new JSONParser();
		JSONObject jsonObj2 = (JSONObject) jsonObj.get("properties");
		String nickName = (String)jsonObj2.get("nickname");//카카오닉네임
		
		
		System.out.println(kaccountEmail);
		System.out.println(kakaoId);
		System.out.println(nickName);
		
		UserDTO userDto = new UserDTO();
		
		userDto.setUserEmailId(kaccountEmail);
		userDto.setUserKakaoId(kakaoId);
		userDto.setUserNickName(nickName);
		
		
		session.setAttribute("userDto", userDto);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("성공");
	}
}