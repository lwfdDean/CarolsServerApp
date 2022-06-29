/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package co.za.carolsBoutiqueServer.ReserveProduct.servlet;

import co.za.carolsBoutiqueServer.ReserveProduct.model.Reservedproduct;
import co.za.carolsBoutiqueServer.ReserveProduct.service.IServiceReservedproduct;
import co.za.carolsBoutiqueServer.ReserveProduct.service.ReservedProductRestClient;
import co.za.carolsBoutiqueServer.employee.model.Employee;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

@WebServlet(name = "ReserveProductServlet", urlPatterns = {"/ReserveProductServlet"})
public class ReserveProductServlet extends HttpServlet {

    private IServiceReservedproduct service;

    public ReserveProductServlet() {
        service = new ReservedProductRestClient();
    }

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        switch (request.getParameter("submit")) {
//            
//            case "Collect Keep Aside":
//                String customerEmail = request.getParameter("customerEmail");
//                request.setAttribute("product", service.collectKeepAside(customerEmail));
//                request.getRequestDispatcher("home.jsp").forward(request, response);
//                break;
//                
//            default:
//                throw new AssertionError();
//        }
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "Make Reserved Product":
                Reservedproduct reservedproduct = new Reservedproduct();
                System.out.println(((Employee) request.getSession(false).getAttribute("employee")).getBoutique());
                reservedproduct.setBoutiqueId(((Employee) request.getSession(false).getAttribute("employee")).getBoutique());
                reservedproduct.setCustomerEmail(request.getParameter("customerEmail"));
                reservedproduct.setDate(LocalDateTime.now());
                reservedproduct.setProductCode(request.getParameter("productCode"));
                String s = service.makeReserveProduct(reservedproduct);
                request.setAttribute("reply", service.makeReserveProduct(reservedproduct));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
                
             case "Collect Keep Aside":
                String customerEmail = request.getParameter("customerEmail");
                request.setAttribute("product", service.collectKeepAside(customerEmail));
                request.setAttribute("reply", "Keep aside collected");
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;

            default:
                throw new AssertionError();
        }
    }

}
