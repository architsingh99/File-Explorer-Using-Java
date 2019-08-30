<%-- 
    Document   : index
    Created on : Jan 13, 2018, 3:39:34 AM
    Author     : Archit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if(session.getAttribute("user")!=null)
    {
        RequestDispatcher re=getServletConfig().getServletContext().getRequestDispatcher("/LogOut");
               re.forward(request,response);
    }
    %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>File Explorer Login & Sign Up</title>
  
  
  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300'>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<link rel="icon" href="assets/images/favicon.png">
      <link rel="stylesheet" href="css/style.css">

      <script>
          function validate()
          {
              if(document.getElementById('pass').value!==document.getElementById('cpass').value)
              {
                  alert("Password and Confirm Password doesn't match.");
                  return false;
              }
             
          }
          function forgotPassword()
          {
              var n=prompt("Enter your username or email.");
                if(!n=="")
                {
                     document.getElementById("emailorusername").value=n;
     
         document.getElementById("ForgotPassword").submit();
                }
          }
          
          </script>
</head>

<body>
    

  <div class="cotn_principal">
<div class="cont_centrar">
    <h2 style="color: red;"><i>
    <% 
        String message=(String)request.getAttribute("message");
        if(message!=null)
        {
        out.println(message);
        }
       %>
        </i></h2>
  <div class="cont_login">
<div class="cont_info_log_sign_up">
      <div class="col_md_login">
<div class="cont_ba_opcitiy">
        
        <h2>LOGIN</h2>  
  <p>Click below to login into File Explorer.</p> 
  <button class="btn_login" onclick="cambiar_login()">LOGIN</button>
  </div>
  </div>
<div class="col_md_sign_up">
<div class="cont_ba_opcitiy">
  <h2>SIGN UP</h2>

  
  <p>Not yet Registered?? Click on Sign Up Now</p>

  <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
</div>
  </div>
       </div>

    
    <div class="cont_back_info">
       <div class="cont_img_back_grey">
       <img src="assets/images/bg-5.png" alt="" />
       </div>
       
    </div>
<div class="cont_forms" >
    <div class="cont_img_back_">
        <img src="assets/images/bg-5.png" alt="" />
       </div>
    <form action="Login" method="post">
 <div class="cont_form_login">
<a href="#" onclick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
   <h2>LOGIN</h2>
   <input type="email" placeholder="Email" name="email" required="" />
   <input type="password" placeholder="Password" name="pass" required="" />
   <input type="submit" class="btn_login" onclick="cambiar_login()" value="LOGIN" style="text-align: center;color: white;">
   <a style="color: red;"  onclick="forgotPassword()">Forgot Password?</a> 
 </div>
        </form>
    <form action="EmailVerify" method="post" onsubmit="return validate()">
   <div class="cont_form_sign_up">
<a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
     <h2>SIGN UP</h2>
     <input type="email" name="email" placeholder="Email" required="" />
     <input type="text" name="user" placeholder="Username" required="" />
     <input type="password" id="pass" name="pass" placeholder="Password" required="" />
     <input type="password" id="cpass" placeholder="Confirm Password" required="" />
     <input type="submit" class="btn_sign_up" onclick="cambiar_sign_up()" value="SIGN UP" style="text-align: center;color: white;">
     
  </div>
</form>
    </div>
    
  </div>
 </div>
</div>
  
  

    <script  src="js/index.js"></script>

 <form action="ForgotPassword" method="post" id="ForgotPassword">
    <input type="hidden" name="emailorusername" id="emailorusername">
    
</form>


</body>

</html>

