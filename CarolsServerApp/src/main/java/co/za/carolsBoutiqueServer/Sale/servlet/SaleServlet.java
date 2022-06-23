package co.za.carolsBoutiqueServer.Sale.servlet;

import co.za.carolsBoutiqueServer.Sale.model.ExchangeInfo;
import co.za.carolsBoutiqueServer.Sale.model.Sale;
import co.za.carolsBoutiqueServer.Sale.service.IServiceSale;
import co.za.carolsBoutiqueServer.Sale.service.SaleRestClient;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SaleServlet", urlPatterns = {"/SaleServlet"})
public class SaleServlet extends HttpServlet {

    private IServiceSale service;

    public SaleServlet() {
        service = new SaleRestClient();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "newSalePage":
                Sale sale = new Sale();
                sale.setItems(new ArrayList<>());
                request.getSession(false).setAttribute("sale", sale);
                request.getRequestDispatcher("newsale.jsp").forward(request, response);
                break;
            case "findSale":
                request.setAttribute("sale", service.findSale(request.getParameter("saleId")));
                request.getRequestDispatcher("sale.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "checkout":
                request.setAttribute("reply", service.checkout((Sale) request.getSession().getAttribute("sale")));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            case "refund":
                Map<String, String> refundInfo = new HashMap<>();
                refundInfo.put(request.getParameter("saleId"), request.getParameter("product"));
                request.setAttribute("refundReply", service.refund(refundInfo));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            case "exchange":
                ExchangeInfo ei = new ExchangeInfo();
                ei.setCustomerEmail(request.getParameter("email"));
                ei.setNewProductId(request.getParameter("newProduct"));
                ei.setReturnedProductId(request.getParameter("oldProduct"));
                ei.setReturnedProductId(((Sale) request.getSession().getAttribute("sale")).getId());//how are we going to get the sale instance
                ei.setPrice(Double.parseDouble(request.getParameter("price")));
                request.setAttribute("exchangeReply", service.exchange(ei));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
        }

    }

//    private void startBarCodeScanner(String barcode) {
//        new Thread(new Runnable() {
//            @Override
//            public void run() {
//                java.awt.EventQueue.invokeLater(new Runnable() {
//                    @Override
//                    public void run() {
//                        new BarCodeScanner(barcode);
//                    }
//                });
//            }
//        }).start();
//
//    }
}
