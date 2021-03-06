package co.za.carolsBoutiqueServer.product.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @ToString
@AllArgsConstructor
@NoArgsConstructor
public class PromoCode {
    private String code;
    private Double discount;
    private String date;
    private String category;
  
}