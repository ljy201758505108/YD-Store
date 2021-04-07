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
	 * ��֤�ֻ����Ƿ����
	 */
	@RequestMapping("/isTelExist")
	@ResponseBody
	public Result isTelExist(String tel) {
		
		Result result = new Result(1000); //1000----�ɹ�
		
		int r = businessService.isTelExist(tel);
		
		result.setData(r);
		
		return result;
	}
	
	/**
	 * ��֤��ݺ��Ƿ����
	 */
	@RequestMapping("/isIDCardExist")
	@ResponseBody
	public Result isIDCardExist(String idcard) {
		
		Result result = new Result(1000); //1000----�ɹ�
		
		int r = businessService.isIDCardExist(idcard);
		
		result.setData(r);
		
		return result;
	}
	
	/**
	 * ��֤�����Ƿ����
	 */
	@RequestMapping("/isEmailExist")
	@ResponseBody
	public Result isEmailExist(String email) {
		
		Result result = new Result(1000); //1000----�ɹ�
		
		int r = businessService.isEmailExist(email);
		
		result.setData(r);
		
		return result;
	}
	/**
	 * ���ϴ������֤ͼƬ���ļ������浽���ݿ�
	 * @param tx
	 * @param request
	 */
	@RequestMapping("/upload")
	public Result upload(@RequestParam MultipartFile[] idcard,HttpServletRequest request)
	{
		Result result = new Result();
		
		System.out.println("�ϴ���������");
		//��ȡ��Ŀ�ķ���Ŀ¼
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
				result.setMsg("�ϴ��ɹ�");
			}
			
			
		} catch (IllegalStateException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		} catch (IOException e) {
			// TODO �Զ����ɵ� catch ��
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
			result.setMsg("���ֻ����Ѿ�����");
			return result;
		}
		if(idcard == 1) {
			result.setCode(2000);
			result.setMsg("�����֤���Ѿ�����");
			return result;
		}
		if(email == 1){
			result.setCode(2000);
			result.setMsg("�������Ѿ�ע���");
			return result;
		}
		System.out.println("00000000000000000000");
		businessService.register(b);
		System.out.println("asgdfhjkl;");
		result.setCode(1000);
		result.setMsg("ok");
		String text = "�������Ӽ��� http://localhost:8080/ssm/business/activePage.action";
		try {
			JrUtil.sendEMail("����������",b.getEmail() , "�ʼ�����", text);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	/**
	 * E-mail����ҳ��
	 * 
	 */
	@RequestMapping("/activePage")
	public String activePage() {
		return "business/active";
		
	}
	
	/**
	 * ��ת����¼����
	 * 
	 */
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "business/login";
	}
	
	
	/**
	 * ��¼����ʵ��
	 * 
	 */
	@RequestMapping("login")
	@ResponseBody
	public Result login(String tel, String email, String pwd,HttpSession session) {
		Result result = new Result();
		
		//��¼��Ϣ�Ƿ���ȷ
		Business b = businessService.login(tel,email,MD5JIaMi.MD5(pwd));
		
		System.out.println(b);
		//�����¼��Ϣ����ȷ
		if(b == null) {
			result.setCode(2000);
			result.setMsg("�û������������");
			return result;
		}
		
		session.setAttribute("businessInfo", b);
		
		result.setCode(1000);
		result.setMsg("��¼�ɹ�");
		
		return result;
	}
	
	/**
	 * �̼ҵ���ע��
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
		result.setMsg("����ע��ɹ�");
		
		return result;
		
	}
	/**
	 * ���D�����ע�Խ���
	 */
	@RequestMapping("/shop_register")
	public String shop_register() {
		
		return "business/shop_register";
	}
	/**
	 * ���̱�־ע��---��logo���浽���ݿ���
	 * 
	 */
	@RequestMapping("/uploadShopLogo")
	@ResponseBody
	public Result uploadShopLogo(@RequestParam MultipartFile shopLogo,HttpServletRequest request) {
		Result result = new Result();
		System.out.println("�ϴ���������");
		
		//��ȡ��Ŀ�ķ���Ŀ¼
		String appPath = request.getServletContext().getRealPath("shopLogo");
		System.out.println(appPath);
		
		try {
			String fname = shopLogo.getOriginalFilename();
			String path = appPath+"/"+fname;
			shopLogo.transferTo(new File(path));
			//�����̱�־���ļ����浽���ݿ⣬����������
			int r = businessService.addShopLogoPath(path);
			
			if(r!=0) {
				result.setMsg("�ϴ��ɹ�");
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
