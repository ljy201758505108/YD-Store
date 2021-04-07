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
	 * ��ת����ҳ����
	 * 
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		//��ѯ��Ʒ��Ϣ
		Page page = productService.findProductListByPage(0,4);
		
		model.addAttribute("page", page);
		
		return "user/index";
		
	}
	
	/**
	 * ��ת����¼����
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
	 * ��¼����ʵ��
	 */
	@RequestMapping("login")
	@ResponseBody
	public Result login(String tel, String pwd, boolean isRemember, HttpSession session,HttpServletResponse response) {
		Result result = new Result();
		
		//��¼��Ϣ�Ƿ���ȷ
		User u = userService.login(tel,MD5JIaMi.MD5(pwd));
		
		//�����¼��Ϣ����ȷ
		if(u == null) {
			result.setCode(2000);
			result.setMsg("�û������������");
			return result;
		}
		else {
			if(isRemember) {
				//��������
				String autoLoginToken = UUID.randomUUID().toString();
				
				System.out.println(autoLoginToken);
				
				//���ݿⱣ������
				userService.addToken(u.getUid(),autoLoginToken,"autoLogin", new Date(new Date().getTime()+1000L*1*60*60*24*365));
				
				//ǰ̨�������������
				Cookie c = new Cookie("altoken",autoLoginToken);
				c.setMaxAge(60*60*24*365);  //�������ƴ洢ʱ��Ϊһ��
				response.addCookie(c); //����������Ϣ��Ӧ��ǰ��
			}
			
		}
		session.setAttribute("userInfo", u);
		
		result.setCode(1000);
		result.setMsg("��¼�ɹ�");
		
		return result;
		
	}
	
	
	
	/**
	 * ��ת��ע�����
	 * 
	 */
	@RequestMapping("/registerPage")
	public String registerPage() {
		return "user/register02";
		
	}
	
	/**
	 * ��֤�ֻ����Ƿ����
	 */
	@RequestMapping("isTelExist")
	@ResponseBody
	public Result isTelExist(String tel) {
		
		Result result = new Result(1000); //1000----�ɹ�
		
		int r = userService.isTelExist(tel);
		
		result.setData(r);
		
		return result;
	}
	
	
	/**
	 * �û�ע��
	 * 
	 */
	@RequestMapping("/register02")
	@ResponseBody
	public Result register02(User u) {
		Result result = new Result();
		
		//�ֻ����Ƿ��Ѿ�����
		
		int r = userService.isTelExist(u.getTel());
		
		if(r == 1) {
			result.setCode(2000);
			result.setMsg("���ֻ����Ѿ�����");
			return result;
		}
		userService.register(u);
		result.setCode(1000);
		result.setMsg("ok");
		
		return result;
	}
	
	/**
	 * ��ת����̨ҳ��
	 * 
	 */
	@RequestMapping("/backManagePage")
	public String backManagePage() {
		return "platform/index";
		
	}
	
	
	/**
	 * ��ת���޸�����ҳ��
	 * 
	 */
	@RequestMapping("/changePwdPage")
	public String changePwdPage() {
		return "user/changePassword";
		
	}
	
	
	
	/**
	 * 
	 * �޸�����
	 */
	  @RequestMapping("/changePwd")
	  @ResponseBody 
	  public Result changePwd(String oldPwd, String newpassword,String uname,Model model) { 
		 Result result = new Result();
		 System.out.println(uname);
		 System.out.println(oldPwd); 
		 System.out.println(newpassword); // userService.changePwd(uid,pwd);
		 
		 int r = userService.modifyPassword(newpassword, uname);
		 
		 model.addAttribute("msg","�޸�����ɹ�");
		 if(r == 0) {
			 result.setCode(2000);
			 result.setData(0);
			 result.setMsg("�����޸�ʧ��");
		 }
		 
		 result.setCode(1000);
		 result.setData(1);
		 result.setMsg("�޸�����ɹ�");
		 
	  return result;
	 
	 }
	  
	  /**
	   * ���ݷ�ҳ��ѯ��Ʒ
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
	   * �˳���¼
	   * 
	   */
	  @RequestMapping("loginOut")
	  public void loginOut(HttpServletRequest request, HttpServletResponse response) {
		  System.out.println(request.getSession().getValue("userInfo"));
		  
		  //���Է��ص�ǰҳ�����ڵķ�����������
		  System.out.println(request.getServerName());

		  Object u = request.getSession().getValue("userInfo");
		  
		  
		  //���ɾ��cookie
		  int r = userService.deleteToken(((User) u).getUid());
		  
		  
		  //ǰ��ɾ��cookie
		  Cookie[] cookies = request.getCookies();
		  if(cookies != null) {
			  cookies[0].setMaxAge(0);
		  }
		  
		  //���session
		  request.getSession().removeAttribute("userInfo");
		  request.getSession().invalidate();
		  
		  //���ת����¼����
		  try {
			response.sendRedirect("/ssm/user_loginOut_forward.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	  }
	  
	  //��Ʒ����
	  @RequestMapping("/shopDetailPage")
	  public String shopDetailPage() {
		return "user/shopDetail";
	  }
	  
	//���ﳵ��תҳ��
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
			  System.out.println("���ȵ�¼");
		  }
		  
		  return product;
	  }
	  
	  

}
