<%-- 
    Document   : userProfile
    Created on : 24-Oct-2014, 19:35:46
    Author     : Dreads
--%>


<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
        <header>
        
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        </header>
        
        <nav>
            <ul>
                
               
                    <%
                        String username = (String)session.getAttribute("username");
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg.getlogedin()) 
                        {
                                %>
                            
                                <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                                <li class="nav"><a href="/Instagrim/Images/exampleUser">Sample Images</a></li>
                                <li class="nav"><a href="/Instagrim/Logout.jsp">Log Out</a></li>
                          <%
                            }else{
                          %>
                                <li class="nav"><a href="/Instagrim/register.jsp">Register</a></li>
                                <li class="nav"><a href="/Instagrim/login.jsp">Login</a></li>
                          <%}%>
            </ul>
        </nav>
 
        <article>
            <%
                
                String firstName = (String)session.getAttribute("firstName");
                String lastName = (String)session.getAttribute("lastName");
                String email = (String)session.getAttribute("email");
                String profileDescription = (String)session.getAttribute("profileDescription");
                        %>
            <h1><%=username%>'s Profile!</h1>
       
        <h3>Username: <%=username%></h3>
        <h3>First name: <%=firstName%></h3>
        <h3>Last name: <%=lastName%></h3>
        <h3>Email: <%=email%></h3>
        <h3><%=username%>'s Profile description: <%=profileDescription%></h3>
        
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>

