
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout page</title>
    </head>
    <body>
        <%
          if(session.isNew()) 
          {
            out.println("New session");  
          }
          else{
          out.println("<b>Hi "+session.getAttribute("uname")+" you have been logout successfully</b>");
          session.invalidate();
          
          }
          %>
      
        <jsp:include page="home.html"/>
        
        
    </body>
</html>
