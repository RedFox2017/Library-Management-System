<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="lightskyblue">
     <%! Connection con;
         ResultSet rs;
         PreparedStatement ps;
         String bid;
         String sid;
         String issdate;
         String expdate;
      %>    
      <%
       Class.forName("oracle.jdbc.driver.OracleDriver");
       con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
       ps=con.prepareStatement("select * from olissbook");
       rs=ps.executeQuery();
       %>
       <center>
       <table border="1">
       <tr><th>STUDENT ID</th><th>BOOK ID</th><th>ISSUE DATE</th><th>EXPIRY DATE</th></tr>       
       <%
       while(rs.next())
       {
        sid=rs.getString(1);
        bid=rs.getString(2);
        issdate=rs.getString(3);
        expdate=rs.getString(4);
      %>
      
        <tr>
           <td><%=sid%></td>
           <td><%=bid%></td>
           <td><%=issdate%></td>
           <td><%=expdate%></td>
       </tr>
      
      <%
       }
      %>
      </table>
    </center> 
    </body>
</html>
