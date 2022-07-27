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

<style>
.postNoDisplay{
	display:none;}
.commentButton{
	width:35;
	height:35;}
.replyInputTag{
	width:150;
	height:50;
	font-size:17px;}
.replyInputButton{
	width:30;
	height:35;
	font-size:17px;}
</style>
<%
request.setCharacterEncoding("UTF-8");
String Postnum = request.getParameter("postNum");
%>

<c:set var="currentpage" value="<%=Postnum %>" />
<fmt:parseNumber value="${currentpage/10}" type="number" var="CurrentPage" />
<c:set var="start1" value="${CurrentPage+(1-(CurrentPage%1))%1}"/>
<fmt:parseNumber var="Start2" integerOnly="true" value="${start1}" />
<c:set var="start" value="${Start2*10-9}" />
<fmt:parseNumber var="Start" integerOnly="true" value="${start}" />
<c:set var="end" value="${Start+10-1}"/>
<fmt:parseNumber var="End" integerOnly="true" value="${end}" />

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
<script> 

/* ------------------글삭제 스크립트------------------ */
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
/* ------------------글삭제 스크립트------------------ */

/* ------------------댓글 작성 스크립트------------------ */
function regiComment(){
	var postNum= <%=Postnum%>
	var postComment = document.getElementById("inputComment").value;
	var answer = confirm("등록하시겠습니까?"); 
	if(answer) {
			$.ajax({
				url: "/regiComment" ,
				type: "post" ,
				data : {"postNum" : postNum,
						"postComment" : postComment,
						"depth" : 0
						},
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
/* ------------------댓글 작성 스크립트------------------ */

/* ------------------대댓글 작성 스크립트------------------ */

/* 댓글등록 버튼 클릭시 input 노출 스크립트 */
function popReply(event) {
	var popTag = '<th>'+
					 '<input class="replyInputTag" id="reply_text" type="text" value=" " />'+
					 '<input class="replyInputButton" id="reply_button" type="button" value="등" onclick="regiReply(event)" />'+
				 '</th>';
	$(event.target).parent().parent().append(popTag);
}

/* 댓글 내용 컨트롤러 전송 스트립트 */
function regiReply(event){
	var replyMain= (reply_text).value;
	var postNum = document.getElementById("idPostnum").innerText; //문제 없음
	var depth = document.getElementById("idDepth").innerText; // 
	var groupID = document.getElementById("idGid").innerText; //
	var answer = confirm("등록하시겠습니까?");
	 if(answer) {
		$.ajax({
			url: "/regiReply" ,
			type: "post" ,
			data : {"postNum" : postNum,
					"postComment" : replyMain,
					"depth" : depth+1,
					"groupID" : groupID
					},
			datatype : "json" ,			
			error : function(){
				$(event.target).parent().remove();
				$('#commentList').load(location.href+ ' #commentList');
			},
			success : function(){
				alert("등록되었습니다.");
				$(event.target).parent().remove();
				$('#commentList').load(location.href+ ' #commentList');
			}
		});
	}	
}
/* ------------------대댓글 작성 스크립트------------------ */
function commDel(){
	alert("공사중");	
}

function commEdit() {
	alert("공사중");
}

</script>
</head>

<body>
<!-- ----------------- 게시글 상세내용 --------------------------->


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
		
<!-- ----------------- 게시글 상세내용 --------------------------->		
		
<!-- ----------------- 댓  글  리 스 트  --------------------- -->

<br>
<br>

<strong>댓글 입력</strong>
<br>
	
		<table id="commentList">
		<c:forEach items="${commentList}" var="comm">
		<c:choose>
			<c:when test="${comm.depth eq 0}">
					<tr height="50">
						<th id="commentParent" width="700" 
						style="background-color: E4F2FF;font-size:14px;text-align:left;">
						&nbsp;&nbsp;${comm.commentMain}</th> 
						<th class="postNoDisplay" id="idPostnum">${comm.postNum}</th> 
						<th class="postNoDisplay" id="idDepth">${comm.depth}</th> 
						<th class="postNoDisplay" id="idGid">${comm.groupID}</th> 
							<th>
								<input class="commentButton" id="commdel" name="commdel"
									type="button" value="삭" 
									onclick="commDel()"
									style="background-color: 30C1FF;font-size:14px;"/> 
								<input class="commentButton" id="commedit" name="commedit"
									type="button" value="수" 
									onclick="commEdit()"
									style="background-color: 30C1FF;font-size:14px;"/>
								<input class="commentButton" id="commreply" name="commreply"
									type="button" value="댓" 
									onclick="popReply(event)"
									style="background-color: 30C1FF;font-size:14px;"/>
							</th>	
					</tr>	
				</c:when>
				<c:otherwise>
				<tr height="50">
						<th id="commentChild" width="700" 
						style="background-color: E4F2FF;font-size:14px;text-align:left;">
							<c:forEach var="depth" begin="0" end="${comm.depth}">
								&nbsp;&nbsp;
							</c:forEach>
							&nbsp;&nbsp;⇒&nbsp;${comm.commentMain}</th> 
							<th class="postNoDisplay" id="idPostnum">${comm.postNum}</th> 
							<th class="postNoDisplay" id="idDepth">${comm.depth}</th> 
							<th class="postNoDisplay" id="idGid">${comm.groupID}</th>  
							<th>
								<input class="commentButton" id="commdel" name="commdel"
									type="button" value="삭" 
									onclick="commDel()"
									style="background-color: 30C1FF;font-size:14px;"/> 
								<input class="commentButton" id="commedit"  name="commedit"
									type="button" value="수" 
									onclick="commEdit()"
									style="background-color: 30C1FF;font-size:14px;"/>
								<input class="commentButton" id="commreply"  name="commreply"
									type="button" value="댓" 
									onclick="popReply(event)"
									style="background-color: 30C1FF;font-size:14px;"/>
							</th>
					</tr>
				</c:otherwise>
			</c:choose>
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
				<input type="text" id="inputComment" onkeyup="if(window.event.keyCode==13){regiComment()}"
						value=" " style="width:800px;height:50px;font-size:15px;" />
			</td>
			<td><input type="button" value="등록" name="regiComm" onclick="regiComment()" 
						onkeyup="if(window.event.keyCode==13){regiComment()}" 
						style="width:100px;height:50px;font-size:15px;" />
			</td>
		</tr>
	</tbody>
</table>
<br>
<!-- ----------------- 댓  글 입 력 창 -------------------------  -->

<!-- ----------------- 글  리 스 트 -------------------------  -->

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

<!-- ----------------- 글  리 스 트 -------------------------  -->
