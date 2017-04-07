<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="lightskyblue">
        
<%! Connection con;
    ResultSet res;
    PreparedStatement ps;
    int counter; 
%>      

<%
String bi=request.getParameter("bid");
String bna=request.getParameter("bkna");
bna=bna.toUpperCase();
String ana=request.getParameter("auna");
String lbn=request.getParameter("lsbn");
String bs=request.getParameter("bstm");

Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott", "tiger");

ps=con.prepareStatement("insert into olbookdetails(book_id,book_name,author,rack_no,stream) values(?,?,?,?,?)");

ps.setString(1,bi);
ps.setString(2,bna);
ps.setString(3,ana);
ps.setString(4,lbn);
ps.setString(5,bs);

int i=ps.executeUpdate();
if(i!=0)
{
%>    
<jsp:forward page="admin.jsp"/>   
<%
}
%>     
      
 </body>
</html>
