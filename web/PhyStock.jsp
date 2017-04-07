<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="lightskyblue">
        <%! 
        Connection con;
        ResultSet rs;
        PreparedStatement ps;
        int count;
            
        %> 
        <%
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott", "tiger");
         ps=con.prepareStatement("select * from olbookdetails");
         rs=ps.executeQuery();
         count=0;
        
         while(rs.next())
         {
             count++;
         }
        
        %>
<center><b>TOTAL BOOKS IN THE STOCK IS<%=" <h1>"+count+"</h1>"%></b></center>
</body>
</html>
