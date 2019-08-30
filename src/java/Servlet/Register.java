/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;
import Database.Path;
import Database.Query;
import Database.RunQuery;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Archit
 */
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String email=request.getParameter("email");
           String username=request.getParameter("user");
           String password=request.getParameter("pass");
           Query obj1=new Query();
           RunQuery obj2=new RunQuery();
           String query1=obj1.selectAllFromUserDetailsAccordingToEmail(email);
           ResultSet rs=obj2.resultWithReturn(query1);
           String query2=obj1.selectAllFromUserDetailsAccordingToUsername(username);
           ResultSet rs1=obj2.resultWithReturn(query2);  
           if(rs.next())
           {
           
               request.setAttribute("message", "There exist an account with the same email.");
               RequestDispatcher re=getServletConfig().getServletContext().getRequestDispatcher("/index.jsp");
               re.forward(request,response);
           }
           else if(rs1.next() || username.equalsIgnoreCase("ADMIN"))
           {
               request.setAttribute("message", "There exist an account with the same username.");
               RequestDispatcher re=getServletConfig().getServletContext().getRequestDispatcher("/index.jsp");
               re.forward(request,response);
           }
           else
           {
           String query=obj1.insertIntoUser_Details(email, username, password);
           obj2.result(query);
           Path obj3=new Path();
           String path=obj3.path()+"\\"+username;
           File f=new File(path);
           /*String path1=obj3.path()+"\\"+username+"_Requested";
           File f1=new File(path1);
           String path2=obj3.path()+"\\"+username+"_Issued";
           File f2=new File(path2);*/
           if(!f.exists())
           {
               f.mkdirs();
           }
               
            request.setAttribute("message", "Thank you for registration. Login to use File Explorer");
               RequestDispatcher re=getServletConfig().getServletContext().getRequestDispatcher("/index.jsp");
               re.forward(request,response);
        }
        }
        catch(Exception e)
        {
            
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
