<%-- 
    Document   : editProfile
    Created on : 26-Oct-2014, 22:18:48
    Author     : Dreads
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                            <li><a href="Logout.jsp">Log Out</a></li>
                    <%
                        }else{
                                %>
                            <li><a href="register.jsp">Register</a></li>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="Images/exampleUser">Sample Images</a></li>
                      <%}%>
            </ul>
        </nav>
        <article>
            <h3>Update Profile Bio</h3>
        
            <form method="POST"  action="updateProfileDescription">
                <ul>
                    <li>Username <input type="text" name="username"></li>
                    <li>Profile Description <input type="text" name="profileDescription"></li>
                </ul>
                <br/>
                <input type="submit" value="Enter"> 
            </form>
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
                <li>&COPY; Andy C</li>
            </ul>
        </footer>
    </body>
</html>
