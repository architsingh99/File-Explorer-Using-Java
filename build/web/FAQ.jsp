<%-- 
    Document   : contact
    Created on : Apr 16, 2018, 2:50:24 AM
    Author     : Archit
--%>

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
        
          %>
<!DOCTYPE html>
<html>

    <head>
        <style>
            #myDIV, #myDIV1, #myDIV2, #myDIV3, #myDIV4, #myDIV5, #myDIV6, #myDIV7 {

    width: 100%;

    

    text-align: left;

    

    margin-top: 20px;

}
        </style>
        <script>
        function myFunction() {

    var x = document.getElementById("myDIV");

    if (x.style.display === "none") {

        x.style.display = "block";

    } else {

        x.style.display = "none";

    }

}

function myFunction1() {

    var x = document.getElementById("myDIV1");

    if (x.style.display === "none") {

        x.style.display = "block";

    } else {

        x.style.display = "none";

    }

}

function myFunction2() {

    var x = document.getElementById("myDIV2");

    if (x.style.display === "none") {

        x.style.display = "block";

    } else {

        x.style.display = "none";

    }

}

function myFunction3() {

    var x = document.getElementById("myDIV3");

    if (x.style.display === "none") {

        x.style.display = "block";

    } else {

        x.style.display = "none";

    }

}

function myFunction4() {

    var x = document.getElementById("myDIV4");

    if (x.style.display === "none") {

        x.style.display = "block";

    } else {

        x.style.display = "none";

    }

}

function myFunction5() {

    var x = document.getElementById("myDIV5");

    if (x.style.display === "none") {

        x.style.display = "block";

    } else {

        x.style.display = "none";

    }

}

function myFunction6() {

    var x = document.getElementById("myDIV6");

    if (x.style.display === "none") {

        x.style.display = "block";

    } else {

        x.style.display = "none";

    }

}

function myFunction7() {

    var x = document.getElementById("myDIV7");

    if (x.style.display === "none") {

        x.style.display = "block";

    } else {

        x.style.display = "none";

    }

}
</script>
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






    </head>

    <body>
<%
            if(user.equalsIgnoreCase("ADMIN"))
            {
                %>
                <%@include file="admin_nav.jsp"%>
                <%
                
            }
            else
            {
                %>
                <%@include file="nav.jsp"%>
                <%
            }
            %>

    <center>

    <div style="background-color: transparent" class="container well" style="margin-top: 50px">



        <div class="panel panel-default">

            <div class="panel-body">


                <b style="font-size: x-large;color: #b0b0b0;">FAQ</b>

                <br><br><br>
                    <button class="btn btn-info btn-lg glyphicon glyphicon-arrow-down" style="width: 1100px;height: 40px;" onclick="myFunction()">What are the key components of File Explorer?</button>
                    <div id="myDIV" style="display:none;">
  
    <strong>Each user’s File Explorer account has the following sections: </strong><br>
    <b><i>i. Dashboard –</i></b>  This section is the first page you see when you login and shows all your uploaded documents. <br>
<b><i>ii. Issued Documents –</i></b>  This section shows the URIs (links) of the documents issued by you to another user. You can also issue a new document to another user from here. <br>
<b><i>iii. Other Documents –</i></b> This section shows all the documents which are issued by others for you. You can request a document from a user from here. <br>
<b><i>iv. About –</i></b>  This sections shows the details about the File Explorer Website. <br>
<b><i>v. Notifications –</i></b>  This section is a log of the activities you performed in your File Explorer account. The log included the details about the activities such as file request, file issued, etc. <br>
<b><i>vi. Contact –</i></b>  This section allows you  to contact with the admin regarding  your issues/problems. 
    

</div>
                    <br><br>
                    <button class="btn btn-info btn-lg glyphicon glyphicon-arrow-down" style="width: 1100px;height: 40px;" onclick="myFunction1()">What are the benefits of using File Explorer?</button>
<div id="myDIV1" style="display:none;">
  
    <strong>File Explorer  is aimed at the concept of paperless governance. It offers the following benefits:  </strong><br>
   i. Citizens can access their digital documents anytime, anywhere and share it online. This is convenient and time saving.  <br>
