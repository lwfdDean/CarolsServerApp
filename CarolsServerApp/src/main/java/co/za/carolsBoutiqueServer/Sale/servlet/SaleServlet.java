package co.za.carolsBoutiqueServer.Sale.servlet;

import co.za.carolsBoutiqueServer.Sale.model.ExchangeInfo;
import co.za.carolsBoutiqueServer.Sale.model.Sale;
import co.za.carolsBoutiqueServer.Sale.service.IServiceSale;
import co.za.carolsBoutiqueServer.Sale.service.SaleRestClient;
import co.za.carolsBoutiqueServer.employee.model.Employee;
import co.za.carolsBoutiqueServer.product.model.Product;
import co.za.carolsBoutiqueServer.product.model.refundedProduct;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
                Sale sale = new Sale(((Employee)request.getSession(false).getAttribute("employee")).getId(),
                        ((Employee)request.getSession(false).getAttribute("employee")).getBoutique());
                request.getSession(false).setAttribute("sale", sale);
                request.getRequestDispatcher("newsale.jsp").forward(request, response);
                break;
            case "findSale":
                String saleId = request.getParameter("saleId");
                request.setAttribute("sale", service.findSale(saleId));
                request.setAttribute("saleId", saleId);
                request.getRequestDispatcher("exchange.jsp").forward(request, response);
                break;
            case "findSaleInfo":
                saleId = request.getParameter("saleId");
                request.setAttribute("sale", service.findSale(saleId));
                request.setAttribute("saleId", saleId);
                request.getRequestDispatcher("refund.jsp").forward(request, response);
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
                refundedProduct refundInfo = new refundedProduct();
                refundInfo.setSaleId(request.getParameter("saleId"));
                refundInfo.setCardNumber(request.getParameter("cardNumber"));
                refundInfo.setCustomerEmail(request.getParameter("customerEmail"));
                refundInfo.setRefundProductId(request.getParameter("product"));
                Sale saleInf = service.findSale(refundInfo.getSaleId());
                saleInf.setCustomerEmail(refundInfo.getCustomerEmail());
                saleInf.setCardNumber(refundInfo.getCardNumber());
                request.setAttribute("sale", saleInf);
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
