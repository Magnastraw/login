package src;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.logging.Logger;


public class LoginFilter implements Filter {
    private Properties prop;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        prop = new Properties();
        InputStream input = null;
        try {
            input = new FileInputStream(this.getClass().getClassLoader().getResource("user.properties").getFile());
            prop.load(input);

        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        RequestDispatcher rd = servletRequest.getRequestDispatcher("error.jsp");
        System.out.println(request.getRequestURI());
        HttpSession session = request.getSession();

        if (request.getRequestURI().equals("/private/success.jsp")) {
            session.setAttribute("username", servletRequest.getParameter("username"));
            session.setAttribute("password", servletRequest.getParameter("password"));
        }

        if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null)) {
            rd.include(servletRequest, servletResponse);
            System.out.println("in 1st if");
        }

        boolean user1Match = (session.getAttribute("username").equals(prop.get("username1")) && session.getAttribute("password").equals(prop.get("password1")));
        boolean user2Match = (session.getAttribute("username").equals(prop.get("username2")) && session.getAttribute("password").equals(prop.get("password2")));

        if (user1Match || user2Match) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            rd.forward(servletRequest, servletResponse);
        }

        if (request.getRequestURI().equals("/private/page2.jsp")) {
            System.out.println(session.getAttribute("username"));
            if (!user2Match) {
                rd.forward(servletRequest, servletResponse);
            }
        } else if (request.getRequestURI().equals("/private/page1.jsp")) {
            System.out.println(session.getAttribute("username"));

            if (!user1Match) {
                rd.forward(servletRequest, servletResponse);
            }
        }

    }

    public void destroy() {

    }
}
