package com.saltlux.jjangumall.controller.calory;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.saltlux.jjangumall.dto.ExerciseAndExerciseListDTO;
import com.saltlux.jjangumall.dto.ExerciselistDTO;
import com.saltlux.jjangumall.dto.WeeksCaloryDTO;
import com.saltlux.jjangumall.service.calory.ExerciseListService;
import com.saltlux.jjangumall.service.calory.ExerciseService;
import com.saltlux.jjangumall.util.TotalCalory;

@Controller
@RequestMapping({ "/calory/exercise" })
public class ExerciseListController {
	@Autowired
	private ExerciseService exerciseService;
	
	@Autowired
	private ExerciseListService exerciseListService; 

	@RequestMapping({ "/index" })
	public String index(Model model, HttpSession session) {
		String Id = (String) session.getAttribute("memId");

		if (Id == null)
			return "redirect:/calory/index";
		List<ExerciselistDTO> list = this.exerciseListService.findIdAllList(Id);
		List<ExerciseAndExerciseListDTO> newList = new ArrayList<ExerciseAndExerciseListDTO>();
		for (ExerciselistDTO dto : list) {
			ExerciseAndExerciseListDTO listdto = new ExerciseAndExerciseListDTO();
			listdto = TotalCalory.mergeExerciseAndExerciseListDTO(dto, exerciseService.findNo(dto.getExerciseNo()));
			newList.add(listdto);
		}
//		long caloriesByAge = TotalCalory.caloriesByAge(authUser.getAges(), authUser.getGender());
//		authUser.setTotalCalory(TotalCalory.caculateLessCalory(list));
//		model.addAttribute("calory", Long.valueOf(caloriesByAge));
		model.addAttribute("list", newList);
		return "/exercise/exerciselist";
	}

	@RequestMapping({ "/days" })
	public String days(String no, Model model, HttpSession session) {
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		long No = 0L;
		if (no != null && no.matches("\\d*")) {
			No = Long.parseLong(no);
		} else {
			return "/exercise/exerciselist";
		}
		List<ExerciselistDTO> list = this.exerciseListService.findListDays(Id, No);
		
		List<ExerciseAndExerciseListDTO> newList = new ArrayList<ExerciseAndExerciseListDTO>();
		for (ExerciselistDTO dto : list) {
			ExerciseAndExerciseListDTO listdto = new ExerciseAndExerciseListDTO();
			listdto = TotalCalory.mergeExerciseAndExerciseListDTO(dto, exerciseService.findNo(dto.getExerciseNo()));
			newList.add(listdto);
		}
		
		//long caloriesByAge = TotalCalory.caloriesByAge(authUser.getAges(), authUser.getGender());
		model.addAttribute("no", no);
		//model.addAttribute("calory", Long.valueOf(caloriesByAge));
		model.addAttribute("list", newList);
		return "/exercise/exerciselistday";
	}

	@RequestMapping({ "/weeks" })
	public String weeks(String no, Model model, HttpSession session) {
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		long No = 0L;
		if (no != null && no.matches("\\d*")) {
			No = Long.parseLong(no);
		} else {
			return "/exercise/exerciselist";
		}
		List<ExerciselistDTO> list = this.exerciseListService.findListweeks(Id, No);
		List<ExerciseAndExerciseListDTO> newList = new ArrayList<ExerciseAndExerciseListDTO>();
		for (ExerciselistDTO dto : list) {
			
			ExerciseAndExerciseListDTO listdto = new ExerciseAndExerciseListDTO();
			
			listdto = TotalCalory.mergeExerciseAndExerciseListDTO(dto, exerciseService.findNo(dto.getExerciseNo()));
			
			newList.add(listdto);
		}
		WeeksCaloryDTO vo = new WeeksCaloryDTO();
		vo = TotalCalory.calculatedLessdayCalory(newList);
	//	authUser.setTotalCalory(TotalCalory.caculateLessCalory(list));
	//	long caloriesByAge = TotalCalory.caloriesByAge(authUser.getAges(), authUser.getGender());
		model.addAttribute("Sunday", Long.valueOf(vo.getSunday()));
		model.addAttribute("Monday", Long.valueOf(vo.getMonday()));
		model.addAttribute("Tuesday", Long.valueOf(vo.getTuesday()));
		model.addAttribute("Wednesday", Long.valueOf(vo.getWednesday()));
		model.addAttribute("Thursday", Long.valueOf(vo.getThursday()));
		model.addAttribute("Friday", Long.valueOf(vo.getFriday()));
		model.addAttribute("Saturday", Long.valueOf(vo.getSaturday()));
		model.addAttribute("no", no);
		//model.addAttribute("calory", Long.valueOf(caloriesByAge));
		model.addAttribute("list", newList);
		
		return "/exercise/exerciselist";
	}

	@RequestMapping(value = { "/insert" }, method = { RequestMethod.GET })
	public String insert(HttpSession session) {
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		return "/exercise/exerciselist";
	}

	@RequestMapping(value = { "/insert" }, method = { RequestMethod.POST })
	public String insert(String name, String Time, HttpSession session) {
		ExerciselistDTO vo = new ExerciselistDTO();
		
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		int no = -1;
		try {
			no = exerciseService.findName(name);
		} catch (NullPointerException e) {
			return "redirect:/calory/index";
		}
		int time = 0;
		if (Time != null && Time.matches("\\d*")) {
			time = Integer.parseInt(Time);
		} else {
			return "redirect:/calory/exercise/index";
		}
		System.out.println("진입");
		
		vo.setUser_no(Id);
		vo.setExerciseNo(no);
		vo.setTime(time);

		this.exerciseListService.insert(vo);
		return "redirect:/calory/exercise/index";
	}

	@RequestMapping({ "/delete" })
	public String delete(long no, HttpSession session) {
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		this.exerciseListService.delete(no);
		return "redirect:/calory/exercise/index";
	}

	@RequestMapping(value = { "/update" }, method = { RequestMethod.GET })
	public String update(long no, HttpSession session, Model model) {
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		model.addAttribute("no", Long.valueOf(no));
		return "/exercise/update";
	}

	@RequestMapping(value = { "/update" }, method = { RequestMethod.POST })
	public String update(String no, String Time, String name, HttpSession session) {
		ExerciselistDTO vo = new ExerciselistDTO();
		String Id = (String) session.getAttribute("memId");
		if (Id == null)
			return "redirect:/calory/index";
		int No = Integer.parseInt(no);
		int time = 0;
		
		if (Time != null && Time.matches("\\d*")) {
			time = Integer.parseInt(Time);
		} else {
			return "redirect:/calory/exercise/index";
		}
		int exerciseNo = -1;
		try {
			exerciseNo = exerciseService.findName(name);
		} catch (NullPointerException e) {
			return "redirect:/calory/index";
		}
		
		vo.setExerciseListNo(No);
		vo.setUser_no(Id);
		vo.setExerciseNo(exerciseNo);
		vo.setTime(time);
		this.exerciseListService.update(vo);
		return "redirect:/calory/exercise/index";
	}
}
