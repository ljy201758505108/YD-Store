package com.yanda.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yanda.bean.User;
import com.yanda.service.UserService;

@Controller
@RequestMapping("Test")
public class TestController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/test")
	public void test(int uid)
	{
		System.out.println("hello....");
		User u = userService.findByUid(uid);
		
		System.out.println(u);
		
	}
	
	@RequestMapping("/register")
//	@ResponseBody
	public String register(User u)
	{
		
//		System.out.println("hello....");
//		int addUser = userService.register(u);
//		u.setPwd(MD5(u.getPwd()));
//		System.out.println(addUser);
//		System.out.println(u);
//		System.out.println(MD5(u.getPwd()));
//		
//		System.out.println(u.getUname());
//		System.out.println(u.getPwd());
//		System.out.println(u.getAddr());
		userService.register(u);
		return null;
		
		
	}
	

}
