package co.za.carolsBoutique.boutique.service;

import co.za.carolsBoutique.boutique.model.Boutique;
import co.za.carolsBoutique.boutique.model.Review;
import co.za.carolsBoutique.report.service.ReportRestClient;
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
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BoutiqueRestClient implements IServiceBoutique{
    //http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/

    public BoutiqueRestClient() {
    }

    @Override
    public List<Boutique> getAllBoutiques() {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/getAllBoutiques";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Boutique> boutiques = new ArrayList<>();
        try {
            boutiques = (List<Boutique>) new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return boutiques;
    }

    @Override
    public String registerNewBoutique(Boutique boutique) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/register";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(uri))).readEntity(String.class);
    }

    @Override
    public Boutique login(Map<String, String> loginDetails) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/login";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        Boutique boutique = null;
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(loginDetails)));
        try {
            boutique = new ObjectMapper().readValue(rep.readEntity(String.class), Boutique.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(BoutiqueRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return boutique;
    }

    @Override
    public String changePassword(Map<String, String> passwordDetails) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/changePassword";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(passwordDetails))).readEntity(String.class);
    }

    @Override
    public String changeDailyTarget(Map<String, Double> newTarget) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/changePassword";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(newTarget))).readEntity(String.class);
    }

    @Override
    public String rateTheBoutique(Review review) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/rateUs";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(review))).readEntity(String.class);
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
