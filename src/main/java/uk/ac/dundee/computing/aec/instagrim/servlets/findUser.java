/*
 * This servlet will take in the username and it will search the database to get the users details and take them 
 * to the users profile.
 * @author Dreads
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dreads
 */
@WebServlet(name = "findUser", urlPatterns = {"/findUser"})
public class findUser extends HttpServlet {
    Cluster cluster=null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    /**
     * This method will get the username inputted and will search the database for the users details. If the user is not found,
     * it will redirect to the index page. If the user is found, it will then redirect them to the profile.
     * 
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     * 
     * @author Dreads
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username=request.getParameter("username");
        
        User us=new User();
        us.setCluster(cluster);
        Object firstName = us.getFirstName(username);
        Object lastName = us.getLastName(username);
        Object email = us.getEmail(username);
        Object profileDescription = us.getProfileDescription(username);
        
        request.getSession().setAttribute("username", username);
        request.getSession().setAttribute("firstName", firstName);
        request.getSession().setAttribute("lastName", lastName);
        request.getSession().setAttribute("email", email);
        request.getSession().setAttribute("profileDescription", profileDescription);
        if(username.equals(""))
        {
           RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	   rd.forward(request,response);
        }else{
            response.sendRedirect("userProfile.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
