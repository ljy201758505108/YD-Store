package com.yanda.controller.business;

import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yanda.bean.Business;
import com.yanda.bean.Result;
import com.yanda.bean.User;
import com.yanda.bean.Shop;
import com.yanda.service.BusinessService;
import com.yanda.util.JrUtil;
import com.yanda.util.MD5JIaMi;

@Controller
@RequestMapping("/business")
public class BusinessIndexController {

	
	@Autowired
	BusinessService businessService;
	
	@RequestMapping("/index")
	public String index() {
		return "business/index";
	}
	
	
	@RequestMapping("/registerPage")
	public String registerPage() {
		return "business/register";
	}
	/**
	 * 验证手机号是否存在
	 */
	@RequestMapping("/isTelExist")
	@ResponseBody
	public Result isTelExist(String tel) {
		
		Result result = new Result(1000); //1000----成功
		
		int r = businessService.isTelExist(tel);
		
		result.setData(r);
		
		return result;
	}
	
	/**
	 * 验证身份号是否存在
	 */
	@RequestMapping("/isIDCardExist")
	@ResponseBody
	public Result isIDCardExist(String idcard) {
		
		Result result = new Result(1000); //1000----成功
		
		int r = businessService.isIDCardExist(idcard);
		
		result.setData(r);
		
		return result;
	}
	
	/**
	 * 验证邮箱是否存在
	 */
	@RequestMapping("/isEmailExist")
	@ResponseBody
	public Result isEmailExist(String email) {
		
		Result result = new Result(1000); //1000----成功
		
		int r = businessService.isEmailExist(email);
		
		result.setData(r);
		
		return result;
	}
	/**
	 * 将上传的身份证图片的文件名保存到数据库
	 * @param tx
	 * @param request
	 */
	@RequestMapping("/upload")
	public Result upload(@RequestParam MultipartFile[] idcard,HttpServletRequest request)
	{
		Result result = new Result();
		
		System.out.println("上传。。。。");
		//获取项目的发布目录
		String appPath = request.getServletContext().getRealPath("/idcard");
		
		System.out.println(appPath);

		try {
			String[] str = new String[3];
			System.out.println(idcard);
			for(int i=0;i<idcard.length;i++) {
				String fname = idcard[i].getOriginalFilename();
				String path = appPath+"/"+fname;
				idcard[i].transferTo(new File(path));
				str[i]=path;
			}
			int r = businessService.addPath(str);
			
			if(r!=0) {
				result.setMsg("上传成功");
			}
			
			
		} catch (IllegalStateException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return result;
		
		
		
	}
	@RequestMapping("register")
	@ResponseBody
	public Result register(Business b) {
		b.setStatus("1");
		System.out.println(b);
		HttpServletResponse response = null; 
		Result result = new Result();
		
		int tel = businessService.isTelExist(b.getTel());
		
		int idcard = businessService.isIDCardExist(b.getIdcard_face());
		
		int email = businessService.isEmailExist(b.getEmail());
		
		if(tel == 1) {
			result.setCode(2000);
			result.setMsg("改手机号已经存在");
			return result;
		}
		if(idcard == 1) {
			result.setCode(2000);
			result.setMsg("改身份证号已经存在");
			return result;
		}
		if(email == 1){
			result.setCode(2000);
			result.setMsg("改邮箱已经注册过");
			return result;
		}
		System.out.println("00000000000000000000");
		businessService.register(b);
		System.out.println("asgdfhjkl;");
		result.setCode(1000);
		result.setMsg("ok");
		String text = "请点击链接激活 http://localhost:8080/ssm/business/activePage.action";
		try {
			JrUtil.sendEMail("发件人名称",b.getEmail() , "邮件主题", text);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	/**
	 * E-mail激活页面
	 * 
	 */
	@RequestMapping("/activePage")
	public String activePage() {
		return "business/active";
		
	}
	
	/**
	 * 跳转到登录界面
	 * 
	 */
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "business/login";
	}
	
	
	/**
	 * 登录功能实现
	 * 
	 */
	@RequestMapping("login")
	@ResponseBody
	public Result login(String tel, String email, String pwd,HttpSession session) {
		Result result = new Result();
		
		//登录信息是否正确
		Business b = businessService.login(tel,email,MD5JIaMi.MD5(pwd));
		
		System.out.println(b);
		//如果登录信息不正确
		if(b == null) {
			result.setCode(2000);
			result.setMsg("用户名或密码错误");
			return result;
		}
		
		session.setAttribute("businessInfo", b);
		
		result.setCode(1000);
		result.setMsg("登录成功");
		
		return result;
	}
	
	/**
	 * 商家店铺注册
	 * 
	 */
	@RequestMapping("/shopRegister")
	@ResponseBody
	public Result shopRegister(Shop shop,HttpServletRequest request) {
		int bid = 0;
		
		if(request.getSession().getAttribute("businessInfo")!=null) {
			Object b = request.getSession().getAttribute("businessInfo");
			bid = ((Business) b).getBid();
		}
		System.out.println(bid);
		
		Result result = new Result();
		
		businessService.shopRegister(shop);
		System.out.println("000000000000011111111111111111");
		result.setMsg("店铺注册成功");
		
		return result;
		
	}
	/**
	 * 跳轉到店鋪注冊界面
	 */
	@RequestMapping("/shop_register")
	public String shop_register() {
		
		return "business/shop_register";
	}
	/**
	 * 店铺标志注册---将logo保存到数据库中
	 * 
	 */
	@RequestMapping("/uploadShopLogo")
	@ResponseBody
	public Result uploadShopLogo(@RequestParam MultipartFile shopLogo,HttpServletRequest request) {
		Result result = new Result();
		System.out.println("上传。。。。");
		
		//获取项目的发布目录
		String appPath = request.getServletContext().getRealPath("shopLogo");
		System.out.println(appPath);
		
		try {
			String fname = shopLogo.getOriginalFilename();
			String path = appPath+"/"+fname;
			shopLogo.transferTo(new File(path));
			//将店铺标志的文件名存到数据库，，，，，，
			int r = businessService.addShopLogoPath(path);
			
			if(r!=0) {
				result.setMsg("上传成功");
			}
			
			
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	
		
	}
	
}
