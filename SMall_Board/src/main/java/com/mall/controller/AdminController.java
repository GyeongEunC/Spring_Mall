package com.mall.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mall.domain.CategoryVO;
import com.mall.domain.GoodsVO;
import com.mall.service.AdminService;

import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	// 관리자화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		log.info("get index");
	}
	
	// 상품등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRerister(Model model) throws Exception {
		log.info("goods_Register");
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	// 상품등록_post
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(GoodsVO vo) throws Exception {
		log.info("post goods_Register");
		adminService.register(vo);
		
		return "redirect:/admin/index";
	}
	
	// 상품리스트
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception {
		log.info("GoodsList");
		List<GoodsVO> list = adminService.goodslist();
		model.addAttribute("list", list);
	}

}
