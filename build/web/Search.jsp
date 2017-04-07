<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%! Connection con;
        ResultSet rs;
        PreparedStatement ps;
        String bnch,bn;
        static int count;
     %> 
        <%
         bnch=request.getParameter("branch");
         bn=request.getParameter("bname");
         bn=bn.toUpperCase();
     
         
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott", "tiger");    
         ps=con.prepareStatement("select * from olbookdetails where stream=? and book_name=? and issued='No'");
        ps.setString(1,bnch);
         ps.setString(2,bn);
         rs=ps.executeQuery();
        out.print("<body bgcolor='lightskyblue'>");
        out.print("<center>");
        out.print("<h2><font color='Red'>AVAILABLE BOOK DETAILS</font></h2></br>");                     
	out.print("<table>");
       
	out.print("<tr><th>BOOK ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th><th>BOOKNAME&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th><th>AUTHOR&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th><th>RACK NO&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th><th>STREAM&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th><th>ISSUED&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th></tr></br>");
        while(rs.next()){
							
        out.print("<tr>");
	out.print("<td><b>" + rs.getString(1) + "</b></td>");
	out.print("<td><b>&nbsp&nbsp&nbsp" + rs.getString(2) + "</b></td>");
	out.print("<td><b>&nbsp&nbsp" + rs.getString(3) + "</b></td>");
        out.print("<td><b>&nbsp&nbsp" + rs.getString(4) + "</b></td>");
        out.print("<td><b>&nbsp&nbsp" + rs.getString(5) + "</b></td>");
        out.print("<td><b>&nbsp&nbsp" + rs.getString(6) + "</b></td>");
        out.print("</tr>");
        }
        
        out.print("</table>");
        out.print("</center>"); 
        %>
       
</body>
</html>
