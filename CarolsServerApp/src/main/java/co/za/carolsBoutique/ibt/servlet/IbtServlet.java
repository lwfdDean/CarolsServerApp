package co.za.carolsboutique.ibt.servlet;

import co.za.carolsBoutique.employee.model.Employee;
import co.za.carolsBoutique.ibt.model.IBT;
import co.za.carolsBoutique.ibt.service.IBTRestClient;
import co.za.carolsBoutique.ibt.service.IServiceIBT;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "IbtServlet", urlPatterns = {"/IbtServlet"})
public class IbtServlet extends HttpServlet {
    private IServiceIBT service;

    public IbtServlet() {
        service = new IBTRestClient();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        switch(request.getParameter("submit")){
            case "getIBT":
                request.setAttribute("IBT", service.getIBT(request.getParameter("ibtId")));
                request.getRequestDispatcher("").forward(request, response);
                break;
            case "getStoreIBTs":
                request.setAttribute("ibts", service.findStoreIBTS(((Employee)request.getSession().getAttribute("employee")).getBoutique()));
                request.getRequestDispatcher("").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        switch(request.getParameter("submit")){
            case "requestIBT":
                IBT ibt = new IBT();
                ibt.setApproved(false);
                ibt.setCustomerEmail(request.getParameter("customerEmail"));
                ibt.setRequestingBoutique(((Employee)request.getSession().getAttribute("employee")).getBoutique());
                ibt.setApprovingBoutique(request.getParameter("boutique"));
                ibt.setProductCode(request.getParameter("product"));
                request.setAttribute("reply", service.requestIBT(ibt));
                request.getRequestDispatcher("").forward(request, response);
                break;
            case "approveIBT":
                Map<String,Boolean> details = new HashMap<>();
                details.put(request.getParameter("ibtId"), Boolean.parseBoolean(request.getParameter("approed")));
                request.setAttribute("reply", service.approveIBT(details));
                request.getRequestDispatcher("").forward(request, response);
        }
    }
}
