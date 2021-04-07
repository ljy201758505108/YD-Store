package com.yanda.service;

import java.util.List;

import com.yanda.bean.Page;
import com.yanda.bean.Product;

public interface ProductService {

	Page findProductListByPage(int currentPage, int pageSize); //根据分页查询商品列表

	Product findShopDetail(int id);//根据id查找商品详情

	//int addShopCart(int prodId);

	int addShopCart(int prodId, int uid);//添加指定id的商品到购物车

	List<Product> showShopCart(int uid);

}
