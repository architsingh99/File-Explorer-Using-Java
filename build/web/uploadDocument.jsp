<%-- 
    Document   : uploadDocument
    Created on : Feb 1, 2018, 7:36:42 AM
    Author     : Archit
--%>


<%@page import="java.io.FileFilter"%>
<%@page contentType="text/html" language="java" import="Database.*,java.sql.ResultSet,java.io.File" pageEncoding="UTF-8"%>

<!DOCTYPE html>

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
        
            Path obj3=new Path();
         
          Query obj=new Query();
          RunQuery obj1=new RunQuery();
          
          String query=obj.selectAllFromUserDetailsAccordingToUsername(user);
         ResultSet rs=obj1.resultWithReturn(query);
         rs.next();
             String folder=rs.getString("FOLDER");
          
          String nm=request.getParameter("name");
          
          String fo;
          if(nm!=null)
          {
              
              if(folder.compareTo("null")==0)
              {
                  fo=nm;
              }
              else
              {
                  fo=folder+","+nm;
              }
          
              String path=obj3.path()+"\\"+user+"\\"+nm;
              File f=new File(path);
           if(!f.exists())
           {
               f.mkdirs();
            // String query1=obj.updateIntoUser_DetailsFolder(fo, user);
            // out.println(query1);
              //obj1.result(query1);
             response.sendRedirect("uploadDocument.jsp");
           }}
          
          
    %>



<html>
    <head>
        <script>
            function folder()
            {
                var n=prompt("Enter the folder name");
                if(!n=="")
                    window.location.replace("uploadDocument.jsp?name="+n);
            }
            
            </script>
            
    <title>
       File Explorer
    </title>

    <link rel="icon" href="assets/images/bg-5.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="icon" href="assets/images/favicon.png">
    
</head>
<body>
    
    
  <br><br><br> 

<div style="background-color: transparent" class="container well" style="margin-top: 50px">


    <div class="panel panel-default">

        <div class="panel-body">
            
        
            <CENTER>  
            
            
            <img src="P1.jpg" class="img-thumbnail" alt="Responsive image">
                
                 </CENTER>
            
           <br>
            <br>
            
            <b style="font-size: x-large;color: #b0b0b0;">FOLLOW THE STEPS:</b>
                    
                    <br>
            <br>
             <form action="FileUpload" method="post" enctype="multipart/form-data"> 
            <ul class="list-group">
  <li class="list-group-item list-group-item-action list-group-item-info">STEP-1: SELECT A FOLDER OR CREATE A NEW FOLDER WHERE YOU WANT TO UPLOAD YOUR FILE</li>
   <%
       
             if(folder.equalsIgnoreCase("null"))
             {
                 %>
  <li class="list-group-item">No folder have been created yet.
  <%
             }
            else
{
    File dir=new File(obj3.path()+"\\"+user);
File[] files=dir.listFiles();
FileFilter filefilter=new FileFilter() {
        @Override
        public boolean accept(File file) {
          return file.isDirectory();
        }
    };
files=dir.listFiles(filefilter);
String fname;
File filename;
int n;
for(int i=0;i<files.length;i++)
{
filename=files[i];
fname=filename.toString();
n=fname.length()-(56+user.length()+1);
   String ff=fname.substring(fname.length()-n);

          %>  
        
  <li class="list-group-item"><input type="radio" name="folder" value="<%=ff%>"><span class="glyphicon">
									<i aria-hidden="true" class="glyphicon-folder-open"> <%=ff%></i>
								</span>
      <%
          }
          }
          %>
          <br><br>
          
          <p class="btn btn-ghost btn-lg" style="border: solid; background-color: lightgray;" data-animation="animated fadeInLeft" onclick="folder()">Click here to create a new folder.</p>
                          
             
          
  </li>
  

  <li class="list-group-item list-group-item-action list-group-item-info">STEP-2:SELECT THE FILE YOU WANT TO UPLOAD</li>
                
  <li class="list-group-item"><input type="file" id="file" name="file" style="width: 500px;" required onchange="checkfile(this);"/></li>
                
<li class="list-group-item list-group-item-action list-group-item-info">STEP-3:</li>
                
                <li class="list-group-item">   <button class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft" type="submit"> UPLOAD</button></li>
  
</ul>        
     </form>  
        </div>
        
    </div>
    
    </div>

<script type="text/javascript" language="javascript">
    function checkfile(sender) {
       // var validExts = new Array(".xlsx", ".xls");
       
        
        var size = sender.files[0].size;
    
                            if(size > 10485760){
                                alert("Maximum file size exceeds. File maximum size cannot be more than 10MB.");
                                 document.getElementById("file").value=null;
                                return false;
                            }
        /*fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
        if (validExts.indexOf(fileExt) < 0) {
            alert("Invalid file selected, valid files are of " +
                validExts.toString() + " types.");
                document.getElementById("file").value=null;
            return false;
        }
        else return true;*/
        
    }
</script>
   
    <script src="assets/bootstrap-3.3.7-dist/js/jquery.js"></script>
    <script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>


<%
    
}
%>