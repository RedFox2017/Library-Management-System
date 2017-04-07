package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StdRegServ extends HttpServlet {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    boolean flag=false;
     boolean flag1=false;
    boolean valid=false;
    boolean regis=true;
    String sname,senroll,ssem,sbra,smail,utype;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      try (PrintWriter out = response.getWriter()) {
            flag=false;
            flag1=false;
            valid=false;
            /* TODO output your page here. You may use following sample code. */
           Class.forName("oracle.jdbc.driver.OracleDriver");
           con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
           sname=request.getParameter("sname");
           senroll=request.getParameter("senroll");
           ssem=request.getParameter("ssem");
           sbra=request.getParameter("b");
           smail=request.getParameter("smail"); 
           utype=request.getParameter("utyp");
           request.setAttribute("fml",smail);
           request.setAttribute("ut",utype);
           ps=con.prepareStatement("select std_id,sname from olstddetails");
           rs=ps.executeQuery();
           while(rs.next())
           {
            if(smail.equals(rs.getString(1)) && sname.equals(rs.getString(2)) )
          {
           flag=true;
           break;
          }
        
           }
       ps=con.prepareStatement("select name,email from olstdreg");
       rs=ps.executeQuery();
        while(rs.next())
        {
        if(sname.equals(rs.getString(1)) && smail.equals(rs.getString(2)) )
          {
           flag1=true;
           break;
          }
        
        }
        if(flag && flag1)
        {
            valid=true;
            regis=false;
        }
        if(flag || flag1)
        {
            if(regis)
            {
           ps=con.prepareStatement("insert into olstdreg(name,enroll_no,sem,branch,email,pass) values(?,?,?,?,?,?)");
           
           ps.setString(1,sname);
           ps.setString(2,senroll);
           ps.setString(3,ssem);
           ps.setString(4,sbra);
           ps.setString(5,smail);
           Random r=new Random();
           ps.setString(6,Integer.toString(r.nextInt(40000)));
        int i=ps.executeUpdate();
           
        if(i!=0)
        {
            out.println("<b>Successfully Registered!</b>");
         RequestDispatcher rd=request.getRequestDispatcher("home.html");
         rd.include(request,response);  
         }
        }
        }
        
    if(valid)
   {
      out.println("<b>Already Registered!</b>"); 
      
      RequestDispatcher rd=request.getRequestDispatcher("home.html");
      rd.include(request,response);  
   }
        
           if(flag==false)
           {
               out.println("<body bgcolor='lightskyblue'>");
           out.println("<center><h2><font color='red'>Registration failed!</h2></center>");
            out.println("</body>");
          RequestDispatcher rd=request.getRequestDispatcher("/StdReg.html");
         rd.include(request,response);    
           }
           
        }catch(Exception e)
       {
           System.out.println(e);
       }
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
