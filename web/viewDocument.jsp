<%-- 
    Document   : viewDocument
    Created on : Mar 3, 2018, 2:42:50 AM
    Author     : Archit
--%>

  <%@page import="java.sql.ResultSet"%>
<%@page import="Database.*"%>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
          Path obj3=new Path();
        String path=obj3.path()+"\\"+user;
       
        
        if(request.getParameter("path")!=null)
                {
                    path=request.getParameter("path");
                  
                }
        String m=(String)session.getAttribute("m");
        //out.println(message);
        if(m!=null)
        {
            path=(String)session.getAttribute("path");
            session.removeAttribute("m");
            
        }
        if((String)request.getAttribute("path")!=null)
                {
                    path=(String)request.getAttribute("path");
                  
                }
          
        
        
        
        /* String nm=request.getParameter("folname");
         String newN=request.getParameter("newName");
          if(nm!=null && newN!=null)
          {
             // String query=obj.selectAllFromUserDetailsAccordingToUsername(user);
              //ResultSet rs=obj1.resultWithReturn(query);
              //rs.next();
              //String folders=rs.getString("folder");
              
             // folders=folders.replaceAll(nm, newN);
              //String query1=obj.updateIntoUser_DetailsFolder(folders, user);
              //obj1.result(query1);
              String oldPath=path+"\\"+nm;
              String newPath=path+"\\"+newN;
              File dir=new File(oldPath);
              File newdir=new File(newPath);
              if(dir.isDirectory())
                  dir.renameTo(newdir);
             }
*/
        %>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
<title>File Explorer</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="assets/css/default.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/component.css" />

<link rel="icon" href="assets/images/favicon.png">
    <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
 
      <script src="css/sweetalert.min.js"></script>
    <script type="text/javascript">
       
        function check(c, value)
        {
            <%
               
                File direct = new File(path);
        File[] List = direct.listFiles();
        if(List!=null)
        {
        for (File file : List){
                %>
            document.getElementById("<%=file.getName()%>").style.background='transparent';
            
                <%
                    }
}
                    %>
                  
            c.style.background='AliceBlue';
            
            var v=value.lastIndexOf('.');
          //alert(v);
          if(v>=0)
          {
              document.getElementById("folder").style.display="none";
              document.getElementById("file").style.display="block";
              document.getElementById("file_name").value=value;
              document.getElementById("file_name2").value=value;
              document.getElementById("file_name3").value=value;
              document.getElementById("doc_name").value=value;
          }
          else
          {
              document.getElementById("file").style.display="none";
              document.getElementById("folder").style.display="block";
              document.getElementById("FolderName").value=value;
              document.getElementById("FolderName1").value=value;
              document.getElementById("FolderName2").value=value;
          }
        
    }
    function folderOpen()
    {
            document.getElementById("open").submit();
    }

     function folderRename()
    {
        var n=prompt("Enter the new folder name.");
        if(n!=null)
        {
         document.getElementById("new_folder").value=n;
         
         document.getElementById("rename").submit();
     }
          
}   

 

    function folderDelete()
    {
        document.getElementById("delete").submit();
    }
    
    function fileRename()
    {
        var nn=prompt("Enter the new file name.");
        if(nn!=null)
        {
         document.getElementById("new_name").value=nn;
         document.getElementById("filerename").submit();
} }

    function fileDelete()
    {
        document.getElementById("filedelete").submit();
    }
    function newFolder()
    {
                var n=prompt("Enter the folder name");
                document.getElementById("new_folder1").value=n;
                 document.getElementById("create_new_folder").submit();
    }
    
    
    function setup()
    {
        document.getElementById("btnid").addEventListener('click', openDialog);
        function openDialog()
        {
            document.getElementById("file_upload").click();
        }
        document.getElementById("file_upload").addEventListener('change', submitForm);
        function submitForm()
        {
            document.getElementById("file_upload1").submit();
        }
    }
    function fileDownload()
    {
        document.getElementById("DownloadFile").submit();
        
    }
    function search()
    {
        var n=document.getElementById("search2").value;
        if(n==null || n=="")
        {
            swal("Please enter an input in the search box beforing clicking the button");
            document.getElementById("search2").focus();
        }
        else
        {
        window.location.href="searchResult.jsp?search="+n;
  
    }
}
    
    </script>
