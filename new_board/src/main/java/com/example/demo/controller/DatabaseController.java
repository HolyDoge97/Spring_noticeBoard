package com.example.demo.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.newBoard.UserVO;
import com.example.demo.service.impl.UserServiceImpl;

@Controller
public class DatabaseController{
	
	public static int pageSize = 5;
	public static int totalrec = 0;
	public static int totalpage= 1;
	public static int pageSepSize = 10;

		
		@Autowired
		private UserServiceImpl service;
		
		@GetMapping("/list")
		public String home(Locale locale, Model model, @RequestParam("currentPage") int currentPage) throws Exception{
			int totalRec = service.totalrec(); //전체 게시글 갯수 확인
			totalpage = (int) Math.ceil(totalRec/pageSize); //전체 게시글 수 / 한번에 노출시킬 게시글 수 
			int ListPage = 1+(5*currentPage-6); //등차수열 으아아아아악
			List<Map<String, Object>> postList = service.currentPage(ListPage); //페이지 번호에 맞는 데이터 select
			model.addAttribute("postList", postList); //totalpage에 따른 10단위의 블럭 생성
			int curr = (int) Math.ceil((double)currentPage/pageSepSize); //현재페이지/10
			int tot = (int) Math.ceil((double)totalpage/pageSepSize); //전체페이지수/10
			model.addAttribute("pageSepSize",pageSepSize);		
			model.addAttribute("totalpage",totalpage);
			model.addAttribute("tot",tot); 
			model.addAttribute("curr",curr);
			return "list";
		}
		
		@GetMapping("/insert")
		public String insertPage() {
			return "insert";
		}
		
		@PostMapping("/insertPage")
		public String insertPage(UserVO insert) {
			service.insertpage(insert);
			return "insert";
		}
		
		
		@PostMapping("/deletePage") 
		  public String deletePage(Model model, UserVO delete) throws Exception { 
			  int result = service.deletepage(delete);
			  List<UserVO> relist = service.select(); 
			  model.addAttribute("postList",relist); 
			  System.out.println(result); 
			  return "list";
		 }
		 	  	
		@PostMapping("/deleteAjax")
		public void deleteAjax(UserVO delete) {
			int result = service.deletepage(delete);
			System.out.println(result);
		}	
		
		@GetMapping("/detail")
			public String detailPost(UserVO PID , Model model) throws Exception  {	
				int totalRec = service.totalrec(); //전체 게시글 갯수 확인
				totalpage = (int) Math.ceil(totalRec/pageSize); //전체 게시글 수 / 한번에 노출시킬 게시글 수 
				service.increView(PID);
				List<UserVO> postdetail = service.selectDetail(PID);
				model.addAttribute("postdetail", postdetail);
				List<UserVO> postList = service.select();
				model.addAttribute("postList", postList);
				List<Map<String, Object>> commentList = service.selComment(PID);
				model.addAttribute("commentList",commentList);
				return "detail";
		}
		

		@GetMapping("/editpage")
			public void EditPage(UserVO PID, Locale locale, Model model, UserVO update) throws Exception {
				List<UserVO> postdetail = service.selectDetail(PID);
				model.addAttribute("postdetail", postdetail);
			  }
		
		@PostMapping("/EditPost")
			public void EditPost(UserVO update) throws Exception {
				int result = service.updatepost(update);
				System.out.println(result); 
		  }
		
		@PostMapping("/regiComment")
			public void regiComment(UserVO regicomm) {
				int result=service.regicomment(regicomm);
				System.out.println(result);
		}
		 
		@PostMapping("/regiReply")
			public void regiReply(UserVO regireply) {
			int result=service.regireply(regireply);
			System.out.println(result);
		}

	

	}
