package com.example.demo.controller;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.junit.platform.commons.util.ToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.*;
import com.example.demo.newBoard.UserVO;
import com.example.demo.service.UserService;
import com.example.demo.service.impl.UserServiceImpl;
import com.fasterxml.jackson.annotation.JsonProperty;

@Controller
public class DatabaseController{

		
		@Autowired
		private UserServiceImpl service;
		
		@GetMapping("/db")
		public String home(Locale locale, Model model) throws Exception{
			List<UserVO> postList = service.select();
			model.addAttribute("postList", postList);
			return "db";
			
		}
		
		@GetMapping("/insert")
		public String insertPage() {

			return "insert";

		}
		
		@PostMapping("/insertPage")
		public String insertPage(UserVO insert) {
			//System.out.println(insert.getPostNum());
			//System.out.println(insert.getPostMan());
			//System.out.println(insert.getPostTitle());
			//System.out.println(insert.getPostMain());
			//System.out.println(insert.getPostTime());
			int res = service.insertpage(insert);
			System.out.println(res);
			return "insert";
		}
		
		
		@PostMapping("/deletePage") 
		  public String deletePage(Model model, UserVO delete) throws Exception { 
			  int result = service.deletepage(delete);
			  List<UserVO> relist = service.select(); 
			  model.addAttribute("postList",relist); 
			  System.out.println(result); 
			  return "db";
		  
		 }
		 	  	
		@PostMapping("/deleteAjax")
		public void deleteAjax(UserVO delete) {
			int result = service.deletepage(delete);
			System.out.println(result);
		}	
		
		@GetMapping("/detail")
			public String detailPost(UserVO PID , Model model) throws Exception  {	
				List<UserVO> postdetail = service.selectDetail(PID);
				model.addAttribute("postdetail", postdetail);
				
				List<UserVO> postList = service.select();
				model.addAttribute("postList", postList);
				return "detail";
		}
		

		@PostMapping("/update")
			public String updatePost(Locale locale, Model model, UserVO update) throws Exception {
				List<UserVO> uplist = service.select(); 
				model.addAttribute("postList", uplist);
				int result = service.updatepost(update);
				System.out.println(result); 
				return "update";
			  }

		

		
	}
