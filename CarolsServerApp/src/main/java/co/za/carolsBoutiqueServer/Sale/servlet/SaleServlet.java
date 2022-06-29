package co.za.carolsBoutiqueServer.Sale.servlet;

import co.za.carolsBoutiqueServer.Sale.model.ExchangeInfo;
import co.za.carolsBoutiqueServer.Sale.model.Sale;
import co.za.carolsBoutiqueServer.Sale.service.IServiceSale;
import co.za.carolsBoutiqueServer.Sale.service.SaleRestClient;
import co.za.carolsBoutiqueServer.employee.model.Employee;
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
    private String saleId;
    private IServiceSale service;

    public SaleServlet() {
        service = new SaleRestClient();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "newSalePage":
                Sale sale = new Sale(((Employee)request.getSession(false).getAttribute("employee")).getId(),
                        ((Employee)request.getSession(false).getAttribute("employee")).getBoutique());
                request.getSession(false).setAttribute("sale", sale);
                request.getRequestDispatcher("newsale.jsp").forward(request, response);
                break;
            case "findSale":
                saleId = request.getParameter("saleId");
                request.setAttribute("sale", service.findSale(saleId));
                request.setAttribute("saleId", saleId);
                request.getRequestDispatcher("exchange.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "checkout":
                Sale sale = (Sale) request.getSession(false).getAttribute("sale");
                sale.setApproved(false);
                sale.setCardNumber(request.getParameter("card"));
                sale.setCustomerEmail(request.getParameter("email"));
                request.setAttribute("reply", service.checkout(sale));
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
                System.out.println("vheck hit the the exchange in servlet");
                ei.setCustomerEmail(request.getParameter("emailAddress"));
                ei.setNewProductId(request.getParameter("newProduct"));
                ei.setReturnedProductId(request.getParameter("oldProduct"));
                ei.setSaleId(saleId);//how are we going to get the sale instance
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
