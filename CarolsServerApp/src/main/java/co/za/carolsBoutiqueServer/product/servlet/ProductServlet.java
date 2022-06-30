package co.za.carolsBoutiqueServer.product.servlet;

import co.za.carolsBoutiqueServer.Sale.model.Sale;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import co.za.carolsBoutiqueServer.employee.model.Employee;
import co.za.carolsBoutiqueServer.product.model.Category;
import co.za.carolsBoutiqueServer.product.model.NewProduct;
import co.za.carolsBoutiqueServer.product.model.Product;
import co.za.carolsBoutiqueServer.product.model.PromoCode;
import co.za.carolsBoutiqueServer.product.model.Size;
import co.za.carolsBoutiqueServer.product.model.StockEntry;
import co.za.carolsBoutiqueServer.product.service.IServiceProduct;
import co.za.carolsBoutiqueServer.product.service.ProductRestClient;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.imageio.ImageIO;

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
                request.getRequestDispatcher("specificProductReport.jsp").forward(request, response);
                break;

            case "findProductToUpdate":
                request.setAttribute("prod", service.findProduct(request.getParameter("productId")));
                request.getRequestDispatcher("putProductOnSale.jsp").forward(request, response);
                break;

            case "findAllCategories":
                request.setAttribute("categories", service.findAllCategories());
                request.setAttribute("sizes", service.findAllSizes());
                request.getRequestDispatcher("logstock.jsp").forward(request, response);
                break;
            case "getAllSizes":
                request.setAttribute("sizes", service.findAllSizes());
                request.getRequestDispatcher("requestibt.jsp").forward(request, response);
                break;
            case "findProduct":
                request.setAttribute("categories", service.findAllCategories());
                request.setAttribute("sizes", service.findAllSizes());
                request.setAttribute("product", service.findProduct(request.getParameter("productId")));
                request.getRequestDispatcher("logstock.jsp").forward(request, response);
                break;
            case "findProductForSale":
                Sale sale = (Sale) request.getSession(false).getAttribute("sale");
                Product p = service.findProductBySize(request.getParameter("productCode"));
                if (p != null) {
                    sale.addNewSaleLineItem(p);
                    request.getSession(false).setAttribute("sale", null);
                    request.getSession(false).setAttribute("sale", sale);
                }
                request.getRequestDispatcher("newsale.jsp").forward(request, response);
                break;
            case "findProductToLogStock":
                String prodId = request.getParameter("productId");
                request.setAttribute("productId", prodId);
                Product product = service.findProduct2(prodId);
                if (product == null) {
                    request.setAttribute("categories", service.findAllCategories());
                    request.setAttribute("sizes", service.findAllSizes());
                } else {
                    request.setAttribute("product", product);
                }
                request.getRequestDispatcher("logstock.jsp").forward(request, response);
                break;
            case "addPromoPage":
                request.setAttribute("categories", service.findAllCategories());
                request.getRequestDispatcher("addPromoCode.jsp").forward(request, response);
                break;

            case "findStockOfProduct":
                String productId = request.getParameter("productId");
                request.setAttribute("availableStock", service.findStockOfProduct(productId));
                request.getRequestDispatcher("BoutiqueServlet?submit=getAllReq").forward(request, response);

                break;
            case "getAll":
                request.setAttribute("products", service.findAllProducts());
                request.getRequestDispatcher("specificProductReport.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getParameter("submit")) {

            case "putProductOnSale":
                Map<String, Double> newPrice = new HashMap<>();
                double price = Double.parseDouble(request.getParameter("newPrice"));
                newPrice.put(request.getParameter("id"), price);
                if (price > 0) {
                    request.setAttribute("reply", service.putProductOnSale(newPrice));
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                } else {
                    request.setAttribute("reply", "The new price is not valid");
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
                break;

            case "logStock":
                Employee emp = (Employee) request.getSession(false).getAttribute("employee");
                NewProduct np = new NewProduct();
                Product product = new Product();
                if (request.getParameter("notnull").equalsIgnoreCase("notnull")) {
                    np.setNewProduct(false);
                } else {
                    np.setNewProduct(true);
                    List<Category> allCats = service.findAllCategories();
                    List<Size> allSizes = service.findAllSizes();
                    product.setId(request.getParameter("id"));
                    product.setName(request.getParameter("name"));
                    product.setDescription(request.getParameter("descript"));
                    product.setColor(request.getParameter("color"));
                    product.setPrice(Double.parseDouble(request.getParameter("price")));
                    product.setDiscountedPrice(0.0);
                    List<Category> prodCats = new ArrayList<>();
                    List<Size> prodSizes = new ArrayList<>();
                    for (Enumeration<String> en = request.getParameterNames(); en.hasMoreElements();) {
                        String name = en.nextElement();
                        if (allCats.stream().anyMatch(c -> c.getName().equalsIgnoreCase(name))) {
                            prodCats.add(allCats.stream().filter(c -> c.getName().equalsIgnoreCase(name)).collect(Collectors.toList()).get(0));
                        }
                        if (allSizes.stream().anyMatch(s -> s.getName().equalsIgnoreCase(name))) {
                            prodSizes.add(allSizes.stream().filter(s -> s.getName().equalsIgnoreCase(name)).collect(Collectors.toList()).get(0));
                        }
                    }
                    product.setCategories(prodCats);
                    product.setSizes(prodSizes);

                    for(Size prodSize: prodSizes){
                        String pCode = product.getId() + " " + prodSize.getId();
                            generateQRCodeImage(pCode, product.getName()+" "+prodSize.getId());
                    }
                    
                    
                    
                    //call barcode method here

                }
                np.setProduct(product);
                np.setStockEntry(
                        new StockEntry(
                                (request.getParameter("id") + " " + request.getParameter("sizeLogged")),
                                emp.getBoutique(),
                                Integer.parseInt(request.getParameter("quantity")),
                                emp.getId())
                );
                request.setAttribute("reply", service.logStock(np));
                request.getRequestDispatcher("logstock.jsp").forward(request, response);
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
                promoCode.setCode(request.getParameter("code"));
                promoCode.setDate(request.getParameter("expiry"));
                promoCode.setDiscount(Double.parseDouble(request.getParameter("discount")));
                request.setAttribute("reply", service.addNewPromoCode(promoCode));
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;

            case "findPromoCode":
                request.setAttribute("promoCode", service.findPromoCode(request.getParameter("promoCode")));
                request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }
    
    public static void generateQRCodeImage(String barcodeText, String fileName){
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    QRCodeWriter barcodeWriter = new QRCodeWriter();
                    BitMatrix bitMatrix = barcodeWriter.encode(barcodeText, BarcodeFormat.QR_CODE, 200, 200);
                    BufferedImage img = MatrixToImageWriter.toBufferedImage(bitMatrix);
                    File outputfile = new File(System.getProperty("user.home")+fileName+"QRCodeFile.png");
                    outputfile.createNewFile();
                    ImageIO.write(img, "PNG", outputfile);
                } catch (WriterException | IOException ex) {
                    Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }).start();
        
    }

}
