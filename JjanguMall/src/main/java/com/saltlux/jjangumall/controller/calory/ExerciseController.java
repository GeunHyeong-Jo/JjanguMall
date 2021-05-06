//package com.saltlux.jjangumall.controller.calory;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.saltlux.calory.util.TotalCalory;
//import com.saltlux.jjangumall.dto.ExerciseDTO;
//import com.saltlux.jjangumall.dto.ExerciselistDTO;
//import com.saltlux.jjangumall.dto.UserDTO;
//import com.saltlux.jjangumall.dto.calory.WeeksCaloryVo;
//import com.saltlux.jjangumall.service.calory.ExerciseService;
//
//@Controller
//@RequestMapping({ "/exercise" })
//public class ExerciseController {
//	@Autowired
//	ExerciseService exerciseService;
//
//	@RequestMapping({ "/index" })
//	public String index(Model model, HttpSession session) {
//		UserDTO authUser = (UserDTO) session.getAttribute("authUser");
//		if (authUser == null)
//			return "redirect:/index";
//		List<ExerciselistDTO> list = this.exerciseService.findIdAllList(authUser);
//		long caloriesByAge = TotalCalory.caloriesByAge(authUser.getAges(), authUser.getGender());
//		authUser.setTotalCalory(TotalCalory.caculateLessCalory(list));
//		model.addAttribute("calory", Long.valueOf(caloriesByAge));
//		model.addAttribute(list);
//		model.addAttribute("list", list);
//		return "/exercise/exerciselist";
//	}
//
//	@RequestMapping({ "/days" })
//	public String days(String no, Model model, HttpSession session) {
//		UserDTO authUser = (UserDTO) session.getAttribute("authUser");
//		if (authUser == null)
//			return "redirect:/index";
//		long No = 0L;
//		if (no != null && no.matches("\\d*")) {
//			No = Long.parseLong(no);
//		} else {
//			return "/exercise/exerciselist";
//		}
//		List<ExerciselistDTO> list = this.exerciseService.findListDays(authUser, No);
//		authUser.setTotalCalory(TotalCalory.caculateLessCalory(list));
//		long caloriesByAge = TotalCalory.caloriesByAge(authUser.getAges(), authUser.getGender());
//		model.addAttribute("no", no);
//		model.addAttribute("calory", Long.valueOf(caloriesByAge));
//		model.addAttribute("list", list);
//		return "/exercise/exerciselistday";
//	}
//
//	@RequestMapping({ "/weeks" })
//	public String weeks(String no, Model model, HttpSession session) {
//		UserDTO authUser = (UserDTO) session.getAttribute("authUser");
//		if (authUser == null)
//			return "redirect:/index";
//		long No = 0L;
//		if (no != null && no.matches("\\d*")) {
//			No = Long.parseLong(no);
//		} else {
//			return "/exercise/exerciselist";
//		}
//		List<ExerciselistDTO> list = this.exerciseService.findListweeks(authUser, No);
//		WeeksCaloryVo vo = new WeeksCaloryVo();
//		vo = TotalCalory.calculatedLessdayCalory(list);
//		authUser.setTotalCalory(TotalCalory.caculateLessCalory(list));
//		long caloriesByAge = TotalCalory.caloriesByAge(authUser.getAges(), authUser.getGender());
//		model.addAttribute("Sunday", Long.valueOf(vo.getSunday()));
//		model.addAttribute("Monday", Long.valueOf(vo.getMonday()));
//		model.addAttribute("Tuesday", Long.valueOf(vo.getTuesday()));
//		model.addAttribute("Wednesday", Long.valueOf(vo.getWednesday()));
//		model.addAttribute("Thursday", Long.valueOf(vo.getThursday()));
//		model.addAttribute("Friday", Long.valueOf(vo.getFriday()));
//		model.addAttribute("Saturday", Long.valueOf(vo.getSaturday()));
//		model.addAttribute("no", no);
//		model.addAttribute("calory", Long.valueOf(caloriesByAge));
//		model.addAttribute("list", list);
//		return "/exercise/exerciselist";
//	}
//
//	@RequestMapping(value = { "/insert" }, method = { RequestMethod.GET })
//	public String insert(HttpSession session) {
//		UserDTO authUser = (UserDTO) session.getAttribute("authUser");
//		if (authUser == null)
//			return "redirect:/index";
//		return "/exercise/index";
//	}
//
//	@RequestMapping(value = { "/insert" }, method = { RequestMethod.POST })
//	public String insert(String name, long Time, HttpSession session) {
//		ExerciselistDTO vo = new ExerciselistDTO();
//		ExerciseDTO exerciseVo = new ExerciseDTO();
//		UserDTO authUser = (UserDTO) session.getAttribute("authUser");
//		if (authUser == null)
//			return "redirect:/index";
//		exerciseVo.setName(name);
//		vo.setExercise(exerciseVo);
//		vo.setUserVo(authUser);
//		vo.setTime(Time);
//		this.exerciseService.insert(vo);
//		return "redirect:/exercise/index";
//	}
//
//	@RequestMapping({ "/delete" })
//	public String delete(long no, HttpSession session) {
//		UserDTO authUser = (UserDTO) session.getAttribute("authUser");
//		if (authUser == null)
//			return "redirect:/index";
//		this.exerciseService.delete(no);
//		return "redirect:/exercise/index";
//	}
//
//	@RequestMapping(value = { "/update" }, method = { RequestMethod.GET })
//	public String update(long no, HttpSession session, Model model) {
//		UserDTO authUser = (UserDTO) session.getAttribute("authUser");
//		if (authUser == null)
//			return "redirect:/index";
//		System.out.println(no);
//		model.addAttribute("no", Long.valueOf(no));
//		return "/exercise/update";
//	}
//
//	@RequestMapping(value = { "/update" }, method = { RequestMethod.POST })
//	public String update(String no, String time, String name, HttpSession session) {
//		ExerciselistDTO vo = new ExerciselistDTO();
//		ExerciseDTO exerciseVo = new ExerciseDTO();
//		UserDTO authUser = (UserDTO) session.getAttribute("authUser");
//		if (authUser == null)
//			return "redirect:/index";
//		long No = Long.parseLong(no);
//		long Time = Long.parseLong(time);
//		if (this.exerciseService.findNo(No) == null)
//			return "redirect:/exercise/update";
//		vo.setExerciseListNo(No);
//		exerciseVo.setName(name);
//		vo.setExerciseVo(exerciseVo);
//		vo.setUserVo(authUser);
//		vo.setTime(Time);
//		this.exerciseService.update(vo);
//		return "redirect:/exercise/index";
//	}
//}
