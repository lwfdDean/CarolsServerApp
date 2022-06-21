/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package co.za.carolsboutique.product.servlet;

import co.za.carolsBoutique.employee.model.Employee;
import co.za.carolsBoutique.product.model.Category;
import co.za.carolsBoutique.product.model.NewProduct;
import co.za.carolsBoutique.product.model.Product;
import co.za.carolsBoutique.product.model.PromoCode;
import co.za.carolsBoutique.product.model.StockEntry;
import co.za.carolsBoutique.product.service.IServiceProduct;
import co.za.carolsBoutique.product.service.ProductRestClient;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author 27609
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {
    
    private IServiceProduct service;
    
    public ProductServlet() {
        service = new ProductRestClient();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "findAllProducts":
                request.setAttribute("products", service.findAllProducts());
                request.getRequestDispatcher("").forward(request, response);//which page must the user be forwarded to?
                break;
                
            case "findAllCategories":
                request.setAttribute("products", service.findAllCategories());
                request.getRequestDispatcher("").forward(request, response);//which page must the user be forwarded to?
            default:
                throw new AssertionError();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("submit")) {
            case "findProduct":
                String productId = request.getParameter("productId");
                request.setAttribute("product", service.findProduct(productId));
                request.getRequestDispatcher("").forward(request, response);//which page must the user be forwarded to?
                //should we check to see if product is null
                break;
            
            case "findProductBySize":
                String productSize = request.getParameter("productSize");
                request.setAttribute("product", service.findProductBySize(productSize));
                request.getRequestDispatcher("").forward(request, response);//which page must the user be forwarded to?
                //should we check for null
                break;
            
            case "putProductOnSale":
                Map<String, Double> newPrice = new HashMap<>();
                double price = Double.parseDouble(request.getParameter("newPrice"));
                newPrice.put(request.getParameter("productId"), price);
                if (price > 0) {
                    request.setAttribute("reply", service.putProductOnSale(newPrice));
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                } else {
                    request.setAttribute("reply", "The new price is not valid");
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
                break;
            
            case "logStock":
                StockEntry stockEntry = new StockEntry();
                stockEntry.setBoutiqueId(((Employee) request.getSession().getAttribute("employee")).getBoutique());
                stockEntry.setEmployeeId(((Employee) request.getSession().getAttribute("employee")).getId());
                stockEntry.setProductCode(request.getParameter("productCode"));
                stockEntry.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                Product product = new Product();
                product.setCategories(null);//how are we going to get the array list
                product.setColor(request.getParameter("color"));
                product.setDescription(request.getParameter("description"));
                product.setDiscountedPrice(Double.parseDouble(request.getParameter("discountedPrice")));
                product.setId(request.getParameter("productId"));
                product.setName(request.getParameter("name"));
                product.setPrice(Double.parseDouble(request.getParameter("price")));
                product.setSizes(null);//how are we going to get the list
                NewProduct newProduct = new NewProduct(stockEntry, product);
                ////////////////////////////////////////////////////////////
                //are we assuming that the user is going to insert everything correctly
                //or should we cater for wrong prices or null values.
                ////////////////////////////////////////////////////////////
                request.setAttribute("reply", service.logStock(newProduct));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            
            case "findStockOfProduct":
                productId = request.getParameter("productId");
                //should we check if the product is null
                request.setAttribute("product", service.findStockOfProduct(productId));
                request.getRequestDispatcher("").forward(request, response);//which page must the user be forwarded to?
                //should we check for null
                break;
            
            case "searchForItem":
                List<String> productIds = new ArrayList<>();
                //how are we going to get the products
                request.setAttribute("products", service.SerachForItem(productIds));
                request.getRequestDispatcher("").forward(request, response);//which page will the user be taken to
                break;
                
            case "findCategory":
                request.setAttribute("products", service.findCategory(request.getParameter("categoryId")));
                request.getRequestDispatcher("").forward(request, response);//which page
                break;
                
            case "addCategory":
                Category category = new Category();
                category.setId(request.getParameter("categoryId"));//will the catId be auto generated
                category.setName(request.getParameter("name"));
                request.setAttribute("reply", service.addCategory(category));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
                
            case "addNewPromoCode":
                PromoCode promoCode = new PromoCode();
                promoCode.setCategory(request.getParameter("category"));
                promoCode.setCode(request.getParameter("code"));//will the promoCode be auto generated
                promoCode.setDate(LocalDate.now());
                promoCode.setDiscount(Double.parseDouble(request.getParameter("discountPrice")));
                promoCode.setType(Integer.parseInt(request.getParameter("type")));
                request.setAttribute("reply", service.addNewPromoCode(promoCode));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
                
            case "findPromoCode": 
                request.setAttribute("promoCode", service.findPromoCode(request.getParameter("promoCode")));
                request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }
    
}
