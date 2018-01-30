<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
request.setCharacterEncoding("UTF-8");
int page_num = Integer.parseInt(request.getParameter("page_num"));
if(page_num==0) page_num=1;
MemberDAO dao = new MemberDAO();
ArrayList<MemberDTO> list = dao.member_list(page_num,10,10);
MemberDTO dto = null;


%>
<title>memberList</title>
</head>
<body>

<center>
<table border="1">

<%
if(list.size()!=0){
for(int i=0;i<list.size();i++){
dto = list.get(i);
%>

<tr>
<td><%=dto.getMem_id() %></td>
<td><%=dto.getMem_name() %></td>
<td><%=dto.getMem_email() %></td>
<td><%=dto.getMem_phone() %></td>
<td><%=dto.getMem_zipcode() %></td>
<td><%=dto.getMem_address() %></td>
<td><%=dto.getMem_job() %></td>
</tr>
<%} }else{%><b>더 이상 정보가 없습니다.</b><%} %>


</table>
<br>

<%

int first = (page_num/10);
int last = first;
first=first*10;

if(last==0) last=10;
else last=(last+1)*10;
%>
<br>
<%if(page_num>=10){%>
<a href="MemberList.jsp?page_num=<%=((page_num/10)-1)*10%>">이전</a>
<%}for(int i = first+1 ; i<last; i++) {%>
<a href="MemberList.jsp?page_num=<%=i%>"><b><%=i%></b></a>
<%} %><a href="MemberList.jsp?page_num=<%=((page_num/10)+1)*10%>">다음</a><br>
<a href ="Login.jsp">돌아가기</a>
</center>

</body>
</html>