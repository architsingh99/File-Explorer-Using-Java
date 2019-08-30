<%-- 
    Document   : Requested_Documents
    Created on : Mar 22, 2018, 2:37:17 AM
    Author     : Archit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Database.*"%>
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
<html lang="en">
<head>
  <title>File Explorer</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap2.min.css">
  <script src="css/jquery2.min.js"></script>
  <script src="css/bootstrap3.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="assets/css/default.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/component.css" />

<link rel="icon" href="assets/images/favicon.png">
    <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <script>
   function download(n)
   {
       var ss=n.split(",");
       document.getElementById("doc_name").value=ss[0];
       document.getElementById("doc_path").value=ss[1];
         document.getElementById("DownloadFile").submit();
   }
   </script>
   
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
</head>
<body>
    <%@include file="nav.jsp"%>
<center>
    
<div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Request For Document</button>
<div>
    <h2 style="color: red;"><i>
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
      
         <%
        String query3=obj.selectFromRequestDocumentAccordingToUsernameAndStatusNotPendingOrDecline(user);
        // out.println(query3);
        ResultSet rs1=obj1.resultWithReturn(query3);
       
        if(rs1.next()==false)
        {
            %>
            <h3></h3>
            <%
        }
else
{
   %>
<center>
   <table><tr><th>ISSUER</th><th>REQUESTED DOCUMENT</th><th>PROVIDED DOCUMENT</th>><th>ACTION</th></tr>
   <%
do
    {
        String query4=obj.selectFromDocumentsAccordingToDocumentId(rs1.getString("DOCUMENT_PROVIDED_ID"));
        ResultSet rs3=obj1.resultWithReturn(query4);
        rs3.next();
        String d="";
        if(rs1.getString("DOCUMENT_NAME")!=null)
            d=rs1.getString("DOCUMENT_NAME");
%>
       <tr><td><%=rs1.getString("ISSUER")%></td>
           <td><%=d%></td>
           <td><%=rs3.getString("DOCUMENT_NAME")%></td>

       
           <td><button id="<%=rs3.getString("DOCUMENT_NAME")%>,<%=rs3.getString("PATH")%>" onclick="download(this.id)" data-target="#myModal">DOWNLOAD</button>
          
<%
    } while(rs1.next());
  %>
  </table>
<%  
}
        %>
        
        
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Request A Document</h4>
        </div>
        <div class="modal-body">
            <form method="post" action="Request">
                <table><tr style="height: 60px;"><td>
                Issuer Email Id/Username : <input type="text" name="email" id="email" style="width: 300px;" required placeholder="Email Id or Username"/>
                        </td><td>
                            <div style="display: none;" id="error">Please enter a valid Email Id or Username.</div>
             
                        </td></tr>
                    <tr style="height: 60px;"><td>
               
                Document Name : <input type="text" name="file" style="width: 300px;" required placeholder="Document Name"/>
                        </td></tr><tr style="height: 60px;"><td>
                             <textarea name="message" placeholder="Message(Optional)" style="height: 100px;width: 500px;"></textarea>
                </td></tr></table>
                <input type="submit" class="btn btn-ghost btn-lg" value="Request">
            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>
</center>
        
        <form action="DownloadFile" method="post" id="DownloadFile">
    <input type="hidden" name="doc_name" id="doc_name">
    <input type="hidden" id="doc_path" name="doc_path">
</form>
    
</body>
</html>


<%
    }
%>