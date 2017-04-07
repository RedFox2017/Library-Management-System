<!DOCTYPE html>

<html>
    <head>
   <div style="position: absolute; height:80px; width: 1350px;background-image:url(IMAGES/AD1.jpg)">
       </div>
</head>
<body bgcolor=" lightskyblue" onload="startTime()">
    
    
    
<% 
String sess=(String)session.getAttribute("name");
session.setAttribute("uname",sess);
%>
    
        <div style="position:absolute;top:85px;height:60px;width:1350px;background-color: lightskyblue">

            <b>Welcome<%=" "+sess+" "%></b>&nbsp&nbsp&nbsp&nbsp;<a href="Logout.jsp">Logout</a>
<table align="center" cellpadding=15>
<tr>
<td> <a href="BookDetails">BOOK DETAILS</a></td>
<td> <a href="IssueRequest.jsp">ISSUE BOOKS</a></td>
<td> <a href="ReturnBook.html">RETURN</a></td>
<td> <a href="renew.html">RENEW</a></td>
<td><a href="IssuedBookHistory.jsp">ISSUED BOOK HISTORY</a>
<td> <a href="stock.html"> STOCK MAINTENANCE</a></td>
</tr>
</table>
</div><br><br>
      <br><br>
      <br><br>
      <br><br>
      <br><br>

     <div align="center"><img src="IMAGES/ADMN1.jpg"></div>
     <br><br>
     <br><br>
     
     
     <div align="center"><h1><i><b>!!!WELCOME ADMIN!!!</i></b></h1></div>
 </body>
</html>
