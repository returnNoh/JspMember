<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#e0ffff">
<center><b>글목록(전체 글:<%=1%>)</b>
<table width="700">
<tr>
    <td align="right" bgcolor="#b0e0e6">
    <a href="writeForm.jsp">글쓰기</a>
    </td>
</table>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="#b0e0e6"> 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
   <tr height="30">
    <td align="center"  width="50" ></td>
    <td  width="250" >
	
	  <img src="images/level.gif" width="0" height="16">
	  <img src="images/re.gif">
	  <img src="images/level.gif" width="0" height="16">          
      <a href="content.jsp?num=3&pageNum=1">
           게시판연습</a> 
         <img src="images/hot.gif" border="0"  height="16"> </td>
    <td align="center"  width="100"> 
       <a href="mailto:nup49rok1@empal.com">이연수</a></td>
    <td align="center"  width="150">2006/12/26</td>
    <td align="center"  width="50">3</td>
    <td align="center" width="100" >127.0.0.1</td>
  </tr>
</table>
</center>
</body>
</html>