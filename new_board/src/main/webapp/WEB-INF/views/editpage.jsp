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

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
<script> 

 function EditPost() {
	postNum = document.getElementById("postNum").innerText;
	postTitle = document.getElementById("postTitle").innerText;
	postMain = document.getElementById("postMain").innerText;
	var answer = confirm("수정하시겠습니까?");
	if(answer) {
 		var query = {"postNum" : postNum,
					"postTitle" : $("#postTitle"). val(),
					"postMain" : $("#postMain"). val()};
 		
			$.ajax({
				url: "/EditPost",
				type: "post",
				data: query,
				datatype: "json",
				error: function() {
					let url = "/list";
					location.href='/list';
				},
				success: function() {
					let url = "/list";
					location.href='/list';
					}
	
				});
			}
}


</script>
</head>

<body>
	<h1 style="color: 006B92"><a href="/">게시글 수정페이지</a></h1>
		<form name="edit" action="" >
		<table border="1">
			<c:forEach items="${postdetail}" var="postde">
 				<tr height="40">
					<th style="background-color: BFE9F9"> 글ID </th> 
					<th id="postNum">${postde.postNum} </th>
				</tr>
				<tr height="40" >
					<th width="180" style="background-color: BFE9F9"> 제목 </th> 
					<th width="750"><input type="text" id="postTitle" value="${postde.postTitle}" style="width:750px;height:30px;font-size:15px;" />  </th>
				</tr>
				<tr height="40">
					<th style="background-color: BFE9F9"> 작성자 </th> <th>     ${postde.postMan}   </th>
				</tr>
				<tr height="200">
					<th style="background-color: BFE9F9"> 내용 </th> 
					<th><input type="text" id="postMain" value="${postde.postMain}" style="width:750px;height:200px;font-size:15px;" />   </th>
				</tr>
			</c:forEach>
		</table>
			<input type="button" value="수정" onclick="EditPost()" /> 
		</form>
</body>
</html>