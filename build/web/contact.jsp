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
        <title>
            File Explorer
        </title>

        <link rel="icon" href="assets/images/logo-e.png">

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">




        <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="assets/bootstrap-3.3.7-dist/css/bootstrap-imageupload.css" rel="stylesheet">

<link rel="icon" href="assets/images/favicon.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

        <link rel="stylesheet" href="assets/others/admin_gs_css/style.css">


        <link rel="stylesheet" href="assets/others/button/style.css">






    </head>

    <body>
<%@include file="nav.jsp"%>

    <center>

    <div style="background-color: transparent" class="container well" style="margin-top: 50px">



        <div class="panel panel-default">

            <div class="panel-body">

        <form name="frm" action="Conatct" method="post">

                <b style="font-size: x-large;color: #b0b0b0;">CONTACT US</b>

                
                <div>
    <h2 style="color: #b0b0b0;"><i>
    <% 
        String message=(String)session.getAttribute("message");
        //out.println(message);
        if(message!=null)
        {
            out.println(message);
            session.removeAttribute("message");
            
        }
       %>
        </i></h2>
        </div>
        

                <input required placeholder="SUBJECT" name="subject" type="text" style="width:800px;height:100%">
                
           <br>
                <br>
                
                <textarea required  placeholder="ENTER DESCRIPTION" name="description" style="height:150px;width:800px"></textarea>
            
                
                

                <br>
                <br>
               
                
                
        
                
                    <input class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft" value="SEND" type="submit" id="sbtn">




        </form>





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