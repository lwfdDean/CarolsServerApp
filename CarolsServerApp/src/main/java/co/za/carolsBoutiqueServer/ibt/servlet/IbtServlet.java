package co.za.carolsBoutiqueServer.ibt.servlet;

import co.za.carolsBoutiqueServer.employee.model.Employee;
import co.za.carolsBoutiqueServer.ibt.model.IBT;
import co.za.carolsBoutiqueServer.ibt.service.IBTRestClient;
import co.za.carolsBoutiqueServer.ibt.service.IServiceIBT;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
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
                request.setAttribute("IBT", service.getIBT(request.getParameter("selectIbt")));
                request.getRequestDispatcher("IBTDetails.jsp").forward(request, response);
                break;
            case "getBoutiqueIbts":
                Employee emp = (Employee)request.getSession(false).getAttribute("employee");
                if (emp.getRole().getAuthorizationLevel()==3) {
                    request.setAttribute("ibtlist", service.findStoreIBTS(emp.getBoutique()));
                    request.getRequestDispatcher("IBTList.jsp").forward(request, response);
                }else{
                    request.setAttribute("reply","you are not authorized to access this page");
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
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
                ibt.setRequestingBoutique(((Employee)request.getSession(false).getAttribute("employee")).getBoutique());
                ibt.setApprovingBoutique(request.getParameter("boutique"));
                ibt.setProductCode(request.getParameter("product"));
                request.setAttribute("reply", service.requestIBT(ibt));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            case "approveIBT":
                Map<String,Boolean> approved = new HashMap<>();
                approved.put(request.getParameter("id"), true);
                request.setAttribute("reply", service.approveIBT(approved));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
        }
    }
}
