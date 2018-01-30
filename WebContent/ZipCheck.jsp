<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호 검색</title>
<link href="style.css" rel="stylesheet"
         type="text/css">
         <%
         request.setCharacterEncoding("UTF-8");
         String area3 = request.getParameter("area3");
         System.out.println("area3:"+area3);
         ZipcodeDTO dto = null;
         MemberDAO zip = new MemberDAO();
         ArrayList<ZipcodeDTO> zipcode = zip.zipcode_Check(area3);
         %>
<script>
//동이름을 체크할 함수선언
  function dongCheck(){
	  if(document.zipForm.area3.value==""){
		  alert("동이름을 먼저 입력하세요!");
		  document.zipForm.area3.focus();
		  return;
	  }
	  document.zipForm.submit();
  }
  
  function sendAddress(a,b,c,d,e){
	  code="";
	  opener.document.regForm.mem_zipcode.value=a;
		code+=b+" "+c+" "+d+" "+e;
		opener.document.regForm.mem_address.value=code;
		self.close();
  }
</script>
</head>
<body bgcolor="#FFFFCC">
  <center>
    <b>우편번호 찾기</b>
    <table>
  
   <form name="zipForm" method="post"
             action="ZipCheck.jsp">
        <tr>
        <td><br>
        동이름 입력:<input type="text"
                                    name="area3">
        <input type="button" value="검색"
                   onclick="dongCheck()">
        </td>
        </tr>    
        <input type="hidden" name="check"
                                          value="y">
   </form>
   <%
   if(request.getParameter("check").equals("y")){
   		if(zipcode.size()==0){
   %>
  	
      <tr><td align="center">
            <br>검색된 레코드가 없습니다.
          </td>
      </tr>
      <%}else{ %>
   <tr><td align="center"><br>
   *검색후 ,아래 우편번호를 클릭하면 자동으로
     입력됩니다</td></tr>
     <%
     for(int i=0;i<zipcode.size();i++){
    	 dto=zipcode.get(i);
    	 String temp_zipcode=dto.getMem_zipcode().trim();
    	 String temp_area1=dto.getArea1().trim();
    	 String temp_area2=dto.getArea2().trim();
    	 String temp_area3=dto.getArea3().trim();
    	 String temp_area4=dto.getArea4().trim();
     %>
  <tr><td>
  <a href="JavaScript:sendAddress('<%=temp_zipcode%>','<%=temp_area1%>,'<%=temp_area2%>,'<%=temp_area3%>,'<%=temp_area4%>)">
  <%=temp_zipcode %>&nbsp;<%=temp_area1 %>&nbsp;
  <%=temp_area2 %>&nbsp;<%=temp_area3 %>&nbsp;
  <%=temp_area4 %>
  </a><br>
 <%}}} %>
    </td></tr>
    <tr><td align="center"><br>
<a href="JavaScript:this.close()">닫기</a>                      
    </table>
  </center>
</body>
</html>