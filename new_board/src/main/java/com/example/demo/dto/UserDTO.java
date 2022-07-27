package com.example.demo.dto;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.newBoard.UserVO;

@Repository
 public class UserDTO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE= "com.example.demo.mapper.";
	
	public List<UserVO> selectUser() throws Exception{
		return sqlSession.selectList(NAME_SPACE+"selectBoard");
	}
	
	public int insertPage(UserVO userVo){
		return sqlSession.insert(NAME_SPACE+"insertBoard", userVo);
	}
	
	public int deletePage(UserVO deleteNum){
		return sqlSession.delete(NAME_SPACE+"delBoard", deleteNum);
	}
	
	public int updatePost(UserVO update){
		return sqlSession.update(NAME_SPACE+"upPost", update);
	}
	
	public List<UserVO> detailPost(UserVO PID) {
		return sqlSession.selectList(NAME_SPACE+"detailPost", PID);
	}
	
	public int increView (UserVO PID) {
		return sqlSession.update(NAME_SPACE+"increView", PID);
				
	}  
	public int totalrec () {
		return sqlSession.selectOne(NAME_SPACE+"totalrec");
	}
	
	public List<Map<String, Object>> currentPage(int ListPage) {
		return sqlSession.selectList(NAME_SPACE+"currentPage", ListPage);
	}
	
	public List<Map<String, Object>> selComment(UserVO PID) { 
		return sqlSession.selectList(NAME_SPACE+"selComment", PID); 
		}
	
	public int regicomment(UserVO regicomm) {
		return sqlSession.insert(NAME_SPACE+"regicomment", regicomm);
	}
	
	public int regireply(UserVO regireply) {
		return sqlSession.insert(NAME_SPACE+"regireply", regireply);
	}
	
	
}
