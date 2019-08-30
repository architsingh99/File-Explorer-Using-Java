/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Database.Query;
import Database.RunQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Archit
 */
public class Issue extends HttpServlet {

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
         Query obj=new Query();
        RunQuery obj1=new RunQuery();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String email=request.getParameter("email");
            String file=request.getParameter("doc_name");
            String message=request.getParameter("message");
            if(message==null)
                message=" ";
            
            String query=obj.selectAll();
            HttpSession s=request.getSession(false);
            //out.println(query);
            int a=0;
            try
            {
               
                    ResultSet rs=obj1.resultWithReturn(query);
                    while(rs.next())
                    {
                      
                      if(email.equalsIgnoreCase(rs.getString("EMAIL")) || email.equalsIgnoreCase(rs.getString("USERNAME")))
                      {
                          a=10;
                          
                           String user=(String) request.getSession(false).getAttribute("user");
                           Date date=new Date();
        SimpleDateFormat ft=new SimpleDateFormat("E dd/MM/yyyy 'at' hh:mm:ss a");
        
        String u=UUID.randomUUID().toString();
        
                           String query1=obj.insertIntoRequestDocumentIssued(file, user, message, u, rs.getString("USERNAME"));
                           obj1.result(query1);
                           // request.setAttribute("message", "Request Sent Successfully.");
                           // out.println(query1);
                           String d=ft.format(date);
                           message=user+" has shared a document with you at "+d+". Youn can find it in Other Documents page.";
                             u=UUID.randomUUID().toString();
                             
   String query3=obj.insertIntoNotifications(u, rs.getString("USERNAME"), message);
    //out.println(query3);
       obj1.result(query3);
                           
                           s.setAttribute("message", "Document Shared Successfully.");
                             response.sendRedirect(request.getContextPath()+"/Issued_Documents.jsp");
                            
             
                      }
        }
                    if(a==0)
                    {
                        //request.setAttribute("message", "Incorrect username or email.");
                        s.setAttribute("message", "Incorrect username or email.");
                        response.sendRedirect(request.getContextPath()+"/Issued_Documents.jsp");
                        // RequestDispatcher re=getServletConfig().getServletContext().getRequestDispatcher("/Requested_Documents.jsp");
               //re.forward(request,response);
                    }
            }
            catch(SQLException e)
            {
                e.getMessage();
            }
            
            
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
