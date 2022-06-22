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
                break;
            case "updateBoutiquePage":
                request.setAttribute("boutique", service.findBoutique(((Employee)request.getSession(false).getAttribute("employee")).getBoutique()));
                request.getRequestDispatcher("updateBoutiqueTargets.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getParameter("submit")) {

            case "updateBoutique":
                Boutique boutique = new Boutique();
                boutique.setId(request.getParameter("id"));
                boutique.setMonthlyTarget(Double.parseDouble(request.getParameter("monthly")));
                boutique.setDailyTarget(Double.parseDouble(request.getParameter("daily")));
                request.setAttribute("reply", service.updateBoutqiue(boutique));
                break;
            
            case "registerNewBoutique":
                Boutique newBoutique = new Boutique();
                newBoutique.setLocation(request.getParameter("location"));
                newBoutique.setDailyTarget(Double.parseDouble(request.getParameter("dailyTarget")));
                newBoutique.setMonthlyTarget(Double.parseDouble(request.getParameter("monthlyTarget")));
                newBoutique.setPassword(request.getParameter("password"));
                service.registerNewBoutique(newBoutique);
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
