package com.yanda.service;

import java.util.List;

import com.yanda.bean.Page;
import com.yanda.bean.Product;

public interface ProductService {

	Page findProductListByPage(int currentPage, int pageSize); //���ݷ�ҳ��ѯ��Ʒ�б�

	Product findShopDetail(int id);//����id������Ʒ����

	//int addShopCart(int prodId);

	int addShopCart(int prodId, int uid);//���ָ��id����Ʒ�����ﳵ

	List<Product> showShopCart(int uid);

}
