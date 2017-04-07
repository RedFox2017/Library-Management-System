
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookDetails extends HttpServlet {
    
    Connection con;
    ResultSet rs;
    PreparedStatement ps;


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           Class.forName("oracle.jdbc.driver.OracleDriver");
           con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
            
            
            
            
            ps=con.prepareStatement("Select * from OLBOOKDETAILS");
			
			rs=ps.executeQuery();
                        out.print("<body bgcolor='lightskyblue'>");
                        out.print("<center>");
			out.print("<h2><font color='Red'>Book Details</font></h2></br>");
			
				
				
			
                        
	out.print("<table border='2'>");
       
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
        out.print("</body>");
    }
        catch(Exception e){}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    }




