<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        boolean flag;
        %>
     
        <%
            
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
         String bid=request.getParameter("bkid");
         String bname=request.getParameter("bkname");
         String baut=request.getParameter("bkaut");
         String brn=request.getParameter("bkrn");
        try {
         PreparedStatement ps=con.prepareStatement("select * from olbookdetails");   
        rs= ps.executeQuery();
         while(rs.next())
         {
             if(bid.equals(rs.getString(1)))
             {
               flag=true; 
               break;
             }
         }
        if(flag)
        {
	ps=con.prepareStatement("update olbookdetails set book_name='"+bname+"',author='"+baut+"',rack_no='"+brn+"' where book_id = '"+bid+"'");
	int i=ps.executeUpdate();
        if(i!=0) 
        {
	        out.print("Updated Successfully!");
		%>			
			<jsp:include page="BookDetails"></jsp:include> 
			<% 
				
			}
        }
        else{
            out.println("Please enter correct Id");%>
            <jsp:include page="UpdateBook.html"></jsp:include>
            <%
            }
           	
          
		} catch (Exception e) {
			e.printStackTrace();
		}
		
%>
		
        
    </body>
</html>

