/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Database.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Archit
 */
public class FileRename extends HttpServlet {

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
        Query obj1=new Query();
        RunQuery obj2=new RunQuery();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             String path=request.getParameter("path3");
            String file_name=request.getParameter("file_name");
            String new_name=request.getParameter("new_name");
            int n=file_name.lastIndexOf(".");
            String nn=FilenameUtils.getExtension(file_name);
            String final_name=new_name+"."+nn;
            
            String oldpath=path+"\\"+file_name;
            String newpath=path+"\\"+final_name;
            
            //out.println(newpath+"    "+nn);
            
            File oldfile=new File(oldpath);
            File newfile=new File(newpath);
            if(oldfile.renameTo(newfile))
            {
                String query=obj1.FileRename(oldpath, final_name, newpath);
                obj2.result(query);
               request.setAttribute("path", path);
             /*RequestDispatcher re=getServletConfig().getServletContext().getRequestDispatcher("/viewDocument.jsp");
              re.forward(request,response); */
                response.sendRedirect(request.getContextPath()+"/viewDocument.jsp");
            }
            else
            {
                out.println("Problem");
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
    