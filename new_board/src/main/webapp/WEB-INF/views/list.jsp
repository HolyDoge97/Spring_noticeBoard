<p>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>  


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
request.setCharacterEncoding("UTF-8");
String currentPage = request.getParameter("currentPage");
%>
<c:set var="currentpage" value="<%=currentPage %>" />
<fmt:parseNumber value="${currentpage/10}" type="number" var="CurrentPage" />
<c:set var="start1" value="${CurrentPage+(1-(CurrentPage%1))%1}"/>
<fmt:parseNumber var="Start2" integerOnly="true" value="${start1}" />
<c:set var="start" value="${Start2*10-9}" />
<fmt:parseNumber var="Start" integerOnly="true" value="${start}" />
<c:set var="end" value="${Start+10-1}"/>
<fmt:parseNumber var="End" integerOnly="true" value="${end}" />



<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Home</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
<script> 
	console.log("init");
/* 	$(document).ready(function(){
	alert("페이지가 새로고침 되었습니다. ㅠㅠ"); */
		/* document는 브라우저가 불러온 페이지 자체를 나타냄. 혹으 DOM트리의 진입점 역할을 함 */
		/* getElementById는 로드된 페이지에서 ID값이 괄호에 해당하는 값을 불러오는거임  */
			function DeletePost() {
				postNum = document.getElementsByName("postNum")[0].value;
				var answer = confirm("삭제하시겠습니까?");
				if(answer) {
					var query = {"postNum" : postNum};
						$.ajax({
							url: "/deleteAjax",
							type: "post",
							data: query,
							datatype: "json",
							error : function() {
								$('#tablelist').load(location.href+ ' #tablelist');
							},
							success : function() {
								$('#tablelist').load(location.href+ ' #tablelist');
								}
							});
						}
		}
</script>

</head>
<body>

	<h1>게시물 목록</h1>
	
	<h2><a href = "/">홈으로</a></h2>
	
		<table id="tablelist" border="1">
			<thead>	
				<tr height="40">
					<th width="100" style="background-color: BFE9F9">글ID</th>
					<th width="200" style="background-color: BFE9F9">작성자</th>
					<th width="300" style="background-color: BFE9F9">제목</th>
					<th width="200" style="background-color: BFE9F9">작성일</th>
					<th width="100" style="background-color: BFE9F9">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${postList}" var="post">
					<tr height="40">
						<td width="80">${post.postNum}</td>
						<td width="80">${post.postMan}</td>
						<td width="400">
						<a href="/detail?postNum=${post.postNum}" >
							<c:out value="${post.postTitle}" />
						</a>
						</td>
						<td width="250">${post.postTime}</td>
						<td width="80">${post.postView}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		 	

<c:if test="${curr!=1}">
	<a href="/list?currentPage=${Start-pageSepSize}">Prev</a>
</c:if>
<c:forEach var="pagePrint" begin="${Start}" end="${End}" >
	 <c:if test="${pagePrint<=totalpage+1}">
		<a href="/list?currentPage=${pagePrint}">
			<c:out value="${pagePrint}" />
		</a>
	</c:if>
</c:forEach>

<c:if test="${tot!=curr}">
	<a href="/list?currentPage=${End+1}">Next</a>
</c:if>


		 
		<form action="deletePost" name="delete" method="post">
			<p>삭제할 게시글의 ID를 입력하세요    <input type="text" name="postNum" /></p>
			<input type="button" value="삭제" onclick="DeletePost()" />
		</form>

		
	</body>
	</html>
</p>
