<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>글 작성 페이지입니다.</title>
</head>
<body>
	<center>
		<h2>글 작성 페이지입니다.</h2>
			<h3>
				<a href="/list?currentPage=1">TEST space Here</a>
			</h3>
			
    <form action="insertPage" name="insert" method="post">
        <p>작성자<input type="text" name="postMan" /></p>
        <p>제목<input type="text" name="postTitle" /></p>
        <p>본문<input type="text" name="postMain" /></p>
        <input type="submit" value="작성" />
	</form>
	
			
	</center>
</body>