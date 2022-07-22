<p>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시물 상세 페이지</title>

<%
request.setCharacterEncoding("UTF-8");
String Postnum = request.getParameter("postNum");
%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
<script> 

function DeletePost() {
	/* postNum = document.getElementsByName("${postde.postNum}")[0].value; */
	var  postNum = parseInt(${postdetail[0].postNum});
	var answer = confirm("삭제하시겠습니까?");
	if(answer) {
		var query = {"postNum" : postNum};
			$.ajax({
				url: "/deleteAjax",
				type: "post",
				data: query,
				datatype: "json",
				error: function() {
					let url = "/list";
					location.replace(url);
				},
				success: function() {
					let url = "/list";
					location.replace(url);
			}
	
				});
			}
}
function regiComment(int parent_ID){
	var postNum= <%=Postnum%>
	var postComment = document.getElementById("inputComment").value;
	var answer = confirm("등록하시겠습니까?"); 
	if(answer) {
		var query = {"postNum" : postNum,
					"postComment" : postComment,
					"parent_ID" : parent_ID}
			$.ajax({
				url: "/regiComment" ,
				type: "post" ,
				data : {"postNum" : postNum,
					"postComment" : postComment,
					"parent_ID" : parent_ID} ,
				datatype : "json" ,
				error: function(){
					$('#commentList').load(location.href+ ' #commentList');
					$("#inputComment").val("");
				},
				success: function() {
					$('#commentList').load(location.href+ ' #commentList');
					$("#inputComment").val("");
				}		
			});
		}
	
	}
	
function commDel(){
	
	
	
}

function commEdit() {
	
	
	
}
</script>
</head>

<body>


	<h1 style="color: 006B92"><a href="/">게시글 상세페이지</a></h1>
	
		<table border="1">
			<c:forEach items="${postdetail}" var="postde">
				<tr height="40" >
					<th width="180" style="background-color: BFE9F9"> 제목 </th> <th width="750">    ${postde.postTitle}  </th>
				</tr>
				<tr height="40">
					<th style="background-color: BFE9F9"> 작성자 </th> <th>     ${postde.postMan}   </th>
				</tr>
				<tr height="40">
					<th style="background-color: BFE9F9"> 작성일 </th> <th>     ${postde.postTime}   </th>
				</tr>
				<tr height="40">
					<th style="background-color: BFE9F9"> 조회수 </th> <th>     ${postde.postView}   </th>
				</tr>
				<tr height="200">
					<th style="background-color: BFE9F9"> 내용 </th> <th>     ${postde.postMain}   </th>
				</tr>
			</c:forEach>
		</table>
		<br>
		<input type="button" value="삭제" onclick="DeletePost()" />
		<c:forEach items="${postdetail}" var="postde">
			<a href="/editpage?postNum=${postde.postNum}" >
				<input type="button" value="수정" />
			</a>
		</c:forEach>
<!-- ----------------- 댓  글  리 스 트  -------------------------  -->
<br>
<br>
<strong>댓글 입력</strong>
<table id="commentList">
	<c:forEach items="${commentList}" var="comm">
		<tr height="50">
			<th width="700" 
			style="background-color: E4F2FF;font-size:14px;text-align:left;">
			&nbsp;&nbsp;${comm.commentMain}</th>
			<th>
				<input id="commdel"
				type="button" value="삭제" 
				onclick="commDel()"
				style="background-color: 30C1FF;font-size:14px;"/> 
				<br>
				<input id="commedit" 
				type="button" value="수정" 
				onclick="commEdit"
				style="background-color: 30C1FF;font-size:14px;"/>
			</th>	
		</tr>	
	</c:forEach>
</table>
<!-- ----------------- 댓  글  리 스 트 -------------------------  -->

<!-- ----------------- 댓  글  입 력 창-------------------------  -->

<table>	
	<thead>
		<tr>
		<th width="800" style="background-color: BFE9F9">내용</th>
		<th width="100" style="background-color: BFE9F9">입력</th>
 		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<input type="text" id="inputComment" onkeyup="if(window.event.keyCode==13){regiComment(0)}"
						value=" " style="width:800px;height:50px;font-size:15px;" />
			</td>
			<td><input type="button" value="등록" name="regiComm" onclick="regiComment(0)" 
						onkeyup="if(window.event.keyCode==13){regiComment()}" 
						style="width:100px;height:50px;font-size:15px;" />
			</td>
		</tr>
	</tbody>
</table>
<br>
<!-- ----------------- 댓  글 입 력 창 -------------------------  -->
		<table border="1">
			<thead>	
				<tr>
					<th width="100" style="background-color: BFE9F9">글ID</th>
					<th width="200" style="background-color: BFE9F9">작성자</th>
					<th width="500" style="background-color: BFE9F9">제목</th>
					<th width="300" style="background-color: BFE9F9">작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${postList}" var="post">
						<tr height="35">
							<td>${post.postNum}</td>
							<td>${post.postMan}</td>
							<td width="200">
								<a href="/detail?postNum=${post.postNum}">
								<c:out value="${post.postTitle}" />
								</a>
							</td>
							<td>${post.postTime}</td>
						
						</tr>
				</c:forEach>
			</tbody>

		</table>
	</body>
	</html>

</p>