package co.za.carolsBoutique.context;

import co.za.carolsBoutique.boutique.service.BoutiqueRestClient;
import co.za.carolsBoutique.boutique.service.IServiceBoutique;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ServerContext implements ServletContextListener{

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Server Shutdown");
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Server Starting");
        ServletContext sc = sce.getServletContext();
        IServiceBoutique service = new BoutiqueRestClient();
        sc.setAttribute("boutiques", service.getAllBoutiques());
    }
    
    
}
