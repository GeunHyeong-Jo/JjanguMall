package com.saltlux.mysite.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.mysite.dto.AdminDTO;
import com.saltlux.mysite.dto.GoodsDTO;
import com.saltlux.mysite.dto.OrderDTO;
import com.saltlux.mysite.dto.OrderlistDTO;
import com.saltlux.mysite.security.Auth;
import com.saltlux.mysite.service.AdminService;
import com.saltlux.mysite.service.GoodsService;
import com.saltlux.mysite.service.OrderService;



@Auth(role="admin")
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private OrderService orderService;
	
	//관리자 메인 - 상품관리 페이지 뜨도록
	@RequestMapping(value="/productList", method=RequestMethod.GET)
	public ModelAndView statisticsList() {
		ModelAndView mav = new ModelAndView();
		List<GoodsDTO> list = goodsService.get_goods_list_newP();
		System.out.println("admin의 상품관리리스트="+list);
		mav.addObject("list", list);		
		mav.addObject("display","/admin/product/productList.jsp");
		mav.setViewName("/admin/index");
		return mav;
	}
	
	// 관리자 로그인폼 화면
	@RequestMapping(value={"","/loginForm"},method=RequestMethod.GET)
	public String login() {
		return "/admin/loginForm";
	}
	
	//관리자 로그인 처리
	@RequestMapping(value="/loginProcess", method=RequestMethod.POST)
	@ResponseBody
	public String loginProcess(@RequestParam String id, @RequestParam String pwd, HttpSession session) {
		AdminDTO adminDTO = new AdminDTO();
		adminDTO = adminService.loginProcess(id, pwd);
		if(adminDTO==null) {
			return "login_fail";
		} else {
			//세션
			session.setAttribute("adName",adminDTO.getName());
			session.setAttribute("adId",adminDTO.getId());
			return "login_ok";
		}
	}
	
	//관리자 로그아웃 처리
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/admin/loginForm");
	}
	
	//상품등록폼
	@RequestMapping(value="/productRegistForm",method=RequestMethod.GET)
	public ModelAndView productRegist() {
		ModelAndView mav = new ModelAndView();		
		mav.addObject("display","/admin/product/productRegistForm.jsp");
		mav.setViewName("/admin/index");
		return mav;
	}
	
	
	 
	@RequestMapping(value="/productRegist", method=RequestMethod.POST)
	public String productRegist(@ModelAttribute GoodsDTO goodsDTO
			, @RequestParam MultipartFile thumbFile) {
		
		System.out.println("상품등록프로세스실행");	
		
		//상품코드 젤 위에 가져오기
		int seq = goodsService.getProductCode()+1;		
		System.out.println(seq);
		
		//파일경로설정 - 옮겨받으시면 경로수정 꼭 해주세용

		String thumbImgPath = "C:\\Users\\32153256\\Desktop\\ssong\\soltlux\\TILJAVA\\workspace_Servlet_JSP\\miniproject\\src\\main\\webapp\\assets\\image\\thumb"; 
		
		//파일 이름 지정
		String thumbImgName = seq+".jpg";
		
		//파일 생성 
		File thumbImgFile = new	File(thumbImgPath, thumbImgName); 
		 
		try { 
			FileCopyUtils.copy(thumbFile.getInputStream(), new FileOutputStream(thumbImgFile));
		} catch (IOException e)	{ 
			// TODO Auto-generated catch block e.printStackTrace(); }
		}
		//파일이름부여
		goodsDTO.setThumbImg(thumbImgName);
		
		//상품등록 본체 db
		int su = goodsService.productRegist(goodsDTO);
		
		if(su==1) 			
			return "redirect:/admin/productList";
		else
			return "redirect:/admin/productList";
	}
	
	
	@RequestMapping(value="/productModifyForm",method= RequestMethod.GET)
	public ModelAndView productModifyForm(@RequestParam int productCode, Model model) {
		GoodsDTO goodsDTO = goodsService.getGoodsView(productCode);
		
		ModelAndView mav = new ModelAndView();	
		mav.addObject("goodsDTO", goodsDTO);
		mav.addObject("display","/admin/product/productModifyForm.jsp");
		mav.setViewName("/admin/index");
		return mav;
	}
	

	@RequestMapping(value="/productModify", method=RequestMethod.POST)
	public String productModify(@ModelAttribute GoodsDTO goodsDTO
			, @RequestParam MultipartFile thumbFile) {
		
		int seq = goodsDTO.getProductCode();
		
		if(thumbFile.isEmpty()==false) {//썸네일 있을때 이미지 수정
			String thumbImgName = seq+".jpg";
			String thumbImgPath = "C:\\Users\\32153256\\Desktop\\ssong\\soltlux\\TILJAVA\\workspace_Servlet_JSP\\miniproject\\src\\main\\webapp\\assets\\image\\thumb";
			File thumbImgFile = new	File(thumbImgPath, thumbImgName); 
			try {
				FileCopyUtils.copy(thumbFile.getInputStream(), new FileOutputStream(thumbImgFile));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			goodsDTO.setThumbImg(thumbImgName);
		}	
		
		//재고추가기능
		goodsDTO.setStockQty(goodsDTO.getStockQty()+goodsDTO.getAddQty());
		goodsDTO.setTotalQty(goodsDTO.getTotalQty()+goodsDTO.getAddQty());
		
		//상품 수정 DB
		goodsService.productModify(goodsDTO);
		
		return "redirect:/admin/productList";
	}
	
	@RequestMapping(value="/productDelete",method= RequestMethod.POST)
	public String productDelete(@RequestParam String[] check, Model model) {
		for(String productCode : check)
			goodsService.productDelete(productCode);
		
		return "redirect:/admin/productList";
	}

	
}
