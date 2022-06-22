package co.za.carolsBoutiqueServer.employee.service;

import co.za.carolsBoutiqueServer.employee.model.Employee;
import co.za.carolsBoutiqueServer.employee.model.Role;
import co.za.carolsBoutiqueServer.report.service.ReportRestClient;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmployeeRestClient implements IServiceEmployee{
    //http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/

    public EmployeeRestClient() {
        
    }

    @Override
    public Employee login(Map<String, String> loginDetails) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/login";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        System.out.println("hello");
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(loginDetails)));
        Employee e = null;
        try {
            System.out.println("Hello2");
            System.out.println(rep);
            String a = rep.readEntity(String.class);
            System.out.println(a);
            e = new ObjectMapper().readValue(a, Employee.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(EmployeeRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }

    @Override
    public String register(Employee employee) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/register";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(employee))).readEntity(String.class);
    }

    @Override
    public String promoteToTeller(List<String> employeeDetails) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/promoteToTeller";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(employeeDetails))).readEntity(String.class);
    }

    @Override
    public String promoteToManager(List<String> employeeDetails) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/promoteToManager";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(employeeDetails))).readEntity(String.class);
    }

    @Override
    public List<Employee> getAllEmployees(String boutiqueId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/getAllEmployees/{boutiqueId}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("boutiqueId", boutiqueId);
        List<Employee> emps = new ArrayList<>();
        try {
            emps = (List<Employee>) new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(EmployeeRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emps;
    }

    @Override
    public List<Employee> getAllByRole(String roleId, String boutiqueId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/getAllByRole/{roleId}/{boutiqueId}";
        Client client = ClientBuilder.newClient();
        Map<String,Object> info = new HashMap<>();
        info.put("roleId", roleId);
        info.put("boutiqueId", boutiqueId);
        WebTarget webT = client.target(uri).resolveTemplates(info);
        List<Employee> emps = new ArrayList<>();
        try {
            emps = (List<Employee>) new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(EmployeeRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emps;
    }

    @Override
    public String removeemployee(String employeeId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Role> getAllRoles() {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/getAllRoles";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Role> emps = new ArrayList<>();
        try {
            emps = Arrays.asList(new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), Role[].class));
        } catch (JsonProcessingException ex) {
            Logger.getLogger(EmployeeRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emps;
    }

    @Override
    public Role getRole(String roleId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/getRole/{roleId}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("roleId", roleId);
        Role role = null;
        try {
            role = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), Role.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(EmployeeRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return role;
    }

    @Override
    public String addRole(Role role) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/addRole";//No end Point, dont use this method
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(role))).readEntity(String.class);
    }

    @Override
    public String verifyManagerCode(Map<String, String> managerCode) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/verifyManagerCode";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(managerCode))).readEntity(String.class);
    }
 
    private String toJsonString(Object o){
        try {
            return new ObjectMapper().writeValueAsString(o);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
