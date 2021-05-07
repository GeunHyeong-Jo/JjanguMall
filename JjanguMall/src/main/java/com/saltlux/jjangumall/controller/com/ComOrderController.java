package com.saltlux.jjangumall.controller.com;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.jjangumall.dto.OrderDTO;
import com.saltlux.jjangumall.dto.OrderSettleDTO;
import com.saltlux.jjangumall.dto.OrderlistDTO;
import com.saltlux.jjangumall.dto.UserDTO;
import com.saltlux.jjangumall.dto.com.CartAndProductDTO;
import com.saltlux.jjangumall.dto.com.OrderlistAndProductDTO;
import com.saltlux.jjangumall.service.CartService;
import com.saltlux.jjangumall.service.com.ComOrderService;
import com.saltlux.jjangumall.service.com.ComProductService;
import com.saltlux.jjangumall.service.store.StoreUserService;

@Controller
@RequestMapping("/order/*")
public class ComOrderController {

	@Autowired
	private StoreUserService storeUserService;

	@Autowired
	private ComOrderService comOrderService;

	@Autowired
	private ComProductService comProductService;

	@Autowired
	private CartService cartService;

	// order_cart 페이지 : 장바구니에서 선택주문에서 이동하는 페이지
	@GetMapping("/order_cart")
	public ModelAndView orderCart(@RequestParam(required = false, defaultValue = "") String checkedValueStr,
			HttpSession session) {
		System.out.println("선택주문하러왔어용");
		List<CartAndProductDTO> list = new ArrayList<CartAndProductDTO>();
		String[] cartCodeStr = checkedValueStr.split(",");
		System.out.println(cartCodeStr.length);
		int[] cartCode = new int[cartCodeStr.length];
		for (int i = 0; i < cartCodeStr.length; i++) {
			cartCode[i] = Integer.parseInt(cartCodeStr[i]);
			CartAndProductDTO cartAndProductDTO = cartService.getCartDTO(cartCode[i]);
			list.add(cartAndProductDTO);
			System.out.println("선택주문할내용 " + cartAndProductDTO);
		}

		String thumbImgList = "";
		String productCodeList = "";
		String productNameList = "";
		String discountPriceList = "";
		String purchaseQtyList = "";

		for (int i = 0; i < list.size(); i++) {
			thumbImgList += (list.get(i).getImgNo() + ",");
			productCodeList += (list.get(i).getProductNo() + ",");
			productNameList += (list.get(i).getName() + ",");
			discountPriceList += (list.get(i).getPrice() + ",");
			purchaseQtyList += (list.get(i).getCount() + ",");
		}

		String userId = (String) session.getAttribute("memId");
		UserDTO userDTO = storeUserService.checkId(userId);
		ModelAndView mav = new ModelAndView();

		mav.addObject("checkedValueStr", checkedValueStr);
		mav.addObject("thumbImgList", thumbImgList);
		mav.addObject("productCodeList", productCodeList);
		mav.addObject("productNameList", productNameList);
		mav.addObject("discountPriceList", discountPriceList);
		mav.addObject("purchaseQtyList", purchaseQtyList);
		mav.addObject("userDTO", userDTO);
		mav.addObject("list", list);
		mav.addObject("display", "/order/order_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;

	}

	// order_settle 페이지
	@PostMapping("/order_settle")
	public ModelAndView orderSettle(@ModelAttribute OrderSettleDTO orderSettleDTO, HttpSession session) {
		System.out.println(" order_settle에 왔니?");
		System.out.println(" 여기 !! " + orderSettleDTO);
		String userId = (String) session.getAttribute("memId");
		ModelAndView mav = new ModelAndView();

		String[] carNos = orderSettleDTO.getCheckedValueStr().split(",");
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setRAddress(orderSettleDTO.getReceiverAddr1() + orderSettleDTO.getReceiverAddr2());
		orderDTO.setRName(orderSettleDTO.getRName());
		orderDTO.setRPhone(orderSettleDTO.getRPhone());
		orderDTO.setRZipcode(orderSettleDTO.getRZipcode());
		orderDTO.setState("주문완료");
		orderDTO.setTotalPrice(orderSettleDTO.getTotalPrice());
		orderDTO.setUserID(userId);

		OrderlistDTO orderlistDTO = new OrderlistDTO();
		comOrderService.addOrder(orderDTO);// order에 추가

		String orderNo = comOrderService.getMaxOrderNo(userId);// 넣은 orderNo확인

		// 넘어온 상품 orderlist에 넣는다
		for (String carNo : carNos) {
			CartAndProductDTO cartAndProductDTO = cartService.getCartDTO(Integer.parseInt(carNo));
			orderlistDTO.setOrderNo(Integer.parseInt(orderNo));
			orderlistDTO.setProductNo(cartAndProductDTO.getProductNo());
			orderlistDTO.setCount(cartAndProductDTO.getCount());
			comOrderService.addOrderlist(orderlistDTO);
			System.out.println("carNo입니다 " + carNo);
			cartService.deleteAfterBuyCart(carNo);
			// 재고 정리
		}

		//// 여기서 입력 완료// 해당 cart 지우고 출력하는거 하기// 트리거로 구현

		// 주문정보 OrderlistAndProductDTO 리스트 넘겨주기
		// List<OrderDTO> list = comOrderService.getOrderProduct(userId);
		List<OrderlistAndProductDTO> orderlistAndProductDTOs = comOrderService.getOrderList(userId, orderNo);

		// 유저정보
		UserDTO userDTO = storeUserService.checkId(userId);

		mav.addObject("list", orderlistAndProductDTOs);
		mav.addObject("userDTO", userDTO);
		System.out.println(orderDTO);
//		mav.addObject("orderDTO", orderDTO); //cartCode // 이렇게하면 왜 안되는것인가 왜!!!
		mav.addObject("rName", orderDTO.getRName());
		mav.addObject("rPhone", orderDTO.getRPhone());
		mav.addObject("rZipcode", orderDTO.getRZipcode());
		mav.addObject("rAddress", orderDTO.getRAddress());
		mav.addObject("display", "/order/order_settle.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}

	// 재고처리
	@RequestMapping(value = "/reduceSaleProduct.", method = RequestMethod.POST)
	@ResponseBody
	public String reduceSaleProduct(@RequestParam int productCode, @RequestParam int purchaseQty) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("productCode", productCode);
		map.put("purchaseQty", purchaseQty);
		// comOrderService.reduceSaleProduct(map);

		return "success";
	}

	@RequestMapping(value = "/orderCancel", method = RequestMethod.GET)
	@ResponseBody
	public String orderCancel(@RequestParam int orderNo) {

		comOrderService.cancelOrder(orderNo);

		return "/miniproject";
	}

}