ii. It reduces the administrative overhead of Government departments by minimizing the use of paper.  <br>
iii. File Explorer makes it easier to validate the authenticity of documents as they are issued directly by the registered issuers. 
 
</div>
<br>
 <br>
    <button class="btn btn-info btn-lg glyphicon glyphicon-arrow-down" style="width: 1100px;height: 40px;" onclick="myFunction2()">What security features are implemented in File Explorer? Is it safe to put my data in it? </button>
<div id="myDIV2" style="display:none;">
  
    <strong>File Explorer is safe and secure to use. We are taking all precautionary measures to ensure your data is protected and uncompromised. Please find the list of security measures that have been implemented till now. This list will expand as more safety features get added.   </strong><br>
<b><i>i. Standard Practices:</i></b> File Explorer follows standard software development practices of uniform coding standards, guidelines and reviews. Every release is reviewed and tested internally for security and penetration vulnerabilities before getting deployed on our servers. <br>
<b><i>ii. Email Authentication based Sign Up:</i></b> File Explorer uses email authentication based signup via OTP (one time password) for authenticating users and allowing access to the platform.<br>
<b><i>iii.Data Redundancy:</i></b> Data is backed up in secure environment with proper redundancy.<br>
<b><i>iv.Timed Log Out:</i></b> To protect user’s account from unauthorized access, our system is designed to terminate session automatically if extended inactivity is detected.<br>

</div>
<br>
 <br>
 
 
 <button class="btn btn-info btn-lg glyphicon glyphicon-arrow-down" style="width: 1100px;height: 40px;" onclick="myFunction3()">How can I sign up for File Explorer? </button>
<div id="myDIV3" style="display:none;">
    Signing up for File Explorer is easy - all you need is your email address. <br>
Your email address will be authenticated by sending an OTP (one-time password) followed by selecting a username & password. This will create your File Explorer account. 

</div>
<br>
 <br>

 
  <button class="btn btn-info btn-lg glyphicon glyphicon-arrow-down" style="width: 1100px;height: 40px;" onclick="myFunction4()">What is OTP? </button>
<div id="myDIV4" style="display:none;">
    OTP is a random one-time password generated by the system and sent to your registered email-id. <br>
The OTP is valid for 30 mins only. If you enter the OTP after 30 mins, it will be rendered invalid and you will have to enter a fresh one. 
</div>
<br>
 <br>
 
 
 <button class="btn btn-info btn-lg glyphicon glyphicon-arrow-down" style="width: 1100px;height: 40px;" onclick="myFunction5()">I am waiting for the OTP, but I haven't received it for more than 5 minutes. What should I do?  </button>
 <div id="myDIV5" style="display:none;">
     While using File Explorer, the OTP is sent instantaneously. Sometimes there may be temporary problems either on our servers (while generating/sending OTP) or in delivery of the email by your email address. We suggest you wait for few more minutes and try again. 
 </div>
<br>
 <br>
 
 
 <button class="btn btn-info btn-lg glyphicon glyphicon-arrow-down" style="width: 1100px;height: 40px;" onclick="myFunction6()">What are issued documents and what are uploaded documents?  </button>
 <div id="myDIV6" style="display:none;">
  Issued documents are e-documents issued by various other users in electronic format directly from the original data source and the URI (link) of these documents is available in the other documents section of File Explorer. Whereas uploaded documents are those e-documents uploaded directly by the File Explorer user. 
 </div>
<br>
 <br>
 
 <button class="btn btn-info btn-lg glyphicon glyphicon-arrow-down" style="width: 1100px;height: 40px;" onclick="myFunction7()">How can I upload documents to my File Explorer account?  </button>
 <div id="myDIV7" style="display:none;">
 Click the upload file button which is present at the homepage section to start uploading a document. In the file upload dialog box, locate the file from your local drive and select 'open' to complete the uploading. 
 </div>
<br>
 <br>

                
                
                
            </div>
        </div>
    </div>
</center>

    <script src="assets/bootstrap-3.3.7-dist/js/jquery.js"></script>
    <script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    </body>
    </html>

    <%
        }
        %>