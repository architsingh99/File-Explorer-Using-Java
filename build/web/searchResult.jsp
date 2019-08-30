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
          String search=request.getParameter("search");
          String query=obj.searchDocument(user, search);
          ResultSet rs=obj1.resultWithReturn(query);
        
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

<link rel="icon" href="assets/images/favicon.png">
        <link rel="stylesheet" href="assets/others/button/style.css">




 <style>
        
	table {
		width: 100%;
		border-collapse: collapse;
	}
	/* Zebra striping */
	tr:nth-of-type(odd) {
		background: #eee;
	}
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

    </style>
    <script>
        function openLocation(n)
        {
            //alert(n);
           var ss=n.split(",");
            var l=ss[1].length;
            var l2=ss[0].length;
            var str=ss[0].substring(0, l2-(l+1));
          //  alert(str);
             document.getElementById("path").value=str;
             document.getElementById("Redirection").submit();
             
        }
        </script>

    </head>

    <body>
<%@include file="nav.jsp"%>

    <center>

    <div style="background-color: transparent" class="container well" style="margin-top: 50px">



        <div class="panel panel-default">

            <div class="panel-body">

    

                <b style="font-size: x-large;color: #b0b0b0;">SEARCH RESULT</b>

                <br>       
               

   <%
       if(rs.next()==false)
    {
%>
       <h4>NO DOCUMENT FOUND..</h4>
       <%
           }
           else
            {
%>
   <table><tr><th>DOCUMENT NAME</th><th>UPLOAD DATE</th>><th>ACTION</th></tr>
<%
                   do
                   {
                       
                   
           %>
       <tr><td><%=rs.getString("DOCUMENT_NAME")%></td>
           <td><%=rs.getString("UPLOAD_DATE")%></td>
      
           <%
               String f_name = rs.getString("PATH").replaceAll("&&", "\\\\");
               %>
       
           <td><button id="<%=f_name%>,<%=rs.getString("DOCUMENT_NAME")%>" onclick="openLocation(this.id)">OPEN LOCATION</button>
           </td></tr>      
<%
    } 
while(rs.next());
%>
  </table>
  <%
}
  %>









            </div>
        </div>
    </div>
</center>

    <script src="assets/bootstrap-3.3.7-dist/js/jquery.js"></script>
    <script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<form action="Redirection" method="post" id="Redirection">
    <input type="hidden" name="path" id="path">
   
</form>
    </body>
    </html>

    <%
        }
        %>