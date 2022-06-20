package co.za.carolsBoutique.report.service;

import co.za.carolsBoutique.report.model.Report;
import co.za.carolsBoutique.report.model.ReportCriteria;
import co.za.carolsBoutique.report.service.IServiceReport;
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReportRestClient implements IServiceReport{
    //http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/

    public ReportRestClient() {
    }

    @Override
    public List<Report> findTopStoresInTermsOfSales(ReportCriteria rc) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findTopStoresInTermsOfSales";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Report> reports = new ArrayList<>();
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(rc)));
        try {
            reports = (List<Report>) new ObjectMapper().readValue(rep.readEntity(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    @Override
    public List<Report> findHighestRatedStores(ReportCriteria rc) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findHighestRatedStores";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Report> reports = new ArrayList<>();
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(rc)));
        try {
            reports = (List<Report>) new ObjectMapper().readValue(rep.readEntity(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    @Override
    public List<Report> findStoreMonthlySales(ReportCriteria rc) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findStoreMonthlySales";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Report> reports = new ArrayList<>();
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(rc)));
        try {
            reports = (List<Report>) new ObjectMapper().readValue(rep.readEntity(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    @Override
    public List<Report> findTopSellingEmployees(ReportCriteria rc) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findTopSellingEmployees";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Report> reports = new ArrayList<>();
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(rc)));
        try {
            reports = (List<Report>) new ObjectMapper().readValue(rep.readEntity(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    @Override
    public List<Report> findStoreThatAchievedMonthlyTarget(ReportCriteria rc) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findStoreThatAchievedMonthlyTarget";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Report> reports = new ArrayList<>();
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(rc)));
        try {
            reports = (List<Report>) new ObjectMapper().readValue(rep.readEntity(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    @Override
    public List<Report> findTop40Products() {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findTop40Products";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Report> reports = new ArrayList<>();
        try {
            reports = (List<Report>) new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    @Override
    public List<Report> findUnderPerformingStores(ReportCriteria rc) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findUnderPerformingStores";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Report> reports = new ArrayList<>();
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(rc)));
        try {
            reports = (List<Report>) new ObjectMapper().readValue(rep.readEntity(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    @Override
    public Report findTopSalepersonForAProduct(ReportCriteria rc) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findTopSalepersonForAProduct";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        Report reports = null;
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(rc)));
        try {
            reports = new ObjectMapper().readValue(rep.readEntity(String.class), Report.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    @Override
    public Report findCurrentDailySales(ReportCriteria rc) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findCurrentDailySales";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        Report reports = null;
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(rc)));
        try {
            reports = new ObjectMapper().readValue(rep.readEntity(String.class), Report.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
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
