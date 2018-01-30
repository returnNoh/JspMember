<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JDBC Programming</title>
</head>
<body>

<h3>JDBC_Oracle 접속방법</h3>
<%
	String url="jdbc:oracle:thin:@192.168.0.16:1521:orcl";
	Connection con = null;//연결객체
	//sql
	Statement stmt = null;
	PreparedStatement pstmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	String sql="";
	
	
	try{
		//1. JDBC Driver를 메모리에 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2. connection 객체 얻어오기
		con=DriverManager.getConnection(url, "test1", "t1234");
		out.println("con=>"+con+"<br>");
		
		//3. 테이블생성
		/* stmt=con.createStatement();
		sql="create table MyTest (name varchar2(20),age number)";
		stmt.executeUpdate(sql);
		out.println("MyTest 테이블 생성 완료<br>"); */
		//4. 밸류 삽입
		pstmt=con.prepareStatement("insert into MyTest values(?,?)");
		pstmt.setString(1, "Test1");
		pstmt.setInt(2, 34);
		out.println("성공유무 "+pstmt.execute()+"<br>");
		//5.select
		stmt2=con.createStatement();
		rs=stmt2.executeQuery("select * from MyTest");
		
		%><table border="1" cellspaction="0" cellpadding="0">
		<tr bgcolor="pink">
		<th>이름</th>
		<th>나이</th>
		</tr>
			<%
			while(rs.next()){
			%>
			<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getInt(2) %></td>
			</tr>
			<%
			}
			%>
		<%
		
		rs.close();stmt2.close(); pstmt.close(); stmt.close(); con.close();
	}catch(Exception e){
		out.println("DB접속 오류"+e);
	}

%>
</table>
</body>
</html>