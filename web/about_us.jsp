<%-- 
    Document   : contact
    Created on : Apr 16, 2018, 2:50:24 AM
    Author     : Archit
--%>

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
        
          %>
<!DOCTYPE html>
<html>

    <head>
        <style>
            table {
		width: 100%;
		border-collapse: collapse;
	}
        
	
	td{ 
		padding: 6px;
		border: none;
		text-align: center;
	}
        </style>
        <title>
            File Explorer
        </title>
<link rel="icon" href="assets/images/favicon.png">
        <link rel="icon" href="assets/images/logo-e.png">

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">




        <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="assets/bootstrap-3.3.7-dist/css/bootstrap-imageupload.css" rel="stylesheet">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

        <link rel="stylesheet" href="assets/others/admin_gs_css/style.css">


        <link rel="stylesheet" href="assets/others/button/style.css">






    </head>

    <body>
        <%
            if(user.equalsIgnoreCase("ADMIN"))
            {
                %>
                <%@include file="admin_nav.jsp"%>
                <%
                
            }
            else
            {
                %>
                <%@include file="nav.jsp"%>
                <%
            }
            %>


    <center>

    <div style="background-color: transparent" class="container well" style="margin-top: 50px">



        <div class="panel panel-default">

            <div class="panel-body">


                <b style="font-size: x-large;color: #b0b0b0;">ABOUT US</b>

                <br><br>
                <p>File Explorer offers a standardized mechanism to store and share different categories of documents in electronic formats for/of/by the users. 
                   
<br>        


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