package com.yanda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanda.bean.Page;
import com.yanda.bean.Product;
import com.yanda.mapper.ProductMapper;
import com.yanda.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductMapper productMapper;

	public Page findProductListByPage(int currentPage, int pageSize) {

		Page page = new Page();
		
		int dataNum = productMapper.productCount(); //查询所有的商品数目
		
		page.setCurrentPage(currentPage);
		page.setDataNum(dataNum);
		page.setAllPage(dataNum%pageSize==0?dataNum/pageSize:dataNum/pageSize+1);
		
		List prodList = productMapper.findProductByPage(currentPage*pageSize, pageSize); //根据limit关键字，查询商品
		
		page.setData(prodList);  //查询到的具体商品（为一个对象）
		
		return page;
	}

	public Product findShopDetail(int id) {
		// TODO Auto-generated method stub
		return productMapper.findProductById(id);
	}

	public int addShopCart(int prodId,int uid) {
		// TODO Auto-generated method stub
		
		return productMapper.addShopCart(prodId,uid);
	}

	public List<Product> showShopCart(int uid) {
		// TODO Auto-generated method stub
		return productMapper.findShopCartProductByUid(uid);
	}

}
