package co.za.carolsBoutiqueServer.report.servlet;

import co.za.carolsBoutiqueServer.employee.model.Employee;
import co.za.carolsBoutiqueServer.report.model.ReportCriteria;
import co.za.carolsBoutiqueServer.report.service.IServiceReport;
import co.za.carolsBoutiqueServer.report.service.ReportRestClient;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ReportServlet", urlPatterns = {"/ReportServlet"})
public class ReportServlet extends HttpServlet {

    private IServiceReport service;

    public ReportServlet() {
        service = new ReportRestClient();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "findTop40Products":
                request.setAttribute("findTop40Products", service.findTop40Products());
                request.getRequestDispatcher("").forward(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReportCriteria rc = null;
        switch (request.getParameter("submit")) {

            case "findTopStores":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("month")));
                rc.setResults(Integer.parseInt(request.getParameter("result")));
                if (request.getParameter("type").equals("sale")) {
                    request.setAttribute("reportList", service.findTopStoresInTermsOfSales(rc));

                } else {
                    request.setAttribute("reportList", service.findHighestRatedStores(rc));
                }
                request.getRequestDispatcher("topAchievingReport.jsp").forward(request, response);
                break;

            case "findStoreMonthlySales":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("month")));
                rc.setBoutique(request.getParameter("boutiqueId"));
                request.setAttribute("findStoreMonthlySales", service.findStoreMonthlySales(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;

            case "findTopSellingEmployees":
                rc = new ReportCriteria();
                rc.setBoutique(request.getParameter("boutique"));
                rc.setMonth(Integer.parseInt(request.getParameter("month")));
                rc.setResults(Integer.parseInt(request.getParameter("result")));
                request.setAttribute("findTopSellingEmployees", service.findTopSellingEmployees(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;

            case "findStoreThatAchievedMonthlyTarget":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("month")));
                rc.setResults(Integer.parseInt(request.getParameter("result")));
                request.setAttribute("findStoreThatAchievedMonthlyTarget", service.findStoreThatAchievedMonthlyTarget(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;

            case "findUnderPerformingStores":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("month")));
                rc.setResults(Integer.parseInt(request.getParameter("result")));
                request.setAttribute("findUnderPerformingStores", service.findUnderPerformingStores(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;

            case "findTopSalepersonForAProduct":
                rc = new ReportCriteria();
                rc.setProduct(request.getParameter("product"));
                request.setAttribute("findTopSalepersonForAProduct", service.findTopSalepersonForAProduct(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;

            case "findCurrentDailySales":
                rc = new ReportCriteria();
                rc.setMonth(Integer.parseInt(request.getParameter("boutique")));
                request.setAttribute("findCurrentDailySales", service.findCurrentDailySales(rc));
                request.getRequestDispatcher("").forward(request, response);
                break;
        }
    }
}
