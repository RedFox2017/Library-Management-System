<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="lightskyblue">
        <h2><font color="maroon"><center>AVAILABLE BOOK DETAILS AND THEIR COPIES</center></font></h2>
        <br><br>
        <%!
        Connection con;
        ResultSet rs,rs1;
        PreparedStatement ps;
        int i;
       
        int count=0;
        int count1=0;
        String arr[];
        String str;
        
        %>
        
         <%
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
         // ps=con.prepareStatement("select distinct book_name from olbookdetails where issued='No'");
          //rs=ps.executeQuery();
        /*  while(rs.next())
          {
              count1=count1+1;
              
          }
         arr=new String[count1];
         count1=0;*/
         %>
           <%
           ps=con.prepareStatement("select distinct book_name from olbookdetails where issued='No'");
           %>
           <table border="8" align="center">
            
           <%
           rs=ps.executeQuery();
           while(rs.next())
           {
               
            str=rs.getString(1);
              // arr[count]=str;
               //++count;
               %>
               <tr>
               <td width="200" align="center"><%=str%></td>
               <%
               
                ps=con.prepareStatement("select count(book_name) as total from  olbookdetails where book_name='"+str+"' and issued='No'");
                rs1=ps.executeQuery();
                rs1.next();
           
                int i=rs1.getInt("total");
           %>
           <td width="100px" align="center"><%=i%></td>
               </tr>
           <%}%>
            
             
             
           </table>
           
             </body>
</html>
