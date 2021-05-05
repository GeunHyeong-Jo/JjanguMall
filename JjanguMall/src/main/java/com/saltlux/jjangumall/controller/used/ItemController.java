package com.saltlux.jjangumall.controller.used;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.saltlux.jjangumall.dto.used.ImageVo;
import com.saltlux.jjangumall.dto.used.ItemDetailVo;
import com.saltlux.jjangumall.dto.used.ItemVo;
import com.saltlux.jjangumall.dto.used.PagingVo;
import com.saltlux.jjangumall.dto.used.SearchVo;
import com.saltlux.jjangumall.dto.used.UserVo;
import com.saltlux.jjangumall.security.Auth;
import com.saltlux.jjangumall.service.used.ItemService;

@Controller
@RequestMapping("/used")
public class ItemController {

	@Autowired
	ItemService itemService;

	@RequestMapping("/index")
	public String index(Model model) {
		List<ItemVo> list = itemService.index();

		model.addAttribute("itemList", list);
		return "used/item/index";
	}
	
	
	@RequestMapping("/index/{page}")
	public String index(@PathVariable("page") Long page, Model model) {
		

		List<ItemVo> itemList = itemService.index(page - 1);
		PagingVo pageVo = new PagingVo(page, itemService.itemCount());
		
		System.out.println(pageVo);
	
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageVo", pageVo);
		
		return "used/item/index";	
	}
	
	@RequestMapping("/search/{page}")
	public String search(Model model, SearchVo vo) {
		Long page = vo.getPage();
		vo.setPage(vo.getPage() - 1);
		List<ItemVo> list = itemService.search(vo);
		vo.setPage(vo.getPage() * 3);
		PagingVo pageVo = new PagingVo(page, itemService.itemCount(vo));
		
		for(ItemVo itemVo : list) {
			System.out.println(itemVo);
		}
		
		model.addAttribute("searchVo", vo);
		model.addAttribute("itemList", list);
		model.addAttribute("pageVo", pageVo);
		
		return "used/item/searchindex";
	}

	@Auth
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist() { 

		return "used/item/regist";
	}
	
	@Auth
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(ItemVo vo, HttpServletRequest request, List<MultipartFile> pictures) {

		HttpSession session = request.getSession();
		UserVo authUser = (UserVo) session.getAttribute("authUser");
	
		vo.setUserId(authUser.getId());

		itemService.regist(vo, pictures);

		return "redirect:/used/index";
	}
	
	@RequestMapping("/detail/{no}")
	public String detail(@PathVariable("no") Long no, Model model) {

		ItemDetailVo vo = itemService.detail(no);
		List<ImageVo> imageList = itemService.getImageNo(no);
		for(ImageVo ivo : imageList) {
			System.out.println(ivo);
		}
		model.addAttribute("imageList", imageList);
		model.addAttribute("vo", vo);
		return "used/item/detail";
	}
	
}
