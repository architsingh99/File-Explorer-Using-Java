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
   function remove(n)
   {
       
       document.getElementById("issue_id").value=n;
      
         document.getElementById("RemoveIssuedDocument").submit();
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
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Issue A Document</button>
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
        String query3=obj.selectFromRequestDocumentAccordingToUsernameAndShared(user);
       ResultSet rs1=obj1.resultWithReturn(query3);
     //  out.println(query3);
        if(rs1.next()==false)
        {
            %>
            <h3></h3>
            <%
        }
else
{
   %>
   <table><tr><th>ISSUED FOR</th><th>DOCUMENT NAME</th>><th>ACTION</th></tr>
   <%
do
    {
        String query4=obj.selectFromDocumentsAccordingToDocumentId(rs1.getString("DOCUMENT_PROVIDED_ID"));
        ResultSet rs3=obj1.resultWithReturn(query4);
        rs3.next();
%>
       <tr><td><%=rs1.getString("REQUESTER")%></td>
           <td><%=rs3.getString("DOCUMENT_NAME")%></td>
      

       
           <td><button id="<%=rs1.getString("REQUEST_ID")%>" onclick="remove(this.id)" data-target="#myModal">REMOVE</button>
          
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
          <h4 class="modal-title">Issue A Document</h4>
        </div>
        <div class="modal-body">
            <%
                String query2=obj.selectFromDocumentsAccordingToUsername(user);
                ResultSet rs2=obj1.resultWithReturn(query2);
                if(rs2.next()==false)
                {
                    %>
                    UPLOAD A DOCUMENT FIRST FOR SHARING IT..
                    <%
                }
                else
                {
%>
 <form method="post" action="Issue">
                <table><tr style="height: 60px;"><td>
                Issue for : <input type="text" name="email" id="email" style="width: 300px;" required placeholder="Email Id or Username"/>
                        </td><td>
                            <div style="display: none;" id="error">Please enter a valid Email Id or Username.</div>
             
                        </td></tr>
                    <tr style="height: 60px;"><td>
               
                            Document Name : <select name='doc_name' style="background-color: transparent;max-width:80%;min-width:80%;height: 25px;font-family: Roboto;font-size: large;color: #535953;border: none">

<%
                    do
{
    %>
    <option value="<%=rs2.getString("DOCUMENT_ID")%>"><%=rs2.getString("DOCUMENT_NAME")%></option>
    
    <%

}
while(rs2.next());
%>

   </select> </td></tr><tr style="height: 60px;"><td>
                             <textarea name="message" placeholder="Message(Optional)" style="height: 100px;width: 500px;"></textarea>
                </td></tr></table>
                <input type="submit" class="btn btn-ghost btn-lg" value="SHARE">
            </form>
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
</div>
</center>
        
        <form action="RemoveIssuedDocument" method="post" id="RemoveIssuedDocument">
    <input type="hidden" name="issue_id" id="issue_id">
    
</form>
    
</body>
</html>


<%
    }
%>