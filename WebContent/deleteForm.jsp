<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정말탈퇴?</title>
<%request.setCharacterEncoding("UTF-8"); 
	String mem_id = request.getParameter("mem_id");
	String mem_passwd = request.getParameter("mem_passwd");
	MemberDAO dao = new MemberDAO();
	if(request.getParameter("check").equals("y")){
		dao.member_delete(mem_id);
		session.invalidate();
		%>
		<script>
		alert("정상적으로 삭제되었습니다.");
		location.href="Login.jsp";
		</script>
		<%
	}
%>
</head>
<script>



</script>
<body>

<%
System.out.println(mem_id+":"+mem_passwd);

if(dao.login_Check(mem_id, mem_passwd)==true){
%>
<h2>정말로 탈퇴하시겠습니까?</h2>
<input type="button" value="예" onclick="self.location.href='deleteForm.jsp?check=y'"> <input type="button" value="아니오" onclick="JavaScript:location.href='Login.jsp'">
<%} else if(dao.login_Check(mem_id, mem_passwd)==false){%>
<h2>비밀번호가 일치하지 않습니다.</h2>
<%} %>
</body>
</html>