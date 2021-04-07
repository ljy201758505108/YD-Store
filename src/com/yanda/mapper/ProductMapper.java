package com.yanda.mapper;

import java.util.List;

import com.yanda.bean.Page;
import com.yanda.bean.Product;
import com.yanda.bean.User;

public interface ProductMapper {

	
	public User findTelAndPwd(String tel, String pwd);

	public int productCount(); //查询商品总数

	public List findProductByPage(int currentPage, int pageSize); //根据分页查询商品

	public Product findProductById(int id);//根据id找到商品

	//public int addShopCart(int prodId);

	public int addShopCart(int prodId, int uid);

	public List<Product> findShopCartProductByUid(int uid);//根据登录的用户在购物车表中找到其添加的商品
		
		
}
