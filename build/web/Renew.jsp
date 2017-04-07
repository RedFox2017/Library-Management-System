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
   String sml;
   String bid;
  %>
  
  <%
  Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
    sml=request.getParameter("smail");
    bid=request.getParameter("bid");
   ps=con.prepareStatement("select * from olissbook");
   rs=ps.executeQuery();
   while(rs.next())
   {
       if(sml.equals(rs.getString(1)) && bid.equals(rs.getString(2)))
       {
        ps=con.prepareStatement("delete from olissbook where book_id='"+bid+"'");
        ps.executeUpdate();
        ps=con.prepareStatement("insert into olissbook(std_id,book_id) values(?,?)");
        ps.setString(1,sml);
        ps.setString(2,bid); 
        ps.executeUpdate();
       }
   }
%>
<b>Book successfully renewed</b>
<jsp:include page="renew.html"/>
</body>
</html>
