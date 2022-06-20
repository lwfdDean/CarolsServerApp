package co.za.carolsboutique.boutique.servlet;

import co.za.carolsBoutique.boutique.service.BoutiqueRestClient;
import co.za.carolsBoutique.boutique.service.IServiceBoutique;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "BoutiqueServlet", urlPatterns = {"/BoutiqueServlet"})
public class BoutiqueServlet extends HttpServlet {
    private IServiceBoutique service;

    public BoutiqueServlet() {
        service = new BoutiqueRestClient();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
    }

}
