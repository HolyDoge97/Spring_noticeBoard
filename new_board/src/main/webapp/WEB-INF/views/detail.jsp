<p>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>게시물 상세 페이지</title>

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
				<tr height="200">
					<th style="background-color: BFE9F9"> 내용 </th> <th>     ${postde.postMain}   </th>
				</tr>
			</c:forEach>
		</table>
	
	
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
