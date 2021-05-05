package com.saltlux.jjangumall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainController {
	
	
	@RequestMapping("")
	public String index() {
		return "/main/index";
	}
	
	@RequestMapping({ "/calory/index" })
	public String caloryIndex() {
		return "/main/caloryindex";
	}
}