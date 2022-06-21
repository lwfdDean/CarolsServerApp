package co.za.carolsBoutiqueServer.ibt.service;

import co.za.carolsBoutiqueServer.ibt.model.IBT;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class IBTRestClient implements IServiceIBT {
    //http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/ibt/

    @Override
    public String requestIBT(IBT ibt) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/ibt/requestIBT";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(ibt))).readEntity(String.class);
    }

    @Override
    public IBT getIBT(String ibtId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/ibt/getIBT/{ibtId}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("ibtId", ibtId);
        IBT ibt = null;
        try {
            ibt = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), IBT.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(IBTRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ibt;
    }

    @Override
    public List<IBT> findStoreIBTS(String storeId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/ibt/findStoreIBTS/{storeId}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("storeId", storeId);
        List<IBT> ibts = new ArrayList<>();
        try {
            ibts = (List<IBT>) new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(IBTRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ibts;
    }

    @Override
    public String approveIBT(Map<String, Boolean> approvedIBT) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/ibt//approveIBT";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(approvedIBT))).readEntity(String.class);
    }

    private String toJsonString(Object o) {
        try {
            return new ObjectMapper().writeValueAsString(o);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(IBTRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
