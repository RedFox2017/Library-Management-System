<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<html>
    <body bgcolor="lightskyblue">
        <form action="Issue.jsp">
<%!
   Connection con;
   ResultSet rs;
   PreparedStatement ps;
   String sid;
   String bid;
   String str,str1,str2;
%>  
<%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
    ps=con.prepareStatement("select email from olstdreg UNION select email from olfacreg");
    rs=ps.executeQuery();%>
    <center>
        <table><tr><b>YOUR EMAIL&nbsp;</b><select name="bmail"><%
    while(rs.next())
            {
            str=rs.getString(1);
            %>
        <option value=<%=str%>><%=str%></option>
            <%}%>
        </select>
        </tr><br>
    <tr>
        BOOK ID&nbsp;<input type="text" name="bkid"> 
    </tr>
    </table>
   <br>
    
    
   <input type="submit" value="SUBMIT">
    </center>
        
        </form>
    </body>
</html>
