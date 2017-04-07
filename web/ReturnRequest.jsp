<%-- 
    Document   : ReturnRequest
    Created on : Apr 22, 2015, 7:32:27 AM
    Author     : HARSHIT
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   <%!
   Connection con;
   ResultSet rs;
   PreparedStatement ps;
   String bid;
   
   %>  
    <%
    bid=request.getParameter("bookd");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
    ps=con.prepareStatement("select * from olissbook");
    rs=ps.executeQuery();
    while(rs.next())
    {
        if(bid.equals(rs.getString(2)))
                {
                 ps=con.prepareStatement("delete from olissbook where book_id='"+bid+"'"); 
                 ps.executeUpdate();
                  ps=con.prepareStatement("update olbookdetails set issued='No' where book_id='"+bid+"'");
                ps.executeUpdate();
                break;
                }
    }
   %>
   <b>Books Successfully Returned!</b>
   <jsp:include page="admin.jsp"/>
    </body>
</html>
