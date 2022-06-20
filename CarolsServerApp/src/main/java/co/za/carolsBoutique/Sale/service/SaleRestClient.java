package co.za.carolsBoutique.Sale.service;

import co.za.carolsBoutique.Sale.model.ExchangeInfo;
import co.za.carolsBoutique.Sale.model.Sale;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SaleRestClient implements IServiceSale{
    //http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/sale/

    @Override
    public String checkout(Sale sale) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/sale/checkout";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(sale))).readEntity(String.class);
    }

    @Override
    public Sale findSale(String saleId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/sale/findSale/{saleId}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("saleId", saleId);
        Sale sale = null;
        try {
            sale = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class),Sale.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(SaleRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sale;
    }

    @Override
    public String refund(Map<String, String> refundInfo) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/sale/refund";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(refundInfo))).readEntity(String.class);
    }

    @Override
    public String exchange(ExchangeInfo exchangeInfo) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/sale/exchange";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(exchangeInfo))).readEntity(String.class);
    }
    
    private String toJsonString(Object o){
        try {
            return new ObjectMapper().writeValueAsString(o);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(SaleRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
