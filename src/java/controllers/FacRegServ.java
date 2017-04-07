package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FacRegServ extends HttpServlet {

    Connection con;
    ResultSet rs;
    PreparedStatement ps;
    boolean flag=false;
    boolean flag1=false;
    boolean valid=false;
    boolean regis=true;
    String fname,dept,femail,utype;
    int i=0;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
      flag=false;
      flag1=false;
      valid=false;
       fname=request.getParameter("fname");
       dept=request.getParameter("b");
       femail=request.getParameter("femail");
       utype=request.getParameter("utyp");
            
         request.setAttribute("fml",femail); 
         request.setAttribute("ut",utype);
         Class.forName("oracle.jdbc.driver.OracleDriver");
       con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");  
       ps=con.prepareStatement("select fac_id,fname from olfacdetails");
       rs=ps.executeQuery();
        while(rs.next())
        {
        if(femail.equals(rs.getString(1)) && fname.equals(rs.getString(2)) )
          {
           flag=true;
           break;
          }
        
        }
        //
       ps=con.prepareStatement("select name,email from olfacreg");
       rs=ps.executeQuery();
        while(rs.next())
        {
        if(fname.equals(rs.getString(1)) && femail.equals(rs.getString(2)) )
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
        
       ps=con.prepareStatement("insert into olfacreg(name,dept,email,pass) values(?,?,?,?)");
       ps.setString(1,fname);
       ps.setString(2,dept);
       ps.setString(3,femail);
       Random r=new Random();
       ps.setString(4,Integer.toString(r.nextInt(40000)));
      i=ps.executeUpdate();
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
            out.println("<center><h2><font color='red'>Registration failed</h2></center>");
          out.println("</body>");
            RequestDispatcher rd=request.getRequestDispatcher("/FacReg.html");
         rd.include(request,response); 
        }
        }catch(Exception e){}
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
