<%-- 
    Document   : Logout
    Created on : 24-Oct-2014, 19:10:21
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
                <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg!= null)  
                        {
                    %>
                            <li><a href="upload.jsp">Upload</a></li>
                            <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                            <li><a href="searchProfile.jsp">Search Profiles</a></li>
                            <li><a href="searchUserPhotos.jsp">Search Users Photos</a></li>
                        <%}%>
            </ul>
        </nav>
        <article>
            <h1>Are you sure you want to log out?</h1>     
                <form action="${pageContext.request.contextPath}/LoggingOut" method="post">
                    <input type="submit" value="Log Out"> 
                </form>
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
    