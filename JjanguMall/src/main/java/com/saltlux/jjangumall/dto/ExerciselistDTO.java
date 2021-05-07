package com.saltlux.jjangumall.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class ExerciselistDTO {
	private int exerciseListNo; // 번호
	private String user_no;// 유저 번호
	private int exerciseNo;// 운동 번호
	private int Time;// 운동 시간
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
	private Date reg_date; // 가입일
}
