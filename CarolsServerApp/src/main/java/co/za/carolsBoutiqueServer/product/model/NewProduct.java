package co.za.carolsBoutiqueServer.product.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @ToString
@AllArgsConstructor
@NoArgsConstructor
public class NewProduct {
    private StockEntry stockEntry;
    private Product product;
    private Boolean newProduct;
}
