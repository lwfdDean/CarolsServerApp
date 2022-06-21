/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package co.za.carolsboutique.report.servlet;

import co.za.carolsBoutique.report.model.ReportCriteria;
import co.za.carolsBoutique.report.service.IServiceReport;
import co.za.carolsBoutique.report.service.ReportRestClient;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author 27609
 */
@WebServlet(name = "ReportServlet", urlPatterns = {"/ReportServlet"})
public class ReportServlet extends HttpServlet {
      private IServiceReport service;

    public ReportServlet() {
        service = new ReportRestClient();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReportCriteria rc;
        switch (request.getParameter("submit")) {
            case "findTopStoresInTermsOfSales":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("Month")));
                request.setAttribute("findTopStoresInTermsOfSales", service.findTopStoresInTermsOfSales(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;
                
            case "findHighestRatedStores":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("Month")));
                request.setAttribute("findHighestRatedStores", service.findHighestRatedStores(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;
                
            case "findStoreMonthlySales":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("Month")));
                request.setAttribute("findStoreMonthlySales", service.findStoreMonthlySales(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;
                
            case "findTopSellingEmployeesByMonth":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("Month")));
                request.setAttribute("findTopSellingEmployees", service.findTopSellingEmployees(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;
                
            case "findTopSellingEmployeesByBoutique":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("Boutique")));
                request.setAttribute("findTopSellingEmployees", service.findTopSellingEmployees(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;
                
            case "findStoreThatAchievedMonthlyTarget":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("Month")));
                request.setAttribute("findStoreThatAchievedMonthlyTarget", service.findStoreThatAchievedMonthlyTarget(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;
                
            case "findTop40Products":
                request.setAttribute("findTop40Products", service.findTop40Products());
                request.getRequestDispatcher("").forward(request, response);
                break;
                
            case "findUnderPerformingStores":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("Month")));
                request.setAttribute("findUnderPerformingStores", service.findUnderPerformingStores(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;
                
            case "findTopSalepersonForAProduct":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("Product")));
                request.setAttribute("findTopSalepersonForAProduct", service.findTopSalepersonForAProduct(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;
                
            case "findCurrentDailySales":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("Boutique")));
                request.setAttribute("findCurrentDailySales", service.findCurrentDailySales(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


}
