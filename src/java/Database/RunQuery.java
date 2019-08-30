package Database;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Archit
 */
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class RunQuery {
    
    public void result(String query)
    {
        try {
               Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/file_explorer","root","");
            Statement stmt=con.createStatement();
            stmt.executeUpdate(query);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.getMessage();
        }
     
        
    }
    public ResultSet resultWithReturn(String query)
    {
        
    try {
        Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/file_explorer","root","");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery(query);
            return rs;
    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(RunQuery.class.getName()).log(Level.SEVERE, null, ex);
        return null;
    }
   
         
        }
        
    }
    

