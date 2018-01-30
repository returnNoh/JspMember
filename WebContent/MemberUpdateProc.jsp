<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<title>회원가입확인</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="save" class="user.MemberDTO"/>
<jsp:setProperty property="*" name="save"/>

<jsp:useBean id="info" class = "user.MemberDAO"/>

<center>
		<%
	
	boolean result=info.member_modify(save);
	System.out.println(result);
	if(result==true){
		%>
		<script>
		alert("수정성공!");
		location.href="Login.jsp"
		</script>
		<%
	}else{
		%>
		<script>
		alert("수정실패");
		location.href="Login.jsp"
		</script>
		<%
	}
		%>
</center>
</body>
</html>