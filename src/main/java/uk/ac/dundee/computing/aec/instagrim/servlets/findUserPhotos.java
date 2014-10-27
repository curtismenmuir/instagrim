/*
 * This servlet will take in the username and it will search the database to get the users photo collection. It will take them 
 * to the users photo gallery page.
 *
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
@WebServlet(name = "findUserPhotos", urlPatterns = {"/findUserPhotos"})
public class findUserPhotos extends HttpServlet {
    Cluster cluster=null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    /**
     * This method will get the username inputted and will search the database for the users photo collection. If the user is not found,
     * it will redirect to the index page. If the user is found, it will then redirect them to the users photo gallery.
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
        if(username.equals(""))
        {
           RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	   rd.forward(request,response);
        }else{
            response.sendRedirect("/Instagrim/Images/" + username);
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
