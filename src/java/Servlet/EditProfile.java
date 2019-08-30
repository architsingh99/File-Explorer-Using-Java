/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Database.MailSend;

import Database.Query;
import Database.RunQuery;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Archit
 */
public class EditProfile extends HttpServlet {

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
           String pass=request.getParameter("password");
            String user=(String) request.getSession(false).getAttribute("user");
            HttpSession s=request.getSession(false);
           if(request.getParameter("email")!=null)
           {
               String email=request.getParameter("email");
               String query8=obj.selectAllFromUserDetailsAccordingToEmail(email);
               ResultSet rs1=obj1.resultWithReturn(query8);
               if(rs1.next()==false)
               {
                   String code=Integer.toString(email.length()*email.length())+Integer.toString(user.length()*user.length());
           String msg="Hellow "+user+". Your verification code is "+code+".";
           MailSend.send(email, "Digital Locker Email Verification", msg);
          
           request.setAttribute("email",email);

               request.setAttribute("code",code);
               RequestDispatcher re=getServletConfig().getServletContext().getRequestDispatcher("/ChangeEmailVerify.jsp");
               re.forward(request,response);
               }
                else
               {
                    s.setAttribute("message", "Email Already exists.");
                    response.sendRedirect(request.getContextPath()+"/editProfile.jsp");
               }
               
           
           }
           else
           {
            String query=obj.updateUserDetailsPassword(user, pass);
            obj1.result(query);
            s.setAttribute("message", "Password Changed Sucessfully.");
            response.sendRedirect(request.getContextPath()+"/editProfile.jsp");
           }
        } catch (SQLException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
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
