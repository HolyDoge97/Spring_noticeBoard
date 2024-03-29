package com.example.demo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.UserDAO;
import com.example.demo.newBoard.UserVO;

@Service
public class UserServiceImpl{

	@Autowired
	private UserDAO userDAO;
	
	
	public List<UserVO> select() throws Exception {
		return userDAO.selectUser();
	}
	
	public int insertpage(UserVO userVo) {
		return userDAO.insertPage(userVo);
	}
	
	public int deletepage(UserVO deleteNum) {
		return userDAO.deletePage(deleteNum);
	}
	
	public int updatepost(UserVO update) {
		return userDAO.updatePost(update);
	}
	
	public List<UserVO> selectDetail(UserVO PID) {
		return userDAO.detailPost(PID);
	}
	
	public int increView(UserVO PID) {
		return userDAO.increView(PID);
	}
	 
	public int totalrec() {
		return userDAO.totalrec();
	}
	
	public List<Map<String, Object>> currentPage(int ListPage){
		return userDAO.currentPage(ListPage);	
	}
	
	public List<Map<String, Object>> selComment(UserVO PID){ 
		return userDAO.selComment(PID); 
	}
	
	public int regicomment(UserVO regicomm) {
		return userDAO.regicomment(regicomm);
	}
	
	public int regireply(UserVO regireply) {
		return userDAO.regireply(regireply);
	}
	
	public int delcomment(UserVO delcom) {
		return userDAO.delcomment(delcom);
	}
	public int editcomment(UserVO edit) {
		return userDAO.editcomment(edit);
	}
	
	public int backupcomment(UserVO edit) {
		return userDAO.backupcomment(edit);
	}
	 
}

