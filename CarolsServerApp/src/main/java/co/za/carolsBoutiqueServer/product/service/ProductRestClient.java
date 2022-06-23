package co.za.carolsBoutiqueServer.product.service;

import co.za.carolsBoutiqueServer.Sale.service.SaleRestClient;
import co.za.carolsBoutiqueServer.product.model.Category;
import co.za.carolsBoutiqueServer.product.model.NewProduct;
import co.za.carolsBoutiqueServer.product.model.Product;
import co.za.carolsBoutiqueServer.product.model.PromoCode;
import co.za.carolsBoutiqueServer.product.model.Size;
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

public class ProductRestClient implements IServiceProduct{
    //http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/

    @Override
    public List<Product> findAllProducts() {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findAllProducts";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Product> products = new ArrayList<>();
        try {
            products = (List<Product>) new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    @Override
    public Product findProduct(String productId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findProduct/{productId}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("productId", productId);
        Product product = null;
        try {
            product = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class),Product.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(SaleRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    @Override
    public Product findProductBySize(String productCode) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findProductBySize/{productCode}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("productCode", productCode);
        Product product = null;
        try {
            product = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class),Product.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(SaleRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    @Override
    public String putProductOnSale(Map<String, Double> newPrice) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/putProductOnSale";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(newPrice))).readEntity(String.class);
    }

    @Override
    public String logStock(NewProduct newProduct) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/logStock";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(newProduct))).readEntity(String.class);
    }
    
    @Override
    public Map<String, String> findStockOfProduct(String productId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product//findAvailableStock/{productId}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        Map<String, String> rep = new HashMap<>();
        try {
            rep = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), Map.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ProductRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rep;
    }

    @Override
    public List<Product> SerachForItem(List<String> categoriesId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/SearchForItem";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Product> prods = new ArrayList<>();
        Response rep = webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(categoriesId)));
        try {
            prods = (List<Product>) new ObjectMapper().readValue(rep.readEntity(String.class), TypeReference.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ProductRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prods;
    }

    @Override
    public List<Category> findAllCategories() {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findAllCategories";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Category> cates = new ArrayList<>();
        try {
            cates = Arrays.asList(new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), Category[].class));
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cates;
    }

    @Override
    public Category findCategory(String categoryId) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findCategory/{categoryId}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("categoryId", categoryId);
        Category cate = null;
        try {
            cate = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class),Category.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(SaleRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cate;
    }

    @Override
    public String addCategory(Category category) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/addCategory";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(category))).readEntity(String.class);
    }

    @Override
    public String addNewPromoCode(PromoCode promoCode) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/addNewPromoCode";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        return webT.request(MediaType.APPLICATION_JSON).post(Entity.json(toJsonString(promoCode))).readEntity(String.class);
    }

    @Override
    public PromoCode findPromoCode(String promoCode) {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findPromoCode/{promocode}";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri).resolveTemplate("promocode", promoCode);
        PromoCode pc = null;
        try {
            pc = new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class),PromoCode.class);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(SaleRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pc;
    }
    
    private String toJsonString(Object o){
        try {
            return new ObjectMapper().writeValueAsString(o);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ProductRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Size> findAllSizes() {
        String uri = "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findAllSizes";
        Client client = ClientBuilder.newClient();
        WebTarget webT = client.target(uri);
        List<Size> sizes = new ArrayList<>();
        try {
            sizes = Arrays.asList(new ObjectMapper().readValue(webT.request(MediaType.APPLICATION_JSON).get(String.class), Size[].class));
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReportRestClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sizes;
    }
}
