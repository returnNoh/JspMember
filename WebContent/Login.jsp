<%@page contentType="text/html;charset=UTF-8"%>
<HTML>
 <HEAD>
  <TITLE> 로그인 </TITLE>
<link href="style.css" rel="stylesheet"
      type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="script.js">
</SCRIPT>
 </HEAD>

 <BODY onload="document.login.mem_id.focus()" bgcolor="#FFFFCC">
  <center>
  <!-- mem_id의 상태에따라 로그인 처리 -->
  <br><br><br>
  <%//회원만 볼수있다면 - // 로그인이 되어있는지 확인

String mem_id = (String)session.getAttribute("idkey") ;
System.out.println(mem_id+"로 로그인되었습니다.");
%>
<%
if(mem_id!=null){
	%>

	<b><%=mem_id%>님 환영합니다.</b>
	<a href="MemberUpdate.jsp">회원수정</a>
	<a href="#">회원탈퇴</a>
	<%if(mem_id.equals("admin")){ %>
	<a href="#">회원리스트</a>
	<%} %>
	<a href="Logout.jsp">Logout</a>
	<%
}else{%>



  <!-- 로그인 안된 상태 -->
     <TABLE>
    <form name="login" method="post" 
	                   action="LoginProc.jsp">
     <TR>
		<TD align="center" colspan="2">
		<h4>로그인</h4></TD>
     </TR>

     <TR>
		<TD>아이디</TD>
		<TD><INPUT TYPE="text" NAME="mem_id"></TD>
     </TR>
     <TR>
		<TD>비밀번호</TD>
		<TD><INPUT TYPE="password" NAME="mem_passwd"></TD>
     </TR>
     <TR>
		<TD colspan="2"><div align="center">
		<INPUT TYPE="button" value="로그인" onclick="loginCheck()">&nbsp;
		<INPUT TYPE="button" value="회원가입"
		onclick="memberReg()">
		</div>
		</TD>
     </TR>
	 </form>
     </TABLE>
     <%
}
%>
  </center>
 </BODY>
</HTML>
