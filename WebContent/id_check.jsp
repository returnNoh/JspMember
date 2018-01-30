<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Id중복체크</title>
<link href="style.css" rel="stylesheet"
      type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="script.js">
</SCRIPT>
</head>
<body bgcolor="#FFFFCC">

<jsp:useBean id="MD" class="user.MemberDAO">
</jsp:useBean>

<%

	request.setCharacterEncoding("UTF-8");
	String id =request.getParameter("mem_id");
	if(MD.register_Check_Id(id)){
		%>
		<h2><%=id %>는<br> 사용 불가능한 아이디 입니다.</h2>
		<%
	}else{%>
		<h2><%=id %>는<br> 사용 가능한 아이디 입니다.</h2>
	<%
	
	}

%>

<a href="#" onclick="javascript:self.close()">돌아가기</a>

</body>
</html>