package co.za.carolsBoutiqueServer.boutique.servlet;

import co.za.carolsBoutiqueServer.boutique.model.Boutique;
import co.za.carolsBoutiqueServer.boutique.model.Review;
import co.za.carolsBoutiqueServer.boutique.service.BoutiqueRestClient;
import co.za.carolsBoutiqueServer.boutique.service.IServiceBoutique;
import co.za.carolsBoutiqueServer.employee.model.Employee;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "BoutiqueServlet", urlPatterns = {"/BoutiqueServlet"})
public class BoutiqueServlet extends HttpServlet {

    private IServiceBoutique service;

    public BoutiqueServlet() {
        service = new BoutiqueRestClient();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "getAll":
                request.setAttribute("boutiques", service.getAllBoutiques());
                request.getRequestDispatcher("").forward(request, response);
                break;
            case "changeBoutiqueDailyTargetPage":
                Employee emp = (Employee)request.getSession(false).getAttribute("employee");
                if (emp.getRole().getAuthorizationLevel()==3) {
                    //request.setAttribute("boutique", service.getBoutiques(emp.getBoutique()));
                    //request.getRequestDispatcher("")
                }else{
                    
                }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getParameter("submit")) {

            case "registerNewBoutique":
                Boutique newBoutique = new Boutique();
                newBoutique.setLocation(request.getParameter("location"));
                newBoutique.setDailyTarget(Double.parseDouble(request.getParameter("DailyTarget")));
                newBoutique.setMonthlyTarget(Double.parseDouble(request.getParameter("monthlyTarget")));
                newBoutique.setPassword(request.getParameter("password"));
                service.registerNewBoutique(newBoutique);
                request.getRequestDispatcher("index.jsp").forward(request, response);

                break;

            case "changePassword":
                Map<String, String> newPassword = new HashMap<>();
                Employee emp = (Employee) request.getSession().getAttribute("employee");
                String password = request.getParameter("password");
                newPassword.put(emp.getBoutique(), password);
                request.setAttribute("reply", service.changePassword(newPassword));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;

            case "changeDailyTarget":
                Map<String, Double> newDailyTarget = new HashMap<>();
                emp = (Employee) request.getSession().getAttribute("employee");
                Double newTarget = Double.parseDouble(request.getParameter("newDailyTarget"));
                newDailyTarget.put(emp.getBoutique(), newTarget);
                if (newTarget > 15000) {
                    request.setAttribute("reply", service.changeDailyTarget(newDailyTarget));
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                } else {
                    request.setAttribute("reply", "The new daily target must exceed 15000 or the value input is incorrect");
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
                break;

            case "changeMonthlyTarget":
                Map<String, Double> newMonthlyTarget = new HashMap<>();
                emp = (Employee) request.getSession().getAttribute("employee");
                Double newMonthTarget = Double.parseDouble(request.getParameter("newDailyTarget"));
                newMonthlyTarget.put(emp.getBoutique(), newMonthTarget);
                if (newMonthTarget > 450000) {
                    request.setAttribute("reply", service.changeDailyTarget(newMonthlyTarget));
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                } else {
                    request.setAttribute("reply", "The new daily target must exceed 450000 or the value input is incorrect");
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
                break;
////////////////////////////////////////////////////////////////////////////////////////
            case "rateStore"://How would we get the boutique ID/////////////////////////
                Review review = new Review();
                review.setBoutique("");
                review.setComment(request.getParameter("review"));
                review.setContactMethod(request.getParameter("contactMethod"));
                request.setAttribute("reply", service.rateTheBoutique(review));
                request.getRequestDispatcher("").forward(request, response);//where do we send the client after leaving a review
                break;
            default:
                throw new AssertionError();
        }
    }

}
