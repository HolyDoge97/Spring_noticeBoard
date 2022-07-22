package com.example.demo.newBoard;

/*import java.security.Timestamp;*/
import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

public class UserVO {
	private int postNum;
	private String postMan;
	private String postTitle;
	private String postMain;
	private Timestamp postTime;
	private int postView;
	private String postComment;
	
	
	//글 번호 영역
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	
	// 작성자 영역
	public String getPostMan() {
		return postMan;
	}
	public void setPostMan(String postMan) {
		this.postMan = postMan;
	}
	
	// 제목 영역
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	
	//본문 영역
	public String getPostMain() {
		return postMain;
	}
	public void setPostMain(String postMain) {
		this.postMain = postMain;
	}
	
	// 날짜+시간 영역
	public Timestamp getPostTime() {
		return postTime;
	}
	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}
	
	// 조회수 영역
	public int getPostView() {
		return postView;
	}
	public void setPostView(int postView) {
		this.postView = postView;
	}
	
	// 댓글 영역
	public String getPostComment() {
		return postComment;
	}
	public void setPostComment(String postComment) {
		this.postComment = postComment;
	}
}

