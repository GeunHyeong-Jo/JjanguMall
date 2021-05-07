package com.saltlux.jjangumall.util;

import java.util.List;

import com.saltlux.jjangumall.dto.EatTimeDTO;
import com.saltlux.jjangumall.dto.ExerciseAndExerciseListDTO;
import com.saltlux.jjangumall.dto.ExerciseDTO;
import com.saltlux.jjangumall.dto.ExerciselistDTO;
import com.saltlux.jjangumall.dto.FoodAndFoodListDTO;
import com.saltlux.jjangumall.dto.FoodDTO;
import com.saltlux.jjangumall.dto.FoodlistDTO;
import com.saltlux.jjangumall.dto.WeeksCaloryDTO;

public class TotalCalory {
	// food/foodlist merge
	public static FoodAndFoodListDTO mergeFoodAndFoodList(FoodlistDTO listdto, FoodDTO dto) {
		FoodAndFoodListDTO tmp = new FoodAndFoodListDTO();
		tmp.setFoodlistDTO(listdto);
		tmp.setFoodDTO(dto);
		return tmp;
	}

	// exercise/exerciselist merge
	public static ExerciseAndExerciseListDTO mergeExerciseAndExerciseListDTO(ExerciselistDTO listdto, ExerciseDTO dto) {
		ExerciseAndExerciseListDTO tmp = new ExerciseAndExerciseListDTO();
		tmp.setExerciselistDTO(listdto);
		tmp.setExerciseDTO(dto);
		return tmp;
	}

	// 아침, 점심, 저녁마다 다른 칼로리량 계산
	public static long carculateCalory(List<FoodAndFoodListDTO> list) {
		long total = 0L;
		for (FoodAndFoodListDTO vo : list) {
			String str;
			switch ((str = vo.getFoodlistDTO().getEat_Time()).hashCode()) {
			case -1376511864:
				if (!str.equals("evening"))
					continue;
				total = (long) (total + vo.getFoodDTO().getCalory() * 1.1D);
			case 103334698:
				if (!str.equals("lunch"))
					continue;
				total += vo.getFoodDTO().getCalory();
			case 1240152004:
				if (!str.equals("morning"))
					continue;
				total = (long) (total + vo.getFoodDTO().getCalory() * 0.9D);
			}
		}
		return total;
	}

//	public static long caloriesByAge(String age, String gender) {
//		String str;
//		switch ((str = age).hashCode()) {
//		case -1337482399:
//			if (!str.equals("thrties"))
//				break;
//			if (gender == "male")
//				return 2400L;
//			return 1900L;
//		case -677227988:
//			if (!str.equals("forties"))
//				break;
//			if (gender == "male")
//				return 2400L;
//			return 1900L;
//		case 3556342:
//			if (!str.equals("tens"))
//				break;
//			if (gender == "male")
//				return 2700L;
//			return 2000L;
//		case 1067336261:
//			if (!str.equals("AfterAll"))
//				break;
//			if (gender == "male")
//				return 2200L;
//			return 1800L;
//		case 1537983055:
//			if (!str.equals("twenties"))
//				break;
//			if (gender == "male")
//				return 2600L;
//			return 2100L;
//		}
//		return 0L;
//	}
//
//	public static long caculateLessCalory(List<ExerciseListVo> list) {
//		long total = 0L;
//		for (ExerciseListVo vo : list)
//			total += vo.getTime() * vo.getExerciseVo().getCalory() / 10L;
//		return total;
//	}
//

	// 1주일 안의 칼로리 전체 계산
	public static WeeksCaloryDTO calculatedayCalory(List<FoodAndFoodListDTO> list) {
		WeeksCaloryDTO wcv = new WeeksCaloryDTO();
		for (FoodAndFoodListDTO vo : list) {
			switch (vo.getFoodlistDTO().getReg_date().getDay()) {
			case 0:
				wcv.setSunday(wcv.getSunday() + vo.getFoodDTO().getCalory());
				continue;
			case 1:
				wcv.setMonday(wcv.getMonday() + vo.getFoodDTO().getCalory());
				continue;
			case 2:
				wcv.setTuesday(wcv.getTuesday() + vo.getFoodDTO().getCalory());
				continue;
			case 3:
				wcv.setWednesday(wcv.getWednesday() + vo.getFoodDTO().getCalory());
				continue;
			case 4:
				wcv.setThursday(wcv.getThursday() + vo.getFoodDTO().getCalory());
				continue;
			case 5:
				wcv.setFriday(wcv.getFriday() + vo.getFoodDTO().getCalory());
				continue;
			case 6:
				wcv.setSaturday(wcv.getSunday() + vo.getFoodDTO().getCalory());
				continue;
			}
			return null;
		}
		return wcv;
	}

	// 시간마다 먹은 칼로리 량 계산
	public static EatTimeDTO calculateHourCalory(List<FoodAndFoodListDTO> list) {
		EatTimeDTO wcv = new EatTimeDTO();
		long tmp = 0L;
		for (FoodAndFoodListDTO vo : list) {
			String str;
			switch ((str = vo.getFoodlistDTO().getEat_Time()).hashCode()) {
			case -1376511864:
				if (!str.equals("evening"))
					break;
				tmp = (long) (vo.getFoodDTO().getCalory() * 1.1D);
				wcv.setEvening(wcv.getEvening() + tmp);
				continue;
			case 103334698:
				if (!str.equals("lunch"))
					break;
				wcv.setLunch(wcv.getLunch() + vo.getFoodDTO().getCalory());
				continue;
			case 1240152004:
				if (!str.equals("morning"))
					break;
				tmp = (long) (vo.getFoodDTO().getCalory() * 0.9D);
				wcv.setMorning(wcv.getMorning() + tmp);
				continue;
			}
			return null;
		}
		return wcv;
	}

	public static WeeksCaloryDTO calculatedLessdayCalory(List<ExerciseAndExerciseListDTO> list) {
		WeeksCaloryDTO wcv = new WeeksCaloryDTO();
		long tmp = 0L;
		for (ExerciseAndExerciseListDTO vo : list) {
			System.out.println(vo);
			switch (vo.getExerciselistDTO().getReg_date().getDay()) {
			case 0:
				tmp = vo.getExerciseDTO().getCalory() * vo.getExerciselistDTO().getTime() / 10L;
				wcv.setSunday(wcv.getSunday() + tmp);
				continue;
			case 1:
				tmp = vo.getExerciseDTO().getCalory() * vo.getExerciselistDTO().getTime() / 10L;
				wcv.setMonday(wcv.getMonday() + tmp);
				continue;
			case 2:
				tmp = vo.getExerciseDTO().getCalory() * vo.getExerciselistDTO().getTime() / 10L;
				wcv.setTuesday(wcv.getTuesday() + tmp);
				continue;
			case 3:
				tmp = vo.getExerciseDTO().getCalory() * vo.getExerciselistDTO().getTime() / 10L;
				wcv.setWednesday(wcv.getWednesday() + tmp);
				continue;
			case 4:
				tmp = vo.getExerciseDTO().getCalory() * vo.getExerciselistDTO().getTime() / 10L;
				wcv.setThursday(wcv.getThursday() + tmp);
				continue;
			case 5:
				tmp = vo.getExerciseDTO().getCalory() * vo.getExerciselistDTO().getTime() / 10L;
				wcv.setFriday(wcv.getFriday() + tmp);
				continue;
			case 6:
				tmp = vo.getExerciseDTO().getCalory() * vo.getExerciselistDTO().getTime() / 10L;
				wcv.setSaturday(wcv.getSunday() + tmp);
				continue;
			}
			return null;
		}
		return wcv;
	}
}
