package com.mall.service;

import java.util.List;

import com.mall.domain.CategoryVO;
import com.mall.domain.GoodsVO;

public interface AdminService {
	
	public List<CategoryVO> category() throws Exception;
	
	public void register(GoodsVO vo) throws Exception;

}