<style> 
body {
    font-family: Arial;
}

* {
    box-sizing: border-box;
}

div.example input[type=text] {
    padding: 10px;
    font-size: 17px;
    border: 1px solid grey;
    float: left;
    width: 80%;
    background: #f1f1f1;
}

div.example button {
    float: left;
    width: 20%;
    padding: 10px;
    background: #2196F3;
    color: white;
    font-size: 17px;
    border: 1px solid grey;
    border-left: none;
    cursor: pointer;
}

div.example button:hover {
    background: #0b7dda;
}

div.example::after {
    content: "";
    clear: both;
    display: table;
}
</style>

</head>

<body onload="setup()">
    <%@include file="nav.jsp"%>

   <div class="example" style="margin:auto;max-width:300px;float: left;">
        <input type="text" placeholder="Search.." name="search2" id="search2">
  <button onclick="search()" style="background-image: url('assets/images/searchicon.png');background-repeat: no-repeat; height: 46px; width: 46px;"><i class="fa fa-search"></i></button>
</div>
    
<center>

            <table><tr style="color: lightseagreen;"><td>

                <button onclick="newFolder()" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft">New Folder</button>&nbsp;
            </td><td>
        <form id="file_upload1" action="FileUpload" method="post" enctype="multipart/form-data">
            <input type="file" id="file_upload" name="file_upload" required style="display: none;"/>
     <button class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft" id="btnid">Upload File</button>&nbsp;
     <input type="hidden" name="folder" value="<%=path%>">
     <input type="submit" value="Submit" style="display: none;">
        </form>
        </td>
        <td>
        <div id="file" style="display: none;">
                <button onclick="fileRename()" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft">Rename</button>&nbsp;
                <button onclick="fileDelete()" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft">Delete</button>&nbsp;
                <button onclick="fileDownload()" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft">Download</button>&nbsp;
        </div>
        </td>
        <td>
        <div id="folder" style="display: none;">
            <button onclick="folderOpen()" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft">Open</button>&nbsp;
            <button onclick="folderRename()" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft">Rename</button>&nbsp;
            <button onclick="folderDelete()" class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft">Delete</button>&nbsp;
             
            
        </div>

        </td></tr></table>
 
