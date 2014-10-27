<%-- 
    Document   : searchProfile
    Created on : 25-Oct-2014, 02:01:30
    Author     : Dreads
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <header>
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        </header>
       
        <nav>
            <ul>
              <%LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                
                    if (lg.getlogedin()) 
                    {%>
                        <li><a href="upload.jsp">Upload</a></li>
                        <li><a href="searchUserPhotos.jsp">Search Users Photos</a></li>
                        <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                        <li><a href="/Instagrim/Images/exampleUser">Sample Images</a></li>
                        <li><a href="Logout.jsp">Log Out</a></li>
                <%}else{%>
                        <li><a href="register.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="Images/exampleUser">Sample Images</a></li>
                <%}%>
                
            </ul>
        </nav>
       
        <article>
            <h3>Search for a user</h3>
            <form method="POST"  action="findUser">
                <ul>
                    <li>username <input type="text" name="username"></li>
                </ul>
                <br/>
                <input type="submit" value="Search"> 
            </form>

        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
