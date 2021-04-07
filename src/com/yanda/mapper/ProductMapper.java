package com.yanda.mapper;

import java.util.List;

import com.yanda.bean.Page;
import com.yanda.bean.Product;
import com.yanda.bean.User;

public interface ProductMapper {

	
	public User findTelAndPwd(String tel, String pwd);

	public int productCount(); //��ѯ��Ʒ����

	public List findProductByPage(int currentPage, int pageSize); //���ݷ�ҳ��ѯ��Ʒ

	public Product findProductById(int id);//����id�ҵ���Ʒ

	//public int addShopCart(int prodId);

	public int addShopCart(int prodId, int uid);

	public List<Product> findShopCartProductByUid(int uid);//���ݵ�¼���û��ڹ��ﳵ�����ҵ�����ӵ���Ʒ
		
		
}
