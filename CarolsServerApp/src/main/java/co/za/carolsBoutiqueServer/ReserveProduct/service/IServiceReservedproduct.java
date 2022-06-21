package co.za.carolsBoutiqueServer.ReserveProduct.service;

import co.za.carolsBoutiqueServer.ReserveProduct.model.Reservedproduct;
import co.za.carolsBoutiqueServer.product.model.Product;

public interface IServiceReservedproduct {
    String makeReserveProduct(Reservedproduct reserveProduct);
    Product collectKeepAside(String customerEmail);
}
