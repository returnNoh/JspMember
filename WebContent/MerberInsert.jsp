<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<title>DTO페이지</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="save" class="user.MemberDTO"/>
<jsp:setProperty property="*" name="save"/>
<jsp:getProperty property="mem_id" name="save"/>

<jsp:useBean id="info" class = "user.MemberDAO"/>


		<%
	
	boolean result=info.member_regist(save);
	System.out.println(result);
	if(result==true){
		%>
		<h1>회원가입 완료!</h1>
		<%
		
	}else{
		%>
		<h1>회원가입 오류</h1>
		<%
	}
		%>
<a href="Login.jsp">로그인 페이지로</a>
</body>
</html>