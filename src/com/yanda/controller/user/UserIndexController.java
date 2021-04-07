package com.yanda.controller.user;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yanda.bean.Page;
import com.yanda.bean.Product;
import com.yanda.bean.Result;
import com.yanda.bean.User;
import com.yanda.service.ProductService;
import com.yanda.service.UserService;
import com.yanda.util.MD5JIaMi;

@Controller
@RequestMapping("/user")
public class UserIndexController {
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	/**
	 * 跳转到首页界面
	 * 
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		//查询商品信息
		Page page = productService.findProductListByPage(0,4);
		
		model.addAttribute("page", page);
		
		return "user/index";
		
	}
	
	/**
	 * 跳转到登录界面
	 * @param session 
	 * @return
	 */
	@RequestMapping("/loginPage")
	public String loginPage(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("userInfo") != null) {
			try {
				
				response.sendRedirect("/ssm/zhijieIndex.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "user/login";
	}
	
	/**
	 * 登录功能实现
	 */
	@RequestMapping("login")
	@ResponseBody
	public Result login(String tel, String pwd, boolean isRemember, HttpSession session,HttpServletResponse response) {
		Result result = new Result();
		
		//登录信息是否正确
		User u = userService.login(tel,MD5JIaMi.MD5(pwd));
		
		//如果登录信息不正确
		if(u == null) {
			result.setCode(2000);
			result.setMsg("用户名或密码错误");
			return result;
		}
		else {
			if(isRemember) {
				//生成令牌
				String autoLoginToken = UUID.randomUUID().toString();
				
				System.out.println(autoLoginToken);
				
				//数据库保存令牌
				userService.addToken(u.getUid(),autoLoginToken,"autoLogin", new Date(new Date().getTime()+1000L*1*60*60*24*365));
				
				//前台浏览器保存令牌
				Cookie c = new Cookie("altoken",autoLoginToken);
				c.setMaxAge(60*60*24*365);  //设置令牌存储时间为一年
				response.addCookie(c); //将该令牌信息响应回前端
			}
			
		}
		session.setAttribute("userInfo", u);
		
		result.setCode(1000);
		result.setMsg("登录成功");
		
		return result;
		
	}
	
	
	
	/**
	 * 跳转到注册界面
	 * 
	 */
	@RequestMapping("/registerPage")
	public String registerPage() {
		return "user/register02";
		
	}
	
	/**
	 * 验证手机号是否存在
	 */
	@RequestMapping("isTelExist")
	@ResponseBody
	public Result isTelExist(String tel) {
		
		Result result = new Result(1000); //1000----成功
		
		int r = userService.isTelExist(tel);
		
		result.setData(r);
		
		return result;
	}
	
	
	/**
	 * 用户注册
	 * 
	 */
	@RequestMapping("/register02")
	@ResponseBody
	public Result register02(User u) {
		Result result = new Result();
		
		//手机号是否已经存在
		
		int r = userService.isTelExist(u.getTel());
		
		if(r == 1) {
			result.setCode(2000);
			result.setMsg("改手机号已经存在");
			return result;
		}
		userService.register(u);
		result.setCode(1000);
		result.setMsg("ok");
		
		return result;
	}
	
	/**
	 * 跳转到后台页面
	 * 
	 */
	@RequestMapping("/backManagePage")
	public String backManagePage() {
		return "platform/index";
		
	}
	
	
	/**
	 * 跳转到修改密码页面
	 * 
	 */
	@RequestMapping("/changePwdPage")
	public String changePwdPage() {
		return "user/changePassword";
		
	}
	
	
	
	/**
	 * 
	 * 修改密码
	 */
	  @RequestMapping("/changePwd")
	  @ResponseBody 
	  public Result changePwd(String oldPwd, String newpassword,String uname,Model model) { 
		 Result result = new Result();
		 System.out.println(uname);
		 System.out.println(oldPwd); 
		 System.out.println(newpassword); // userService.changePwd(uid,pwd);
		 
		 int r = userService.modifyPassword(newpassword, uname);
		 
		 model.addAttribute("msg","修改密码成功");
		 if(r == 0) {
			 result.setCode(2000);
			 result.setData(0);
			 result.setMsg("密码修改失败");
		 }
		 
		 result.setCode(1000);
		 result.setData(1);
		 result.setMsg("修改密码成功");
		 
	  return result;
	 
	 }
	  
	  /**
	   * 根据分页查询商品
	   * @param currentPage
	   * @param pageSize
	   * @return
	   */
	  @RequestMapping("findProductByPage")
	  @ResponseBody
	  public Page findProductByPage(@RequestParam(defaultValue = "0")int currentPage, @RequestParam(defaultValue = "6")int pageSize) {
		
		  Page page = productService.findProductListByPage(currentPage, 4);
		  
		  return page;
	  }
	  
	  /**
	   * 退出登录
	   * 
	   */
	  @RequestMapping("loginOut")
	  public void loginOut(HttpServletRequest request, HttpServletResponse response) {
		  System.out.println(request.getSession().getValue("userInfo"));
		  
		  //可以返回当前页面所在的服务器的名字
		  System.out.println(request.getServerName());

		  Object u = request.getSession().getValue("userInfo");
		  
		  
		  //后端删除cookie
		  int r = userService.deleteToken(((User) u).getUid());
		  
		  
		  //前端删除cookie
		  Cookie[] cookies = request.getCookies();
		  if(cookies != null) {
			  cookies[0].setMaxAge(0);
		  }
		  
		  //清空session
		  request.getSession().removeAttribute("userInfo");
		  request.getSession().invalidate();
		  
		  //最后转到登录界面
		  try {
			response.sendRedirect("/ssm/user_loginOut_forward.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	  }
	  
	  //商品详情
	  @RequestMapping("/shopDetailPage")
	  public String shopDetailPage() {
		return "user/shopDetail";
	  }
	  
	//购物车跳转页面
	  @RequestMapping("/shopCartPage")
	  public String shopCartPage() {
		return "user/shopCart";
	  }
	

	  @RequestMapping("showShopCart")
	  @ResponseBody
	  public List<Product> showShopCart(int uid) {
		  
		  List<Product> product = productService.showShopCart(uid);
		  
		  return product;
	  }
	  
	  
	  
	  
	  @RequestMapping("/shopDetail")
	  @ResponseBody
	  public Product shopDetail(int id) {
		  
		  Product product = productService.findShopDetail(id);
		  
		  return product;
	  }
	  
	  
	  @RequestMapping("shopCart")
	  @ResponseBody
	  public Product shopCart(int id, HttpSession session) {
		  
		  Product product = productService.findShopDetail(id);
		  if(session.getAttribute("userInfo")!=null) {
			  User u = (User) session.getAttribute("userInfo");
			  System.out.println(u.getUid());
			  int t = productService.addShopCart(product.getProdId(),u.getUid());
		  }else {
			  System.out.println("请先登录");
		  }
		  
		  return product;
	  }
	  
	  

}
