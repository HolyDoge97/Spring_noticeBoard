package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.UserDTO;
import com.example.demo.newBoard.UserVO;

@Service
public class UserServiceImpl{

	@Autowired
	private UserDTO userDAO;
	
	
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
}

