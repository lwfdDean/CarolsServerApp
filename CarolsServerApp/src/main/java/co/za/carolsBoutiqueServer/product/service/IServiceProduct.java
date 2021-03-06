package co.za.carolsBoutiqueServer.product.service;

import co.za.carolsBoutiqueServer.product.model.Category;
import co.za.carolsBoutiqueServer.product.model.NewProduct;
import co.za.carolsBoutiqueServer.product.model.Product;
import co.za.carolsBoutiqueServer.product.model.PromoCode;
import co.za.carolsBoutiqueServer.product.model.Size;
import java.util.List;
import java.util.Map;

public interface IServiceProduct {
    List<Product> findAllProducts();
    Product findProduct(String productId);
    Product findProduct2(String productId);
    Product findProductBySize(String productCode);
    String putProductOnSale(Map<String,Double>newPrice);
    
    Map<String,String> findStockOfProduct(String productId);
    
    List<Product> SerachForItem(List<String> categoriesId);
    
    List<Category> findAllCategories();
    Category findCategory(String categoryId);
    String addCategory(Category category);
    
    String logStock(NewProduct newProduct);
    
    String addNewPromoCode(PromoCode promoCode);
    PromoCode findPromoCode(String promoCode);
    
    List<Size> findAllSizes();
    
}
