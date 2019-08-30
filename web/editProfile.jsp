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
        Query obj=new Query();
          RunQuery obj1=new RunQuery();
        String query=obj.selectAllFromUserDetailsAccordingToUsername(user);
        ResultSet rs=obj1.resultWithReturn(query);
        rs.next();
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


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

        <link rel="stylesheet" href="assets/others/admin_gs_css/style.css">


        <link rel="stylesheet" href="assets/others/button/style.css">
<script src="css/sweetalert.min.js"></script>





        <script>
    function emailChange()
    {
       
         document.getElementById("passwordDiv").style.display="block";
        document.getElementById("passwordField").style.display="none";
        
        document.getElementById("emailDiv").style.display="none";
        document.getElementById("emailField").style.display="block";
    }
   
    function passwordChange()
    {
        
         document.getElementById("emailDiv").style.display="block";
        document.getElementById("emailField").style.display="none";
        
        document.getElementById("passwordDiv").style.display="none";
        document.getElementById("passwordField").style.display="block";
    }
    function cancel()
    {
         
         document.getElementById("emailDiv").style.display="block";
        document.getElementById("emailField").style.display="none";
        
        document.getElementById("passwordDiv").style.display="block";
        document.getElementById("passwordField").style.display="none";
        
    }
    function verify()
    {
        //alert("hi");
        if(document.getElementById("opass").value!="<%=rs.getString("PASSWORD")%>")
        {    
            swal("Incorrect Old Password..");
            document.getElementById("opass").focus();
            return false;
        }  
        else if(document.getElementById("pass").value!=document.getElementById("cpass").value)
        {    
            swal("Password and Confirm  Password didn't match..");
            document.getElementById("pass").focus();
            return false;
        } 
        
    }
    function emailverify()
    {
        if(document.getElementById("emailpass").value!="<%=rs.getString("PASSWORD")%>")
        {    
            swal("Incorrect Password..");
            document.getElementById("emailpass").focus();
            return false;
        } 
    }
    </script>
</head>
<link rel="icon" href="assets/images/favicon.png">
    <body>
<%@include file="nav.jsp"%>

    <center>

    <div style="background-color: transparent" class="container well" style="margin-top: 50px">



        <div class="panel panel-default">

            <div class="panel-body">


                <b style="font-size: x-large;color: #b0b0b0;">EDIT PROFILE</b>

                
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
        
        <div id="emailDiv">
            <input required placeholder="EMAIL" type="text" style="width:500px;height:100%" readonly="" value="<%=rs.getString("EMAIL")%>">
                <button onclick="emailChange()" style="background-image: url('assets/images/edit.png');background-repeat: no-repeat; height: 34px; width: 80px;"><i class="fa fa-search"></i></button>
           </div>
        <div id="emailField" style="display: none;">
            <form method="post" action="EditProfile" onsubmit="return emailverify();">
                <input placeholder="OLD EMAIL" type="text" style="width:500px;height:100%" readonly="" value="<%=rs.getString("EMAIL")%>"><br><br>
           <input required placeholder="NEW EMAIL" name="email" id="email" type="email" style="width:500px;height:100%"><br><br>
           
        <input required placeholder="PASSWORD" name="password" type="password" id="emailpass" style="width:500px;height:100%"><br><br>
        <input type="submit" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft" value="SUBMIT">&nbsp;
          <button onclick="cancel()" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft">CANCEL</button>&nbsp;
          </form>           
        </div>
                <br>
                <br>
                <div id="usernameDiv">   
                <input type="text"  placeholder="USERNAME" style="height:100%;width:360px" readonly="" value="<%=rs.getString("USERNAME")%>">
                <b><i class="fa fa-search">Username cannot be changed.</i></b>
          
                </div> 
                
                <br>
                <br>
            <div id="passwordDiv">
                 <input type="password" required  placeholder="PASSWORD" name="username" style="height:100%;width:500px" readonly="" value="<%=rs.getString("PASSWORD")%>">
                <button onclick="passwordChange()" style="background-image: url('assets/images/edit.png');background-repeat: no-repeat; height: 34px; width: 80px;"><i class="fa fa-search"></i></button>
            
        </div>
                <div id="passwordField" style="display: none;">
                    <form method="post" action="EditProfile" onsubmit="return verify();">
                    <input required placeholder="OLD PASSWORD" name="oldpassword" id="opass" type="password" style="width:500px;height:100%"><br><br>
                    <input required placeholder="NEW PASSWORD" name="password" id="pass" type="password" style="width:500px;height:100%"><br><br>
                    <input required placeholder="CONFIRM PASSWORD" id="cpass" type="password" style="width:500px;height:100%"><br><br>
                  <input type="submit" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft" value="SUBMIT">&nbsp;
          <button onclick="cancel()" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft">CANCEL</button>&nbsp;
        </form>
                </div>
                
                

                <br>
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