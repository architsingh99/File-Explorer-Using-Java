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

import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Archit
 */
public class ApproveRequest extends HttpServlet {

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
            String doc=request.getParameter("doc_id");
            String request_id=request.getParameter("request_id");
            String query=obj.documentRequestApproved(doc, request_id);
            //out.println(query);
           obj1.result(query);
           
           String query2=obj.selectFromRequestDocumentsAccordingToRequestId(request_id);
           ResultSet rs=obj1.resultWithReturn(query2);
           rs.next();
           String message=rs.getString("ISSUER")+" has approved your request for "+rs.getString("DOCUMENT_NAME")+" which you requested on "+rs.getString("TIME")+". You can find the document in OTHER DOCUMENTS PAGE.";
          
                  

        String u=UUID.randomUUID().toString();
        String query3=obj.insertIntoNotifications(u, rs.getString("REQUESTER"), message);
        obj1.result(query3);
           
           
           response.sendRedirect(request.getContextPath()+"/notifications.jsp");
           
        } catch (SQLException ex) {
            Logger.getLogger(ApproveRequest.class.getName()).log(Level.SEVERE, null, ex);
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
