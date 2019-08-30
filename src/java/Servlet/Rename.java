/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Database.Query;
import Database.RunQuery;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Archit
 */
public class Rename extends HttpServlet {

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
            String path=request.getParameter("path1");
            String folder=request.getParameter("folder");
            String new_folder=request.getParameter("new_folder");
            String oldPath=path+"\\"+folder;
              String newPath=path+"\\"+new_folder;
              File dir=new File(oldPath);
              File newdir=new File(newPath);
              if(dir.isDirectory())
              { 
        File[] fList1 = dir.listFiles();
       if(fList1!=null)
        {
          for (File file : fList1){
             if (file.isFile()){
                 String record=oldPath+"\\"+file.getName();
                 String new_record=newPath+"\\"+file.getName();
                 String query=obj1.FolderRename(record,new_record);
                 obj2.result(query);
             }
             }
        }
                  dir.renameTo(newdir);
              }
              
              //out.println(oldPath);
              //out.println(newPath);
             request.setAttribute("path", path);
             response.sendRedirect(request.getContextPath()+"/viewDocument.jsp");
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
