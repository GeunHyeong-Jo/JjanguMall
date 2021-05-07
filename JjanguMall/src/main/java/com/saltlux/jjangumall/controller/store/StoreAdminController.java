package com.saltlux.jjangumall.controller.store;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

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

import com.saltlux.jjangumall.dto.ProductDTO;
import com.saltlux.jjangumall.dto.UserDTO;
import com.saltlux.jjangumall.security.Auth;
import com.saltlux.jjangumall.service.store.StoreProductService;
import com.saltlux.jjangumall.service.store.StoreUserService;

@Controller
@RequestMapping("/admin")
@Auth(role="admin")
public class StoreAdminController {

	@Autowired
	private StoreUserService storeUserService;
	
	@Autowired
	private StoreProductService storeProductService;
	
	@Autowired
	private String uploadPath;
	
	//관리자 메인 - 상품관리 페이지 뜨도록
	@RequestMapping(value="/productList", method=RequestMethod.GET)
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> list = storeProductService.get_goods_list();
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
		UserDTO adminDTO = new UserDTO();
		adminDTO = storeUserService.adminLogin(id, pwd);
		if(adminDTO==null) {
			return "login_fail";
		} else {
			//세션
			session.setAttribute("adminId",adminDTO.getUserId());
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
	public String productRegist(@ModelAttribute ProductDTO productDTO
			, @RequestParam MultipartFile thumbFile) {
		
		System.out.println("상품등록프로세스실행");	
		System.out.println("storeProductService.getProductNo()="+storeProductService.getProductNo());
		//상품코드 젤 위에 가져오기
		int seq= storeProductService.getProductNo()+1;		
		
		System.out.println("seq="+seq);
		
		//파일경로설정 - 옮겨받으시면 경로수정 꼭 해주세용

		String thumbImgPath = uploadPath;
		
		//파일 이름 지정
		int thumbImgName = seq;
		
		//파일 생성 
		File thumbImgFile = new	File(thumbImgPath, thumbImgName+".jpg"); 
		 
		try { 
			System.out.println("파일복사");
			FileCopyUtils.copy(thumbFile.getBytes(), thumbImgFile);
		} catch (IOException e)	{ 
			// TODO Auto-generated catch block e.printStackTrace(); }
		}
		//파일이름부여
		productDTO.setImg(thumbImgName);
		System.out.println(productDTO);
		//상품등록 본체 db
		int su = storeProductService.productRegist(productDTO);
		
		if(su==1) 			
			return "redirect:/admin/productList";
		else
			return "redirect:/admin/productList";
	}
	
	
	@RequestMapping(value="/productModifyForm",method= RequestMethod.GET)
	public ModelAndView productModifyForm(@RequestParam int productNo, Model model) {
		ProductDTO productDTO = storeProductService.getGoodsView(productNo);
		
		ModelAndView mav = new ModelAndView();	
		mav.addObject("productDTO", productDTO);
		mav.addObject("display","/admin/product/productModifyForm.jsp");
		mav.setViewName("/admin/index");
		return mav;
	}
	

	@RequestMapping(value="/productModify", method=RequestMethod.POST)
	public String productModify(@ModelAttribute ProductDTO productDTO
			, @RequestParam MultipartFile thumbFile) {
		
		int seq = productDTO.getProductNo();
		System.out.println("수정상품내용="+productDTO);
		if(thumbFile.isEmpty()==false) {//썸네일 있을때 이미지 수정
			String thumbImgName = seq+".jpg";
			String thumbImgPath = uploadPath;
			File thumbImgFile = new	File(thumbImgPath, thumbImgName); 
			try {
				System.out.println("파일복사");
				FileCopyUtils.copy(thumbFile.getBytes(), thumbImgFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			productDTO.setImg(seq);
		}	
		
		//재고추가기능
		productDTO.setStockQty(productDTO.getStockQty()+productDTO.getAddQty());
		productDTO.setTotalQty(productDTO.getTotalQty()+productDTO.getAddQty());
		
		//상품 수정 DB
		storeProductService.productModify(productDTO);
		
		return "redirect:/admin/productList";
	}
	
	@RequestMapping(value="/productDelete",method= RequestMethod.POST)
	public String productDelete(@RequestParam String[] check, Model model) {
		for(String productNo : check)
			storeProductService.productDelete(productNo);
		
		return "redirect:/admin/productList";
	}

	
}
