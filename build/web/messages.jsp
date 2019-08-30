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
<script src="css/sweetalert.min.js"></script>

        <script>
            function respondAdmin(n)
            {
                var ss=n.split(",");
               swal("Write the respond to the corresponding query here or click outside the box to cancel.", {
                   content: "input",
               })
               .then((value)=>{
                   if(value==null || value=="")
                   swal("You didn't typed anything for reply");
               else
               {
                   
                   document.getElementById("query_id").value=ss[0];
      document.getElementById("respond_message").value=value;
      document.getElementById("email").value=ss[1];
         document.getElementById("QueriesRespond").submit();
               }
               });
            }
            </script>



    </head>
   

    <body>
<%@include file="admin_nav.jsp"%>

    <center>
    <div style="background-color: transparent" class="container well" style="margin-top: 50px">



        <div class="panel panel-default">

            <div class="panel-body">


                <b style="font-size: x-large;color: #b0b0b0;">QUERIES</b>
                <br>
                <br>
                <table>
               <tr><th>USERNAME</th><th>SUBJECT</th><th>MESSAGE</th><th>TIME</th><th>RESPOND</th></tr>
                <%
                    String query=obj.selectAllFromContact();
                    ResultSet rs=obj1.resultWithReturn(query);
                    while(rs.next())
                    {
                    %>
                <tr><td><%=rs.getString("USERNAME")%></td>
                    <td><%=rs.getString("SUBJECT")%></td>
                    <td><%=rs.getString("MESSAGE")%></td>
                    <td><%=rs.getString("TIME")%></td>
                    <td><% if(rs.getString("REPLY")==null)
                    {
                        String query2=obj.selectAllFromUserDetailsAccordingToUsername(rs.getString("USERNAME"));
                        ResultSet rs2=obj1.resultWithReturn(query2);
                        rs2.next();
                        %>
                        <p onclick="respondAdmin(this.id)" id="<%=rs.getString("CONTACT_ID")%>,<%=rs2.getString("EMAIL")%>">Not yet responded.. Click here to reply..</p>
                        <%
                    }
                        else
                        {       
                        %>
                        <%=rs.getString("REPLY")%>
                    <%
                        }
                        %>
                    </td>
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
    
    
<form action="QueriesRespond" method="post" id="QueriesRespond">
    <input type="hidden" name="query_id" id="query_id">
    <input type="hidden" id="respond_message" name="respond_message">
    <input type="hidden" name="email" id="email">
</form>
    </body>
    </html>

    <%
        }
        %>