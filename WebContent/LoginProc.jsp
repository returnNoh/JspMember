<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.MemberDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="MD" class="user.MemberDAO">
</jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id =request.getParameter("mem_id");
	String mem_passwd = request.getParameter("mem_passwd");
	String mem_name = request.getParameter("mem_name");
	String mem_email = request.getParameter("mem_email");
	String mem_phone = request.getParameter("mem_phone");
	String mem_zipcode = request.getParameter("mem_zipcode");
	String mem_address = request.getParameter("mem_address");
	String mem_job = request.getParameter("mem_job");
	System.out.println(mem_id+":"+mem_passwd);
	//MemberDAO MD = new MemberDAO();
	if(MD.login_Check(mem_id, mem_passwd)){
		session.setAttribute("idkey", mem_id);
		
		
		System.out.println(session.getAttribute("idkey"));
		
		response.sendRedirect("Login.jsp");
	}else{
		response.sendRedirect("Loginjsp");
	}
%>



<body>

</body>
</html>