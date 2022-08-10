package com.mall.persistence;

import java.util.List;

import com.mall.domain.CategoryVO;
import com.mall.domain.GoodsVO;

public interface AdminDAO {
	
	// 카테고리
	public List<CategoryVO> category() throws Exception;
	
	// 상품등록
	public void register(GoodsVO vo) throws Exception;
	
	// 상품리스트
	public List<GoodsVO> goodslist() throws Exception;

}
