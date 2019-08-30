package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class HomePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

    String user=(String)session.getAttribute("user");
    if(user==null)
    {
               request.setAttribute("message", "Login in first to use File Explorer.");
               RequestDispatcher re=getServletConfig().getServletContext().getRequestDispatcher("/index.jsp");
               re.forward(request,response);
    }
    else
    {
    
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>File Explorer</title>\n");
      out.write("    <meta charset=\"UTF-8\" />\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/default.css\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/component.css\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("    <link href=\"assets/bootstrap-3.3.7-dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\n");
      out.write("\n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<center>\n");
      out.write("\n");
      out.write("<div class=\"container\">\n");
      out.write("\n");
      out.write("    <header>\n");
      out.write("        <h1 STYLE=\"color: white\">DIGITAL LOCKER<span>WELCOME ");
      out.print(user);
      out.write("</span></h1>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("\n");
      out.write("<h1 style=\"color: white;\"><i>\n");
      out.write("    ");
 
        String message=(String)request.getAttribute("message");
        if(message!=null)
        {
        out.println(message);
        }
       
      out.write("\n");
      out.write("        </i></h1>\n");
      out.write("\n");
      out.write("    <div class=\"main clearfix\">\n");
      out.write("        <nav id=\"menu\" class=\"nav\">\n");
      out.write("            <ul>\n");
      out.write("                <li>\n");
      out.write("                    <a style=\"text-decoration:none\" href=\"uploadDocument.jsp\">\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"glyphicon\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<i aria-hidden=\"true\" class=\"glyphicon-file\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t</span>\n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("                        <span style=\"font-size:20px\">UPLOAD DOCUMENT</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"viewDocument.jsp\" style=\"text-decoration:none\">\n");
      out.write("                        <span class=\"glyphicon\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<i aria-hidden=\"true\" class=\"glyphicon-folder-open\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t</span>\n");
      out.write("\n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("                        <span style=\"font-size:20px\">MANAGE DOCUMENTS</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("                <li>\n");
      out.write("                    <a style=\"text-decoration:none\" href=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"glyphicon\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<i aria-hidden=\"true\" class=\"glyphicon-user\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t</span>\n");
      out.write("\n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("                        <span style=\"font-size:20px\">VIEW YOUR PROFILE</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("                   <li>\n");
      out.write("                    <a style=\"text-decoration:none\" href=\"#\">\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"glyphicon\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<i aria-hidden=\"true\" class=\"glyphicon glyphicon-briefcase\" ></i>\n");
      out.write("\t\t\t\t\t\t\t\t</span>\n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("                        <span style=\"font-size:20px\">ABOUT US</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                \n");
      out.write("                   <li>\n");
      out.write("                    <a style=\"text-decoration:none\" href=\"../contact.php\">\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"glyphicon\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<i aria-hidden=\"true\" class=\"glyphicon glyphicon-phone-alt\" ></i>\n");
      out.write("\t\t\t\t\t\t\t\t</span>\n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("                        <span style=\"font-size:20px\">CONTACT US</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <li>\n");
      out.write("                    <a style=\"text-decoration:none\" href=\"");
      out.print(request.getContextPath());
      out.write("/LogOut\">\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"glyphicon\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<i aria-hidden=\"true\" class=\"glyphicon-log-out\" ></i>\n");
      out.write("\t\t\t\t\t\t\t\t</span>\n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("                        <span style=\"font-size:20px\">LOG OUT</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</center>\n");
      out.write("</body>\n");
      out.write("</html>\n");

    }

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
