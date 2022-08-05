<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
<%
//SQL패키지 임포트
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SQL package import</title>
</head>
<body>
<%
// JDBC 드라이버 로딩
String driverClass = "com.mysql.jdbc.Driver";

try{
	Class.forName(driverClass);
	out.print("JDBC Driver loading 성공 !!<br>");
}catch(ClassNotFoundException e){
	out.print("JDBC Driver loading 실패ㅜㅜ<br>");
	
}

//MYSQL 데이터베이스 서버 연결
String url = "jdbc:mysql://localhost:3306/test";
String id = "root";
String pw = "0000";

// connection object 생성
Connection conn = null;

try{
	conn = DriverManager.getConnection(url, id, pw);
	out.print("MYSQL 서버 연결 성공!!<br>");
} catch(SQLException e) {
	out.print("MYSQL 서버 연결 실패ㅜㅜ<br>");
} 


//SQL 구문 객체 작성
String sql = "CREATE DATABASE test";
PreparedStatement pstmt = conn.prepareStatement(sql);

String sql2 = "CREATE TABLE student(id char(20))";
PreparedStatement pstmt2 = conn.prepareStatement(sql2,1);


//SQL 구문 실행
try{
pstmt.executeUpdate();
out.print("데이터베이스 생성 성공!!!<br>");
} catch (SQLException e){
	out.print("데이터베이스 생성 실패ㅜㅜ<br>");
	out.print(e.getMessage()+"<br>");
}



try{
pstmt2.executeUpdate();
out.print("테이블 생성 성공!!!<br>");
} catch (SQLException e){
	out.print("테이블 생성 실패ㅜㅜ<br>");
	out.print(e.getMessage()+"<br>");
}


%>
</body>
</html>