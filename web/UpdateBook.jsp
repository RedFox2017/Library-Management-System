<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="lightskyblue">
        
        <%!
        String ide,bn,aun,rn;
        %>
        <%ide=request.getParameter("id");%>
        <%bn=request.getParameter("bname");%>
        <%aun=request.getParameter("autname");%>
        <%rn=request.getParameter("racno");%>
    <center><h3>Update Book Details</h3>
        <form action="UpdateBook1.jsp">
        <table>
        <tr><td>BOOK ID:</td><td> <input type="text" name="bkid" value="<%=ide%>"/></td></tr>
        <tr><td>BOOK NAME:</td><td> <input type="text" name="bkname" value="<%=bn%>"/></td></tr>
        <tr><td>AUTHOR NAME:</td><td> <input type="text" name="bkaut" value="<%=aun%>"/></td></tr>
        <tr><td>RACK NO:</td><td> <input type="text" name="bkrn" value="<%=rn%>"/></td></tr>
	<tr><td></td><td><input type="submit" value="Submit"/>
	<input type=reset value="Clear"></td></tr>
	</table>
        </form>
        </center>
</body>
</html>
    

