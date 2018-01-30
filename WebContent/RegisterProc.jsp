<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<%
		request.setCharacterEncoding("UTF-8");

/* String mem_id = request.getParameter("mem_id");
String mem_passwd = request.getParameter("mem_passwd");
String mem_name = request.getParameter("mem_name");
String mem_email = request.getParameter("mem_email");
String mem_phone = request.getParameter("mem_phone");
String mem_zipcode = request.getParameter("mem_zipcode");
String mem_address = request.getParameter("mem_address");
String mem_job = request.getParameter("mem_job"); */
%>
<jsp:useBean id="save" class="user.MemberDTO" scope="page"/>
<jsp:setProperty property="*" name="save"/>



<title>회원가입확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#996600" onLoad="regForm.mem_id.focus()">
<br><br>
<table align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="MerberInsert.jsp">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF"><b>고객님이 입력하신 정보입니다.</b></font></td>
          </tr>
          <tr> 
            <td width="16%">아이디</td>
            <td width="57%"> <input type="text" name="mem_id" size="15" value="<jsp:getProperty property="mem_id" name="save"/>" readonly="readonly"></td>
        	</tr>
        	
          <tr> 
            <td>이름</td>
            <td> <input type="text" name="mem_name" size="15" value="<jsp:getProperty property="mem_name" name="save"/>" readonly="readonly"> </td>
          </tr>
          
          <tr> 
            <td>이메일</td>
            <td> <input type="text" name="mem_email" size="27" value="<jsp:getProperty property="mem_email" name="save"/>" readonly="readonly"> </td>
          </tr>
          
          <tr>  
            <td>전화번호</td>
            <td> <input type="text" name="mem_phone" size="20" value="<jsp:getProperty property="mem_phone" name="save"/>" readonly="readonly"> </td>
          </tr>
          
		  <tr>  
            <td>우편번호</td>
            <td> <input type="text" name="mem_zipcode" size="7" value="<jsp:getProperty property="mem_zipcode" name="save"/>" readonly="readonly"></td>
          </tr>
          
		  <tr>  
            <td>주소</td>
            <td><input type="text" name="mem_address" size="70" value="<jsp:getProperty property="mem_address" name="save"/>" readonly="readonly"></td>
          </tr>
          
		  <tr>  
            <td>직업</td>
            <td><input type="text" name=mem_job size="10" value="<jsp:getProperty property="mem_job" name="save"/>" readonly="readonly"></td>
          </tr>
          
          
          <input type="hidden" name=mem_passwd value="<jsp:getProperty property="mem_passwd" name="save"/>">
          <tr> 
            <td colspan="3" align="center"> 
             <input type="submit" value="확인완료"> 
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
             <input type="reset" value="다시쓰기" onclick="JavaScript:history.back()"> 
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
