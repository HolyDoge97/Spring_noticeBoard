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
	
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public String getPostMan() {
		return postMan;
	}
	public void setPostMan(String postMan) {
		this.postMan = postMan;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostMain() {
		return postMain;
	}
	public void setPostMain(String postMain) {
		this.postMain = postMain;
	}
	public Timestamp getPostTime() {
		return postTime;
	}
	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}
}

