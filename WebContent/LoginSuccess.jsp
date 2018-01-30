<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%//회원만 볼수있다면 - // 로그인이 되어있는지 확인

String mem_id = (String)session.getAttribute("idkey") ;


System.out.println(mem_id+"로 로그인되었습니다.");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY PAGE</title>
</head>
<body bgcolor="#FFFFCC">
<%


if(mem_id==null){
	
	response.sendRedirect("Login.jsp");
}else{%>

<b><%=mem_id%>님 환영합니다.</b>
<a href="Logout.jsp">Logout</a>
<%
	
	
}

%>
</body>
</html>