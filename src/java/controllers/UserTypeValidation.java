package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;


public class UserTypeValidation extends HttpServlet {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
   // boolean flag=false;
    boolean chk=false;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        
        try (PrintWriter out = response.getWriter()) {
            // flag=false;
             chk=false;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
            
            String uname=request.getParameter("usr");
            session.setAttribute("name",uname);
            String upass=request.getParameter("pswd");
            String utype=request.getParameter("sel");
           if(utype.equals("Faculty"))
           {
            chk=true;  
             ps=con.prepareStatement("select * from olfacreg where usertype='"+utype+"'");
             rs=ps.executeQuery();
          
          while(rs.next())
          {
              if(uname.equals(rs.getString(1))&& upass.equals(rs.getString(4))&& utype.equals("Faculty"))
              {
                  chk=false;
                  request.getRequestDispatcher("/Faculty.jsp").forward(request, response);
                  //flag=true;
           
                  break;
              } 
                 
          }
           }
          if(chk==true)
                  {
                  //flag=true;
                  chk=false;
                  request.getRequestDispatcher("/Failed.jsp").forward(request, response);
                  
                  }
          
          if(utype.equals("Admin"))
           {
          chk=true;
          ps=con.prepareStatement("select * from oladmreg where usertype='"+utype+"'");
          rs=ps.executeQuery();
         
          while(rs.next())
          {
              if(uname.equals(rs.getString(1))&& upass.equals(rs.getString(3))&& utype.equals("Admin"))
              {
                  chk=false;
                  request.getRequestDispatcher("/admin.jsp").forward(request, response);
                  //flag=true;
                  
                  break;
                  
              }
              
              }
              
           }
          if(chk==true)
          {
             // flag=true;
              chk=false;
             request.getRequestDispatcher("/Failed.jsp").forward(request, response);   
         
          }
          
           
           if(utype.equals("Student"))
           {
               chk=true;
          ps=con.prepareStatement("select * from olstdreg where usertype='"+utype+"'");
          rs=ps.executeQuery();
          
          while(rs.next())
          {
              if(uname.equals(rs.getString(1))&& upass.equals(rs.getString(6)) && utype.equals("Student"))
              { 
                  chk=false;
                  request.getRequestDispatcher("/Student.jsp").forward(request, response);
                  //flag=true;
                  break;
                  
              }
             
              }
              
           }
           if(chk==true)
           {
           //flag=true;
           chk=false;
           request.getRequestDispatcher("/Failed.jsp").forward(request, response);
         
           }
        /*  if(flag==false)
          {
         out.println("<center><h3>Login Failed,Please Try Again!</h3></center>");
         request.getRequestDispatcher("/home.html").include(request, response);
              
          }  */ 
          }
   catch(Exception e){
        System.out.println(e);
        }
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
