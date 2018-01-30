<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#FFFFCC">
<link href="style.css" rel="stylesheet" type="text/css">

<script>
function check_button(){
	  if(document.addform.area3.value==""){
		  alert("동이름을 먼저 입력하세요!");
		  document.addform.area3.focus();
		  return;
	  }
	  document.addform.submit();
	}
</script>


<center>
<h1>동 이름을 입력하여주세요.</h1>

<form name="addform" method="post" action="zipcode_check.jsp">
	<input type="text" name="area3">
	<input type="hidden" name="check" value="y">
	<input type="button" value="검색" onclick="check_button()">
	

</form>
<jsp:useBean id="zip" class="user.MemberDAO" />

<%

request.setCharacterEncoding("UTF-8");
System.out.println(request.getParameter("check"));
if(request.getParameter("check").equals("y")){
String area3 = request.getParameter("area3");
System.out.println("area3:"+area3);
ZipcodeDTO dto = null;
ArrayList zipcode = zip.zipcode_Check(area3);
System.out.println(zipcode.size());
String a,b,c,d,e;

%>
<script>
function setcode(a,b,c,d,e){
	code="";
	opener.document.regForm.mem_zipcode.value=a;
	code+=b+" "+c+" "+d+" "+e;
	opener.document.regForm.mem_address.value=code;
	opener.document.regForm.mem_address.focus();
	
	self.close();
}
</script>

<table border="1" cellpadding="3" cellspacing="3">
<%
if(zipcode.size()==0){
	out.println("아무것도 안나옴");
}else{

for(int i=0;i<zipcode.size();i++){
	
dto=(ZipcodeDTO)zipcode.get(i); 

a=dto.getMem_zipcode();
b=dto.getArea1().trim();
c=dto.getArea2().trim();
d=dto.getArea3().trim();
e=dto.getArea4().trim();
%>

<tr onclick="JavaScript:setcode('<%=a%>','<%=b%>','<%=c%>','<%=d%>','<%=e%>')">
<td>
<%=a %>
</td>
<td>
<%=b %>
</td>
<td>
<%=c %>
</td>
<td>
<%=d %>
</td>
<td>
<%=e %>
</td>
</tr>

<%
}
}
}
%>
</table>
<a href="#" onclick="self.close()">창 닫기</a>
</center>
</body>
</html>