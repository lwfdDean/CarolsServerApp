package co.za.carolsBoutiqueServer.boutique.service;

import co.za.carolsBoutiqueServer.boutique.model.Boutique;
import co.za.carolsBoutiqueServer.boutique.model.Review;
import co.za.carolsBoutiqueServer.report.service.ReportRestClient;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
            boutiques = Arrays.asList(new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), Boutique[].class));
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
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(boutique))).readEntity(String.class);
    }
 
    @Override
    public String updateBoutqiue(Boutique boutique) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/updateBoutique";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(boutique))).readEntity(String.class);
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

    @Override
    public Boutique findBoutique(String boutiqueId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/findBoutqiue/{boutiqueId}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("boutiqueId", boutiqueId);
        Boutique boutique = null;
        try {
            boutique = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), Boutique.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(BoutiqueRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return boutique;
    }

}
