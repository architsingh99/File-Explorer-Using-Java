<%-- 
    Document   : AAA
    Created on : Mar 16, 2018, 3:43:23 AM
    Author     : Archit
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File dir=new File("Documents\\"+"Armm");
            dir.mkdirs();
            %>
        <h1>Hello World!</h1>
    </body>
</html>