<table>  <tr>   
        <%
 
        File directory = new File(path);
        File[] fList = directory.listFiles();
        int a=1;
        if(fList!=null)
        {
        for (File file : fList){
            if (file.isDirectory()){
                if(a==7)
                {
                    a=1;
                %>
    </tr><tr>
        <%
            }
%>
                        
<td style="text-align: center; height: 180px; width: 180px;" onclick="check(this,'<%=file.getName()%>')" id='<%=file.getName()%>'>
                
                        <img src="assets/images/icons/folder.png" style="height: 100px;width: 100px;">
                        <br>
                        <span style="font-size:20px;"><%=file.getName()%></span>
                          
                   
           </td>
                
            <%  a++; }
        }
}
%>

        
<%
        
         File directory1 = new File(path);
        File[] fList1 = directory1.listFiles();
        String ex;
       if(fList1!=null)
        {
          for (File file : fList1){
             if (file.isFile()){
                 int dot=file.getName().lastIndexOf('.');
                 ex=file.getName().substring(dot+1, (file.getName().length()));
                       if(a==7)
                { 
                    a=1;
                %>
    </tr><tr>
        <%
            }
%>
<td style="text-align: center; height: 180px; width: 180px;" id='<%=file.getName()%>' onclick="check(this,'<%=file.getName()%>')">
                
                        <%
                            if(ex.equalsIgnoreCase("ppt") || ex.equalsIgnoreCase("pptx"))
                            {
                            %>
                        <img src="assets/images/icons/ppt.png" style="height: 100px;width: 100px;">
                        <%
                            }
                               else if(ex.equalsIgnoreCase("exe"))
                            {
                            %>
                        <img src="assets/images/icons/application.png" style="height: 100px;width: 100px;">
                        <%
                            }
                               else if(ex.equalsIgnoreCase("java") || ex.equalsIgnoreCase("c++") || ex.equalsIgnoreCase("c") || ex.equalsIgnoreCase("php") || ex.equalsIgnoreCase("js") || ex.equalsIgnoreCase("html") || ex.equalsIgnoreCase("jsp"))
                            {
                            %>
                        <img src="assets/images/icons/program.png" style="height: 100px;width: 100px;">
                        <%
                            }
                               else if(ex.equalsIgnoreCase("css"))
                            {
                            %>
                        <img src="assets/images/icons/css.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("db"))
                            {
                            %>
                        <img src="assets/images/icons/db.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("doc"))
                            {
                            %>
                        <img src="assets/images/icons/doc.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("mp4") || ex.equalsIgnoreCase("mkv") || ex.equalsIgnoreCase("avi") || ex.equalsIgnoreCase("mov") || ex.equalsIgnoreCase("wmv"))
                            {
                            %>
                        <img src="assets/images/icons/film.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("mp3"))
                            {
                            %>
                        <img src="assets/images/icons/music.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("pdf"))
                            {
                            %>
                        <img src="assets/images/icons/pdf.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("rar"))
                            {
                            %>
                        <img src="assets/images/icons/rar.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("txt"))
                            {
                            %>
                        <img src="assets/images/icons/txt.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("zip"))
                            {
                            %>
                        <img src="assets/images/icons/zip.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("jpg") || ex.equalsIgnoreCase("jpeg") || ex.equalsIgnoreCase("png") || ex.equalsIgnoreCase("gif") || ex.equalsIgnoreCase("bmp"))
                            {
                            %>
                        <img src="assets/images/icons/picture.png" style="height: 100px;width: 100px;">
                        <%
                            }else if(ex.equalsIgnoreCase("xls") || ex.equalsIgnoreCase("xlms"))
                            {
                            %>
                        <img src="assets/images/icons/xls.png" style="height: 100px;width: 100px;">
                        <%
                            }
                            else
                                {
                            %>
                            <img src="assets/images/icons/file.png" style="height: 100px;width: 100px;">
                            <%
                                }
                                %>
                        <br>
                        <span style="font-size:20px;"><%=file.getName()%></span>
                    
           </td>
<%    a++;        }
        }
}
    
            %>
            </tr></table>
            </center>
<form action="OpenButtonPath" method="post" id="open">
    <input type="hidden" value="<%=path%>" name="path" id="path">
    <input type="hidden" id="FolderName" name="folder">
</form>

<form action="Rename" method="post" id="rename">
    <input type="hidden" value="<%=path%>" name="path1" id="path1">
    <input type="hidden" id="FolderName1" name="folder">
    <input type="hidden" name="new_folder" id="new_folder">
</form>
    
    <form action="Delete" method="post" id="delete">
    <input type="hidden" value="<%=path%>" name="path2" id="path2">
    <input type="hidden" id="FolderName2" name="folder">
</form>
    
    <form action="FileRename" method="post" id="filerename">
    <input type="hidden" value="<%=path%>" name="path3" id="path3">
    <input type="hidden" id="file_name" name="file_name">
    <input type="hidden" name="new_name" id="new_name">
</form>
    
    <form action="File_Delete" method="post" id="filedelete">
    <input type="hidden" value="<%=path%>" name="path4" id="path4">
    <input type="hidden" id="file_name2" name="file_name2">
</form>
    
    <form action="New_Folder" method="post" id="create_new_folder">
    <input type="hidden" value="<%=path%>" name="path5" id="path5">
    <input type="hidden" id="new_folder1" name="new_folder1">
</form>
     <form action="DownloadFile" method="post" id="DownloadFile">
    <input type="hidden" name="file_name3" id="file_name3">
    <input type="hidden" id="doc_path2" value="<%=path%>" name="doc_path2">
</form>
   
    </body>
</html>
<%
    }
%>