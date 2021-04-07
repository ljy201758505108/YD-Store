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
		
		int dataNum = productMapper.productCount(); //��ѯ���е���Ʒ��Ŀ
		
		page.setCurrentPage(currentPage);
		page.setDataNum(dataNum);
		page.setAllPage(dataNum%pageSize==0?dataNum/pageSize:dataNum/pageSize+1);
		
		List prodList = productMapper.findProductByPage(currentPage*pageSize, pageSize); //����limit�ؼ��֣���ѯ��Ʒ
		
		page.setData(prodList);  //��ѯ���ľ�����Ʒ��Ϊһ������
		
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
