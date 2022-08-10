package com.mall.persistence;

import java.util.List;

import com.mall.domain.CategoryVO;
import com.mall.domain.GoodsVO;
import com.mall.domain.GoodsViewVO;

public interface AdminDAO {
	
	// 카테고리
	public List<CategoryVO> category() throws Exception;
	
	// 상품등록
	public void register(GoodsVO vo) throws Exception;
	
	// 상품리스트
	public List<GoodsVO> goodslist() throws Exception;
	
	// 상품 상세페이지(조회)
	// public GoodsVO goodsView(int gdsNum) throws Exception;
	
	// 상품 상세페이지(조회) + 카페고리 조인
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	// 상품수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	// 상품삭제
	public void goodsDelete(int gdsNum) throws Exception;

}
