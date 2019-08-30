<%-- 
    Document   : nav
    Created on : Mar 16, 2018, 10:08:13 AM
    Author     : Archit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

         <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/style4.css">
    </head>
    <body>



        <div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>File Explorer</h3>
                    <strong>FL</strong>
                </div>

                <ul class="list-unstyled components">
                    <li class="active">
                        <a href="viewDocument.jsp"  aria-expanded="false">
                            <i class="glyphicon glyphicon-home"></i>
                            Home
                        </a>
                       
                    </li>
                    <li>
                        <a href="about_us.jsp">
                            <i class="glyphicon glyphicon-briefcase"></i>
                            About
                        </a>
                       
                        <a href="Issued_Documents.jsp">
                            <i class="glyphicon glyphicon-duplicate"></i>
                            Share Documents
                        </a>
                        <a href="Requested_Documents.jsp">
                            <i class="glyphicon glyphicon-floppy-saved"></i>
                            Other Documents
                       
                          </a>
                        
                    </li>
                    <li>
                        <a href="notifications.jsp">
                            <i class="glyphicon glyphicon-link"></i>
                            Notifications
                        </a>
                    </li>
                    <li>
                        <a href="editProfile.jsp">
                            <i class="glyphicon glyphicon-edit"></i>
                            Edit Profile
                        </a>
                    </li>
                    <li>
                        <a href="FAQ.jsp">
                            <i class="glyphicon glyphicon-paperclip"></i>
                            FAQ
                        </a>
                    </li>
                    <li>
                        <a href="contact.jsp">
                            <i class="glyphicon glyphicon-send"></i>
                            Contact
                        </a>
                    </li>
                     <li>
                        <a href="<%=request.getContextPath()%>/LogOut">
                            <i class="glyphicon glyphicon-log-out"></i>
                            Log Out
                        </a>
                    </li>
                </ul>

                
            </nav>

            <!-- Page Content Holder -->
            <div id="content">

                <nav class="navbar navbar-default">
                    <div class="container-fluid" style="width: 1200px;">

                        <div class="navbar-header">
                            <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                                <i class="glyphicon glyphicon-align-left"></i>
                               
                            </button>
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <center>
                                <h1 STYLE="color: black;">FILE EXPLORER<br><span>Welcome <%=(String)session.getAttribute("user")%></span></h1>
                        </center>
                        </div>
                    </div>
                </nav>

                




        <!-- jQuery CDN -->
         <script src="css/jquery-1.12.0.min.js"></script>
         <!-- Bootstrap Js CDN -->
         <script src="css/bootstrap1.min.js"></script>

         <script type="text/javascript">
             $(document).ready(function () {
                 $('#sidebarCollapse').on('click', function () {
                     $('#sidebar').toggleClass('active');
                 });
             });
         </script>
    </body>
</html>

