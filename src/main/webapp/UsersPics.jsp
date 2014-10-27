<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
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
                
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if(lg!= null) 
                        {
                                %>
                                <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                            <li class="nav"><a href="/Instagrim/searchProfile.jsp">Search Profiles</a></li>
                            <li class="nav"><a href="/Instagrim/searchUserPhotos.jsp">Search Users Photos</a></li>
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
                          <h1>${username}</h1>
        <article>
        <%
            String username = (String)session.getAttribute("username");
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            
            if (lsPics == null) {
        %>
                <p>No Pictures found</p>
        <%
            } else {
                %>
                <h1><%=username%>'s Pics!</h1>
                <%
                Iterator<Pic> iterator;
                iterator = lsPics.iterator();
                while (iterator.hasNext()) 
                {
                    Pic p = (Pic) iterator.next();
                    %>
                    <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/><%

                }
            }
        %>
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
