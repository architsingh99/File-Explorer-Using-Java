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
    <script src="css/sweetalert.min.js"></script>
<script src="css/notification.css"></script>
    <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    
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
        function requestApprove(n)
        {
            //alert(n);
            document.getElementById("request_id").value=n;
        }
        function requestDelete(n)
        {
            swal({
                title: "Are you sure?",
                text: "Once deleted, you will not be able recover this request!",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                    .then((willDelete)=> {
                        if(willDelete)
                {
                    
                    swal("The request has been deleted", {
                    icon: "success",
                    
                });
                document.getElementById("request2_id").value=n;
         document.getElementById("DeclineRequest").submit();
            } else {
                swal("The request is safe!");
            }
        });
        }
        function remove(n)
        {
            document.getElementById("not_id").value=n;
         document.getElementById("RemoveNotification").submit();
            
        }
        </script>
</head>
<link rel="icon" href="assets/images/favicon.png">
<body>
    <%@include file="nav.jsp"%>
    
    
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Select a DOCUMENT to share..</h4>
        </div>
        <div class="modal-body">
            
               
                    <%
                        String query2=obj.selectFromDocumentsAccordingToUsername(user);
                        ResultSet rs1=obj1.resultWithReturn(query2);
                        if(rs1.next()==false)
                        {
                            %>
                            UPLOAD A DOCUMENT FIRST FOR SHARING IT..
                            <%
                            
                        }
                        else
                        {
%>
<form method="post" action="ApproveRequest">
    <select name="doc_id" style="background-color: transparent;max-width:100%;min-width:100%;height: 25px;font-family: Roboto;font-size: large;color: #535953;border: none">
<%
                         do   
                         {
                        %>
                        
                        <option value="<%=rs1.getString("DOCUMENT_ID")%>"><%=rs1.getString("DOCUMENT_NAME")%></option>
                       
                 <%
                     } while(rs1.next());
%>
     </select>
     <br><br><br>
     <center>
         <input type="hidden" name="request_id" id="request_id">
                 <input type="submit" class="btn btn-ghost btn-lg" value="Approve">
            </center></form>
<%
}
                     %>
                
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
   
    
    
    
    <%
        String query=obj.selectFromRequestDocumentAccordingToUsername(user);
        ResultSet rs=obj1.resultWithReturn(query);
        if(rs.next()==false)
        {
            %>
            <h3></h3>
            <%
        }
else
{
   %>
<center>
   <table><tr><th>REQUESTER</th><th>DOCUMENT NAME</th><th>MESSAGE</th><th>TIMESTAMP</th><th>ACTION</th></tr>
   <%
do
    {
%>
       <tr><td><%=rs.getString("REQUESTER")%></td>
           <td><%=rs.getString("DOCUMENT_NAME")%></td>
           <td><%=rs.getString("MESSAGE")%></td>
       <td><%=rs.getString("TIME")%></td>
       <%
           String r=rs.getString("REQUEST_ID");
           %>
       <td><button data-toggle="modal" id="<%=r%>" onclick="requestApprove(this.id)" data-target="#myModal">APPROVE</button>
           &nbsp;/&nbsp;<button id="<%=r%>" onclick="requestDelete(this.id)">DELETE</button>&nbsp;</td></tr>
<%
    } while(rs.next());
  %>
   </table></center><br>
<%  
}
    String query6=obj.selectFromNotificationAccordingToUsername(user);
ResultSet rs6=obj1.resultWithReturn(query6);
while(rs6.next())
{
%>
<div class="alert alert-info">

  <a class="close" data-dismiss="alert" id="<%=rs6.getString("NOTIFICATION_ID")%>" onclick="remove(this.id)">×</a>

  <h4 class="glyphicon glyphicon-arrow-right"><%=rs6.getString("MESSAGE")%></h4>

</div>
<%
}
%>
   
     <form action="DeclineRequest" method="post" id="DeclineRequest">
    <input type="hidden" name="request2_id" id="request2_id">
    
</form>

<form action="RemoveNotification" method="post" id="RemoveNotification">
    <input type="hidden" name="not_id" id="not_id">
    
</form>

</body>
</html>


<%
    }
%>