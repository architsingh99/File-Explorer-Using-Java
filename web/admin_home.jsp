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
    <script>
        function blockUnblock(n)
        {
         var ss=n.split(",");
         document.getElementById("user").value=ss[0];
      document.getElementById("status").value=ss[1];
         document.getElementById("adminBlockUnblock").submit();
        }
    </script>

    <body>
<%@include file="admin_nav.jsp"%>

    <center>
    <div style="background-color: transparent" class="container well" style="margin-top: 50px">



        <div class="panel panel-default">

            <div class="panel-body">


                <b style="font-size: x-large;color: #b0b0b0;">MANAGE USERS</b>
                <br>
                <br>
                <table>
               <tr><th>USERNAME</th><th>EMAIL</th><th>STATUS</th><th>ACTION</th><th>VIEW DETAILS</th></tr>
                <%
                    String query=obj.selectAll();
                    ResultSet rs=obj1.resultWithReturn(query);
                    while(rs.next())
                    {
                    %>
                <tr><td><%=rs.getString("USERNAME")%></td>
                    <td><%=rs.getString("EMAIL")%></td>
                    <td><%=rs.getString("STATUS")%></td>
                    <td><% if(rs.getString("STATUS").equalsIgnoreCase("ACTIVE"))
                    {
                        %>
                        <p onclick="blockUnblock(this.id)" id="<%=rs.getString("EMAIL")%>,BLOCK">BLOCK</p>
                        <%
                    }
                        else
                        {       
                        %>
                        <p onclick="blockUnblock(this.id)" id="<%=rs.getString("EMAIL")%>,UNBLOCK">UNBLOCK</p>
                    <%
                        }
                        %>
                    </td>
                    <td><a href="viewDetails.jsp?user=<%=rs.getString("EMAIL")%>" style="color: blue;" >VIEW DETAILS</a></td></tr>
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
    
    <form action="adminBlockUnblock" method="post" id="adminBlockUnblock">
    <input type="hidden" name="user" id="user">
    <input type="hidden" name="status" id="status">
</form>

    </body>
    </html>

    <%
        }
        %>