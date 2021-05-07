package com.saltlux.jjangumall.controller.calory;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.saltlux.jjangumall.dto.EatTimeDTO;
import com.saltlux.jjangumall.dto.FoodAndFoodListDTO;
import com.saltlux.jjangumall.dto.FoodlistDTO;
import com.saltlux.jjangumall.dto.WeeksCaloryDTO;
import com.saltlux.jjangumall.service.calory.FoodListService;
import com.saltlux.jjangumall.service.calory.FoodService;
import com.saltlux.jjangumall.util.TotalCalory;

@Controller
@RequestMapping({ "/calory/eat" })
public class FoodListController {
	@Autowired
	FoodListService foodListService;

	@Autowired
	FoodService foodService;

	@RequestMapping({ "/index" })
	public String index(Model model, HttpSession session) {
		String Id = (String) session.getAttribute("memId");

		if (Id == null)
			return "redirect:/calory/index";
		List<FoodlistDTO> list = this.foodListService.findIdAllList(Id);

		List<FoodAndFoodListDTO> newList = new ArrayList<FoodAndFoodListDTO>();
		for (FoodlistDTO dto : list) {
			FoodAndFoodListDTO listdto = new FoodAndFoodListDTO();
			listdto = TotalCalory.mergeFoodAndFoodList(dto, foodService.findNo(dto.getFood_no()));
			System.out.println(listdto);
			newList.add(listdto);
		}

		long totalCalory = TotalCalory.carculateCalory(newList);

		 //long caloriesByAge = TotalCalory.caloriesByAge(authUser.getAges(), authUser.getGender());
		model.addAttribute("calory", totalCalory);
		model.addAttribute("list", newList);
		return "/eat/eatlist";
	}

	@RequestMapping({ "/days" })
	public String days(String no, Model model, HttpSession session) {
		String Id = (String) session.getAttribute("memId");

		try {
		if (Id == null)
			return "redirect:/calory/index";
		int No = 0;
		if (no != null && no.matches("\\d*")) {
			No = Integer.parseInt(no);
		} else {
			return "/eat/eatlist";
		}
		
		EatTimeDTO vo = new EatTimeDTO();
		List<FoodlistDTO> list = this.foodListService.findListDays(Id, No);
		
		List<FoodAndFoodListDTO> newList = new ArrayList<FoodAndFoodListDTO>();
		for (FoodlistDTO dto : list) {
			System.out.println(dto);
			FoodAndFoodListDTO listdto = new FoodAndFoodListDTO();
			listdto = TotalCalory.mergeFoodAndFoodList(dto, foodService.findNo(dto.getFood_no()));
			newList.add(listdto);
		}
		
		vo = TotalCalory.calculateHourCalory(newList);
		long totalcalory = TotalCalory.carculateCalory(newList);
		
		model.addAttribute("Morning", Long.valueOf(vo.getMorning()));
		model.addAttribute("Lunch", Long.valueOf(vo.getLunch()));
		model.addAttribute("Evening", Long.valueOf(vo.getEvening()));
		model.addAttribute("no", no);
		model.addAttribute("calory", totalcalory);
		model.addAttribute("list", newList);
		return "/eat/eatlistday";
		}
		catch(Exception e){
			return "redirect:/calory/index";
		}
	}

	@RequestMapping({ "/weeks" })
	public String weeks(String no, Model model, HttpSession session) {
		String Id = (String) session.getAttribute("memId");

		if (Id == null)
			return "redirect:/calory/index";
		int No = 0;
		if (no != null && no.matches("\\d*")) {
			No = Integer.parseInt(no);
		} else {
			return "/eat/eatlist";
		}
		List<FoodlistDTO> list = this.foodListService.findListweeks(Id, No);
		
		List<FoodAndFoodListDTO> newList = new ArrayList<FoodAndFoodListDTO>();
		for (FoodlistDTO dto : list) {
			FoodAndFoodListDTO listdto = new FoodAndFoodListDTO();
			listdto = TotalCalory.mergeFoodAndFoodList(dto, foodService.findNo(dto.getFood_no()));
			newList.add(listdto);
		}
		WeeksCaloryDTO vo = new WeeksCaloryDTO();
		vo = TotalCalory.calculatedayCalory(newList);

		model.addAttribute("Sunday", Long.valueOf(vo.getSunday()));
		model.addAttribute("Monday", Long.valueOf(vo.getMonday()));
		model.addAttribute("Tuesday", Long.valueOf(vo.getTuesday()));
		model.addAttribute("Wednesday", Long.valueOf(vo.getWednesday()));
		model.addAttribute("Thursday", Long.valueOf(vo.getThursday()));
		model.addAttribute("Friday", Long.valueOf(vo.getFriday()));
		model.addAttribute("Saturday", Long.valueOf(vo.getSaturday()));
		model.addAttribute("no", no);
		
		model.addAttribute("list", newList);
		return "/eat/eatlist";
	}
	
	@RequestMapping(value = { "/insert" }, method = { RequestMethod.GET })
	public String insert(HttpSession session) {
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		return "/eat/index";
	}

	@RequestMapping(value = { "/insert" }, method = { RequestMethod.POST })
	public String insert(String name, String eatTime, HttpSession session) {
		FoodlistDTO vo = new FoodlistDTO();

		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		int no = -1;
		try {
			no = foodService.findName(name);
		} catch (NullPointerException e) {
			return "redirect:/calory/index";
		}
	
		System.out.println(no);
		vo.setUser_no(Id);
		vo.setFood_no(no);
		vo.setEat_Time(eatTime);
		this.foodListService.insert(vo);
		return "redirect:/calory/eat/index";
	}

	@RequestMapping({ "/delete" })
	public String delete(int no, HttpSession session) {
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";

		this.foodListService.delete(no);
		return "redirect:/calory/eat/index";
	}

	@RequestMapping(value = { "/update" }, method = { RequestMethod.GET })
	public String update(long no, HttpSession session, Model model) {
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		model.addAttribute("no", Long.valueOf(no));
		return "/eat/update";
	}

	@RequestMapping(value = { "/update" }, method = { RequestMethod.POST })
	public String update(long no, String name, String eatTime, HttpSession session) {
		FoodlistDTO vo = new FoodlistDTO();
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		if (this.foodListService.findNo(no) == null)
			return "redirect:/eat/update";
		int foodno = -1;
		try {
			foodno = foodService.findName(name);
		} catch (NullPointerException e) {
			return "redirect:/calory/index";
		}

		vo.setUser_no(Id);
		vo.setFood_no(foodno);
		vo.setEat_Time(eatTime);
		this.foodListService.update(vo);
		return "redirect:/calory/eat/index";
	}
}
