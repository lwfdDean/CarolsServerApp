package co.za.carolsBoutiqueServer.ReserveProduct.service;

import co.za.carolsBoutiqueServer.ReserveProduct.model.Reservedproduct;
import co.za.carolsBoutiqueServer.product.model.Product;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReservedProductRestClient implements IServiceReservedproduct{
    //http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/KeepAside/

    @Override
    public String makeReserveProduct(Reservedproduct reserveProduct) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/KeepAside/addKeepAside";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        reserveProduct.setDate(null);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(reserveProduct))).readEntity(String.class);
    }
    
    @Override
    public Product collectKeepAside(String customerEmail) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/KeepAside/findKeepAside/{email}";
        Client client = ClientBuilder.newClient();
        System.out.println(customerEmail);
        WebTarget webT = client.target(uri).resolveTemplate("email", customerEmail);
        Product product = null;
        try {
            product = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), Product.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReservedProductRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    
    private String toJsonString(Object o){
        try {
            return new ObjectMapper().writeValueAsString(o);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReservedProductRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
