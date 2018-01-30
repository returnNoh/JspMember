<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>탈퇴확인</title>
<%request.setCharacterEncoding("UTF-8"); 
	

%>
</head>
<body bgcolor="#FFFFCC">
<center>
<h2><%=request.getParameter("mem_id") %>님 비밀번호를 입력하시면 회원탈퇴처리가 됩니다.</h2>
<form method="post" action="deleteForm.jsp">
비밀번호 : <input type="password" name="mem_passwd"><input type="hidden" name="mem_id" value="<%=session.getAttribute("idkey")%>">
<input type="submit" value="비밀번호 확인">
</form>

</center>
</body>
</html>