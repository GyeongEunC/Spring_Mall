package com.mall.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mall.domain.CategoryVO;
import com.mall.domain.GoodsVO;
import com.mall.domain.GoodsViewVO;
import com.mall.service.AdminService;
import com.mall.utils.UploadFileUtils;

import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
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
	public String postGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {
		log.info("post goods_Register");
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
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
	
	// 상품 상세페이지
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception {
		log.info("GoodsView");
		GoodsViewVO goods = adminService.goodsView(gdsNum);
		model.addAttribute("goods", goods);
	}
	
	// 상품수정_get
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception {
		log.info("GoodsModify");
		GoodsViewVO goods = adminService.goodsView(gdsNum);
		model.addAttribute("goods", goods);
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	// 상품수정_post
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo) throws Exception {
		log.info("post GoodsModify");
		adminService.goodsModify(vo);
		
		return "redirect:/admin/index";
	}
	
	// 삭품삭제
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
		log.info("post GoodsDelete");
		adminService.goodsDelete(gdsNum);
		
		return "redirect:/admin/index";
	}

}
