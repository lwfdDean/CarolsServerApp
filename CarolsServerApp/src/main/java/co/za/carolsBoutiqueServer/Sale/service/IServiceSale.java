package co.za.carolsBoutiqueServer.Sale.service;

import co.za.carolsBoutiqueServer.Sale.model.ExchangeInfo;
import co.za.carolsBoutiqueServer.Sale.model.Sale;
import java.util.List;
import java.util.Map;

public interface IServiceSale {

    String checkout(Sale sale);

    Sale findSale(String saleId);
    
    String refund(Map<String,String> refundInfo);

    public String exchange(ExchangeInfo exchangeInfo);
}
