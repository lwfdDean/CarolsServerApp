/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package co.za.carolsBoutiqueServer.ReserveProduct.servlet;

import co.za.carolsBoutiqueServer.ReserveProduct.model.Reservedproduct;
import co.za.carolsBoutiqueServer.ReserveProduct.service.IServiceReservedproduct;
import co.za.carolsBoutiqueServer.ReserveProduct.service.ReservedProductRestClient;
import co.za.carolsBoutiqueServer.Sale.model.Sale;
import co.za.carolsBoutiqueServer.employee.model.Employee;
import co.za.carolsBoutiqueServer.product.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "ReserveProductServlet", urlPatterns = {"/ReserveProductServlet"})
public class ReserveProductServlet extends HttpServlet {

    private IServiceReservedproduct service;

    public ReserveProductServlet() {
        service = new ReservedProductRestClient();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            
            case "collectKeepAside":
                Product p = service.collectKeepAside(request.getParameter("customerEmail"));
                Sale sale = new Sale();
                sale.setItems(List.of(p));
                request.getSession(false).setAttribute("sale", sale);
                request.getRequestDispatcher("newSale.jsp").forward(request, response);
                break;
                
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "makeReservedProduct":
                Reservedproduct reservedproduct = new Reservedproduct();
                reservedproduct.setBoutiqueId(((Employee) request.getSession(false).getAttribute("employee")).getBoutique());
                reservedproduct.setCustomerEmail(request.getParameter("customerEmail"));
                reservedproduct.setDate(LocalDateTime.now());
                reservedproduct.setProductCode(request.getParameter("productCode"));
                request.setAttribute("reply", service.makeReserveProduct(reservedproduct));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;

            case "collectKeepAside":
                String customerEmail = request.getParameter("customerEmail");
                request.setAttribute("product", service.collectKeepAside(customerEmail));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
                
            default:
                throw new AssertionError();
        }
    }

}
