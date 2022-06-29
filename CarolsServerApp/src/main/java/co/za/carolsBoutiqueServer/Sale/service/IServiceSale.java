package co.za.carolsBoutiqueServer.Sale.service;

import co.za.carolsBoutiqueServer.Sale.model.ExchangeInfo;
import co.za.carolsBoutiqueServer.Sale.model.Sale;
import co.za.carolsBoutiqueServer.product.model.refundedProduct;
import java.util.List;
import java.util.Map;

public interface IServiceSale {

    String checkout(Sale sale);

    Sale findSale(String saleId);
    
    String refund(refundedProduct refundInfo);

    public String exchange(ExchangeInfo exchangeInfo);
}
