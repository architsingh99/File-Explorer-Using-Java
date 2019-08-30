<%-- 
    Document   : contact
    Created on : Apr 16, 2018, 2:50:24 AM
    Author     : Archit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Database.RunQuery"%>
<%@page import="Database.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            String user=(String)session.getAttribute("user");
    if(user==null)
    {
          request.setAttribute("message", "Login in first to use File Explorer.");
               RequestDispatcher re=getServletConfig().getServletContext().getRequestDispatcher("/index.jsp");
               re.forward(request,response);
    }
    else
    {
        String email=request.getParameter("user");
         Query obj=new Query();
          RunQuery obj1=new RunQuery();
          String query=obj.selectAllFromUserDetailsAccordingToEmail(email);
          ResultSet rs=obj1.resultWithReturn(query);
          rs.next();
          String query2=obj.selectFromRequestDocumentAccordingToUsernameWithoutStatus(rs.getString("USERNAME"));
          ResultSet rs2=obj1.resultWithReturn(query2);
          
          %>
<!DOCTYPE html>
<html>

    <head>
        <style>
            table {
		width: 100%;
		border-collapse: collapse;
               
	}
	/* Zebra striping */
	
	th {
		background: #333;
		color: white;
		font-weight: bold;
	}
	td, th {
		padding: 6px;
		border: none;
		text-align: left;
	}
        p
        {
            cursor: pointer;
            
        }
        p:hover
        {
            color: black;
        }
        
        
        </style>
        <title>
            File Explorer
        </title>

        <link rel="icon" href="assets/images/logo-e.png">

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


<link rel="icon" href="assets/images/favicon.png">

        <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="assets/bootstrap-3.3.7-dist/css/bootstrap-imageupload.css" rel="stylesheet">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

        <link rel="stylesheet" href="assets/others/admin_gs_css/style.css">


        <link rel="stylesheet" href="assets/others/button/style.css">






    </head>
   
    <body>
<%@include file="admin_nav.jsp"%>

    <center>
    <div style="background-color: transparent" class="container well" style="margin-top: 50px">



        <div class="panel panel-default">

            <div class="panel-body">

                <b style="font-size: x-large;color: #b0b0b0;">USER DETAILS</b><br>
                <b style="font-size: x-large;color: black;">EMAIL: <%=email%></b><br>
                <b style="font-size: x-large;color: black;">USERNAME: <%=rs.getString("USERNAME")%></b><br>
                <b style="font-size: x-large;color: #b0b0b0;">Document Transaction Summary</b>
                <br>
                <br>
                <table>
                    <tr><th>REQUESTER</th><th>ISSUER</th><th>STATUS</th><th>TIME</th><th>MESSAGE</th></tr>
                    <%
                        while(rs2.next())
                        {
                        %>
                    <tr><td><%=rs2.getString("REQUESTER")%></td>
                        <td><%=rs2.getString("ISSUER")%></td>
                        <td><%=rs2.getString("STATUS")%></td>
                        <td><%=rs2.getString("TIME")%></td>
                        <td><%=rs2.getString("MESSAGE")%></td>
                    </tr>
                    <%
                        }
                        %>
                </table>
            </div>
        </div>
    </div>
</center>

    <script src="assets/bootstrap-3.3.7-dist/js/jquery.js"></script>
    <script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    </body>
    </html>

    <%
        }
        %>