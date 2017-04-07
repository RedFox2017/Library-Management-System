package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class AdminRegServ extends HttpServlet {

    Connection con;
    ResultSet rs;
    PreparedStatement ps;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      try (PrintWriter out = response.getWriter()) {
          
       String aname=request.getParameter("aname");
       String aemail=request.getParameter("aemail");
       String apass=request.getParameter("apass"); 
       if(aemail.equals("sonu.ashutosh8@gmail.com")) 
       {
       Class.forName("oracle.jdbc.driver.OracleDriver");
       con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
       ps=con.prepareStatement("insert into oladmreg(name,email,password) values(?,?,?)");
       ps.setString(1,aname);
       ps.setString(2,aemail);
       ps.setString(3,apass);
       int i=ps.executeUpdate();
       if(i!=0)
       {
           request.getRequestDispatcher("/admin.jsp").forward(request, response);
       }
       else{
           out.println("Registration Failed,Try again!");
          request.getRequestDispatcher("/AdminReg.html").include(request, response); 
       }
       
        
        
        
       }
       else
       {
        out.println("Registration Failed,Try again!");
          request.getRequestDispatcher("/AdminReg.html").include(request, response);   
       }
      }catch(Exception e){}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
