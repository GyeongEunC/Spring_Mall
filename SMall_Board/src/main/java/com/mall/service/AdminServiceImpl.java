package com.mall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mall.domain.CategoryVO;
import com.mall.domain.GoodsVO;
import com.mall.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;

	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public List<GoodsVO> goodslist() throws Exception {
		System.out.println("서비스");
		return dao.goodslist();
	}

}
