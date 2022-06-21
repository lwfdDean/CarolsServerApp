package co.za.carolsBoutiqueServer.employee.servlet;

import co.za.carolsBoutiqueServer.boutique.model.Boutique;
import co.za.carolsBoutiqueServer.employee.model.Employee;
import co.za.carolsBoutiqueServer.employee.model.Role;
import co.za.carolsBoutiqueServer.employee.service.EmployeeRestClient;
import co.za.carolsBoutiqueServer.employee.service.IServiceEmployee;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/EmployeeServlet"})
public class EmployeeServlet extends HttpServlet {
    private IServiceEmployee service;

    public EmployeeServlet() {
        service = new EmployeeRestClient();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "getAllEmployees":
                request.setAttribute("employees", service.getAllEmployees(
                        ((Boutique)request.getSession().getAttribute("boutique")).getId()));
                request.getRequestDispatcher("").forward(request, response);
                break;
            case "getAllByRole":    
                request.setAttribute("employees", service.getAllByRole(request.getParameter("roleId"), 
                        ((Boutique)request.getSession().getAttribute("boutique")).getId()));
                request.getRequestDispatcher("").forward(request, response);
                break;  
            case "getAllRoles":    
                request.setAttribute("roles", service.getAllRoles());
                request.getRequestDispatcher("").forward(request, response);
                break;  
            case "getRole":    
                request.setAttribute("role", service.getRole(request.getParameter("roleId")));
                request.getRequestDispatcher("").forward(request, response);
                break;  
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "Login":
                Map<String,String> loginDetails = new HashMap<>();
                loginDetails.put(request.getParameter("id"), request.getParameter("password"));
                Employee employee = service.login(loginDetails);
                if (employee!=null) {
                    request.getSession().setAttribute("employee", employee);
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }else{
                    request.getSession().setAttribute("reply", "employee not found");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                break;
            case "register":    
                Role role = service.getRole(request.getParameter("roleId"));
                String managerCode = (!role.getName().equals("Manager"))?
                        "zyshdtgeiamdof84264ef":
                        request.getParameter("managerCode");
                String password = (!role.getName().equals("Teller"))?
                        "wihnnceqnw874hfquncvqphj984":
                        request.getParameter("password");
                Employee employee1 = new Employee();
                employee1.setName(request.getParameter("name"));
                employee1.setSurname(request.getParameter("surname"));
                employee1.setEmailAddress(request.getParameter("email"));
                employee1.setPassword(password);
                employee1.setManagerCode(managerCode);
                employee1.setRole(role);
                employee1.setBoutique(((Boutique)request.getSession().getAttribute("boutique")).getId());
                String reply = service.register(employee1);
                request.setAttribute("reply", reply);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            case "promoteToTeller":    
                List<String> employeeDetails = new ArrayList<>();
                employeeDetails.add(request.getParameter("employeeId"));
                employeeDetails.add(request.getParameter("password"));
                employeeDetails.add(request.getParameter("roleId"));
                request.setAttribute("reply", service.promoteToTeller(employeeDetails));
                break;
            case "promoteToManager":
                List<String> empDetails = new ArrayList<>();
                empDetails.add(request.getParameter("employeeId"));
                empDetails.add(request.getParameter("managerCode"));
                empDetails.add(request.getParameter("roleId"));
                request.setAttribute("reply", service.promoteToTeller(empDetails));
                break;  
            case "addRole":    
                Role role1 = new Role();
                role1.setId(request.getParameter("roleId"));
                role1.setName(request.getParameter("name"));
                role1.setAuthorizationLevel(Integer.parseInt(request.getParameter("authLvl")));
                break; 
            case "verifyManagerCode": 
                Map<String,String> details = new HashMap<>();
                details.put(((Employee)request.getSession().getAttribute("employee")).getBoutique(), request.getParameter("managerCode"));
                request.setAttribute("reply", service.verifyManagerCode(details));
                request.getRequestDispatcher("").forward(request, response);
                break;    
        }
    }
}