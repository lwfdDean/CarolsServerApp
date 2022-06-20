package co.za.carolsboutique.Sale.servlet;

import co.za.carolsBoutique.Sale.model.ExchangeInfo;
import co.za.carolsBoutique.Sale.model.Sale;
import co.za.carolsBoutique.Sale.service.IServiceSale;
import co.za.carolsBoutique.Sale.service.SaleRestClient;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SaleServlet", urlPatterns = {"/SaleServlet"})
public class SaleServlet extends HttpServlet {
    private IServiceSale service;

    public SaleServlet() {
        service = new SaleRestClient();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "newSalePage":
                request.getSession().setAttribute("sale", new Sale());
            case "findSale":
                request.setAttribute("sale", service.findSale(request.getParameter("saleId")));
                request.getRequestDispatcher("sale.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "checkout":
                request.setAttribute("reply", service.checkout((Sale)request.getSession().getAttribute("sale")));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            case "refund":
                Map<String,String> refundInfo = new HashMap<>();
                refundInfo.put(request.getParameter("saleId"), request.getParameter("product"));
                request.setAttribute("reply", service.refund(refundInfo));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            case "exchange":
                ExchangeInfo ei = new ExchangeInfo();
                ei.setCustomerEmail(request.getParameter("email"));
                ei.setNewProductId(request.getParameter("newProduct"));
                ei.setReturnedProductId(request.getParameter("oldProduct"));
                ei.setReturnedProductId(((Sale)request.getSession().getAttribute("sale")).getId());
                ei.setPrice(Double.parseDouble(request.getParameter("price")));
                request.setAttribute("reply", service.exchange(ei));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
        }
        
    }
}
