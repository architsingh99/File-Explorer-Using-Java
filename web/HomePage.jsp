<%-- 
    Document   : HomePage
    Created on : Jan 25, 2018, 4:12:22 AM
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
<title>File Explorer</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="assets/css/default.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/component.css" />


    <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    



</head>

<body>

<center>

<div class="container">

    <header>
        <h1 STYLE="color: white">DIGITAL LOCKER<span>WELCOME <%=user%></span></h1>
    </header>


<h1 style="color: white;"><i>
    <% 
        String message=(String)request.getAttribute("message");
        if(message!=null)
        {
        out.println(message);
        }
       %>
        </i></h1>

    <div class="main clearfix">
        <nav id="menu" class="nav">
            <ul>
                <li>
                    <a style="text-decoration:none" href="uploadDocument.jsp">
								<span class="glyphicon">
									<i aria-hidden="true" class="glyphicon-file"></i>
								</span>
                        <br>
                        <br>
                        <span style="font-size:20px">UPLOAD DOCUMENT</span>
                    </a>
                </li>
                <li>
                    <a href="viewDocument.jsp" style="text-decoration:none">
                        <span class="glyphicon">
									<i aria-hidden="true" class="glyphicon-folder-open"></i>
								</span>

                        <br>
                        <br>
                        <span style="font-size:20px">MANAGE DOCUMENTS</span>
                    </a>
                </li>

                <li>
                    <a style="text-decoration:none" href="">
								<span class="glyphicon">
									<i aria-hidden="true" class="glyphicon-user"></i>
								</span>

                        <br>
                        <br>
                        <span style="font-size:20px">VIEW YOUR PROFILE</span>
                    </a>
                </li>

                   <li>
                    <a style="text-decoration:none" href="#">
								<span class="glyphicon">
									<i aria-hidden="true" class="glyphicon glyphicon-briefcase" ></i>
								</span>
                        <br>
                        <br>
                        <span style="font-size:20px">ABOUT US</span>
                    </a>
                </li>
                
                   <li>
                    <a style="text-decoration:none" href="../contact.php">
								<span class="glyphicon">
									<i aria-hidden="true" class="glyphicon glyphicon-phone-alt" ></i>
								</span>
                        <br>
                        <br>
                        <span style="font-size:20px">CONTACT US</span>
                    </a>
                </li>



                <li>
                    <a style="text-decoration:none" href="<%=request.getContextPath()%>/LogOut">
								<span class="glyphicon">
									<i aria-hidden="true" class="glyphicon-log-out" ></i>
								</span>
                        <br>
                        <br>
                        <span style="font-size:20px">LOG OUT</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>

</center>
</body>
</html>
<%
    }
%>