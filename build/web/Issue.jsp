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
   String sid;
   String bid;
   
   
  %>   
  <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
    sid=request.getParameter("bmail");
    bid=request.getParameter("bkid");
   ps=con.prepareStatement("select * from olbookdetails");
   rs=ps.executeQuery();
    while(rs.next())
    {
        if(bid.equals(rs.getString(1)))
        {
        ps=con.prepareStatement("update olbookdetails set issued='Yes' where book_id='"+bid+"'"); 
        ps.executeUpdate();
        %>
    <center><h2>BOOK ISSUED SUCCESSFULLY!</h2></center>
        <%
        break;
        }
    }
    ps=con.prepareStatement("insert into olissbook(std_id,book_id) values(?,?)");
    ps.setString(1,sid);
    ps.setString(2,bid);
    ps.executeUpdate();
    %>  
    </body>
</html>
