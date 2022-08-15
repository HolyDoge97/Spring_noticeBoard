package com.example.demo.service;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.example.demo.newBoard.UserVO;

public interface UserService {
	public List<UserVO> select();
}
