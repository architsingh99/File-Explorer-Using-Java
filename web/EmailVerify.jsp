<%-- 
    Document   : EmailVerify
    Created on : Jan 25, 2018, 4:48:35 AM
    Author     : Archit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
    <title>
        File Explorer
    </title>
        <link rel="icon" href="assets/images/favicon.png">
         <script>
    function DrawCaptcha()
    {
       
        var h = Math.ceil(Math.random() * 10)+ '';
        var b = Math.ceil(Math.random() * 10)+ '';       
        var c = Math.ceil(Math.random() * 10)+ '';  
        var d = Math.ceil(Math.random() * 10)+ '';  
        var e = Math.ceil(Math.random() * 10)+ '';  
        var f = Math.ceil(Math.random() * 10)+ '';  
        var g = Math.ceil(Math.random() * 10)+ '';  
        var code = h + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
        document.getElementById("txtCaptcha").value = code;
       
    }
    
          function verify()
          {
              var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
        var str2 = removeSpaces(document.getElementById('txtInput').value);
        if (str1===str2)
        {
              var a=<%=(String)request.getAttribute("code")%>;
              //alert(a);
              //alert(document.getElementById('id').value);
              if(document.getElementById('id').value!=a)
              {
                  alert("Wrong Verification Code..");
                  document.getElementById('id').focus();
                  return false;
              }
             
          }
          else
          {
              alert("Invalid CAPCTHA Code Entered..");
              return false;
          }
          }
          
          function removeSpaces(string)
    {
        return string.split(' ').join('');
    }
    
          
          </script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">




    <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="assets/bootstrap-3.3.7-dist/css/bootstrap-imageupload.css" rel="stylesheet">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

      <link rel="stylesheet" href="assets/css/style.css">
    
    
    <link rel="stylesheet" href="assets/css/style1.css">






</head>

<body onload="DrawCaptcha();">
 
<br>
<br><br><br><br><br><br><br>



<div style="background-color: transparent" class="container well" style="margin-top: 50px">



        <div class="panel panel-default">

            <div class="panel-body">



                 <b style="font-size: x-large;color: #b0b0b0;">VERIFY YOUR EMAIL TO COMPLETE SIGN UP</b>
                
                <br>
                <br>


                <form name="frm" action="Register" method="post" onsubmit="return verify()">
  <input style="width:300px;height:5%" id="id" placeholder="Enter the verification code" type="text" name="id" required>
  
    <% 
        String email=(String)request.getAttribute("email");
       String pass=(String)request.getAttribute("pass");
       String user=(String)request.getAttribute("user");
       %> 
       
  <input type="hidden" name="email" value="<%=email%>"/>
     <input type="hidden" name="user" value="<%=user%>" />
     <input type="hidden" id="pass" name="pass" value="<%=pass%>"/>
    <br>
    <br><br>
    <input type="text" id="txtCaptcha" style="background-image:url(assets/images/asphalt.jpg); text-align:center; border:none; 
           font-weight:bold; font-family:Modern; height:50px; font-size:30px;" readonly=""/>
        <input type="button" id="btnrefresh" value="Refresh" onclick="DrawCaptcha();" />
        <br> <br>
        <input type="text" id="txtInput"/>
        <br>
    <input class="btn btn-ghost btn-lg" data-animation="animated fadeInLeft" type="submit" value="SUBMIT" name="sbtn1">
</form>
    
                
            </div>
    </div>
    </div>
    
    
    
</body>
    
    <script src="assets/bootstrap-3.3.7-dist/js/jquery.js"></script>
<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</html>