package com.yanda.controller.platform;

import java.io.IOException;
import java.util.Date;

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
import com.yanda.bean.PlatformAccount;
import com.yanda.bean.Result;
import com.yanda.service.PlatformAccountService;

@Controller
@RequestMapping("platform")
public class PlatFormIndexController {
	
	@Autowired
	PlatformAccountService platformAccountService;
	
	@RequestMapping("index")
	/**
	 * ��ת����̨��ҳ
	 * @return
	 */
	public String index() {
		
		return "platform/index";
	}
	

	/**
	 * ��ת����¼����
	 * 
	 */
	@RequestMapping("loginPage")
	public String loginPage() {
		return "platform/login";
	}
	
	
	/**
	 * ʵ�ֵ�¼
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Result login(String account, String pwd,HttpSession session)
	{
		Result result = new Result(1000);
		PlatformAccount pacc = platformAccountService.login(account, pwd);
		
		
		
		if (pacc == null)
		{
			
			int count = session.getAttribute("pwdErrCount")==null?0:(Integer)session.getAttribute("pwdErrCount");
			session.setAttribute("pwdErrCount", ++count);
			
			if ( count == 3 )
			{
				result.setData(2);
				result.setMsg("�˻��Ѷ���");
				platformAccountService.djAcc(account, new Date(new Date().getTime()+1000*60*60));
				
				
				
			}
			else
			{
				result.setData(0);
				result.setMsg("");
			}
			
			return result;
		}
		if ( new Date().getTime() < pacc.getDjTime().getTime() )
		{
			result.setData(2);
			result.setMsg("�ѱ�����");
			return result;
		}
		
		session.setAttribute("paccInfo", pacc);
		
		result.setData(1);
		
		return result;
	}
	
	/**
	 * �˳���¼
	 * @param request
	 * @param response
	 */
	@RequestMapping("loginOut")
	public void loginOut(HttpServletRequest request, HttpServletResponse response) {
		
		 request.getSession().removeAttribute("paccInfo");
		 request.getSession().invalidate();
		
		 try {
			response.sendRedirect("/ssm/pacc_loginOut_forward.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/welcome")
	public String welcome()
	{
		return "platform/welcome";
	}
	@RequestMapping("/accountManage")
	public String accountManag(Model model)
	{
		Page page=platformAccountService.findPagePlatform(0,6);
		model.addAttribute("platformList",page);
		System.out.println(page);
		System.out.println("====="+model);
		return "platform/accountManage";
	}
	
	@RequestMapping("/findPlatformByPage")
	@ResponseBody
	public Page findPlatformByPage(@RequestParam(defaultValue = "0")int currentPage,@RequestParam(defaultValue = "6") int everyPageNum)
	{
		
		Page page = platformAccountService.findPagePlatform(currentPage, everyPageNum);
		return page;
	}
	@RequestMapping("/searchPlatform")
	@ResponseBody
	public Page searchPlatform(@RequestParam("accname")String accname,@RequestParam("name")String name,@RequestParam("status")String status,@RequestParam(defaultValue = "0")int currentPage,@RequestParam(defaultValue = "6") int everyPageNum)
	{
		 Page page=platformAccountService.fuzzyFind(accname, name, status, currentPage, everyPageNum);
		 return page;
	}
	@RequestMapping("/updateStatus")
	@ResponseBody
	public Result updateStatus(@RequestParam("status")String status,@RequestParam("accname")String accname,@RequestParam("name")String name)
	{
		System.out.println(name);
		Result result=new Result();
		platformAccountService.updateStatus(status, accname, name);
		return result;
	}
	@RequestMapping("/updateName")
	@ResponseBody
	public void updateName(String newName,String accname,String name)
	{
		platformAccountService.updateName(newName,accname,name);
	}
	@RequestMapping("/deletePlatform")
	@ResponseBody
	public void deletePlatform(String accname,String name)
	{
		platformAccountService.deletePlatform(accname, name);
	}
	
	
	
	
	/**
	 * ��ת���̼ҹ������
	 */
	@RequestMapping("/businessManagePage")
	public String businessManagePage(Model model) {
		Page page = platformAccountService.findBusinessByPage(0,6);
		model.addAttribute("businessList",page);
		System.out.println(page);
		System.out.println("====="+model);
		
		return "platform/businessManage";
	}
	
	
	/**
	 * �̼ҹ���---��ҳ��ѯ�̼���Ϣ
	 * 
	 */
	@RequestMapping("/findBusinessByPage")
	@ResponseBody
	public Page findBusinessByPage(@RequestParam(defaultValue = "0")int currentPage,@RequestParam(defaultValue = "6") int everyPageNum)
	{
		
		Page page = platformAccountService.findBusinessByPage(currentPage, everyPageNum);
		return page;
	}
	
	/**
	 * �̼ұ�ģ����ѯ
	 * @param accname
	 * @param name
	 * @param status
	 * @param currentPage
	 * @param everyPageNum
	 * @return
	 */
	@RequestMapping("/searchBusiness")
	@ResponseBody
	public Page searchBusiness(@RequestParam("tel")String tel,@RequestParam("bname")String bname,@RequestParam(defaultValue = "0")int currentPage,@RequestParam(defaultValue = "6") int everyPageNum)
	{
		 Page page=platformAccountService.fuzzyFindBusiness(tel, bname, currentPage, everyPageNum);
		 return page;
	}
	
	/**
	 * ��������Ա�˺�
	 * 
	 */
	@RequestMapping("/createAdmin")
	@ResponseBody
	public Result createAdmin(PlatformAccount pacc) {
		
		pacc.setStatus("1");
		
		System.out.println(pacc.getAccname());
		System.out.println(pacc.getName());
		
		Result result = new Result();
		
		int r = platformAccountService.createAdmin(pacc);
		
		if(r!=0) {
			result.setMsg("��������Ա�˺ųɹ�");
		}
		
		return result;
		
	}

}
