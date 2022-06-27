<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="co.za.carolsBoutiqueServer.product.model.Product" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,
              initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
        <title>
            How to use simple API using AJAX ?
        </title>
    </head>
    <body>
        <button id="button">Load Boutiques</button>
        <br><br>
        <h1>Boutiques</h1>
        <ol id="bouts"></ol>
        <h1>Product</h1>
        <ol id="pro"></ol>
        <input type="text" name="id" id="prod">
        <button id="findProduct">Find Product</button>
        
        <script>
            let sale = [];
            document.getElementById("button").addEventListener("click",loadBouts);
            document.getElementById("findProduct").addEventListener("click",getProduct);
            function loadBouts(){
                var xhr = new XMLHttpRequest();
                xhr.open("GET","http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/boutique/getAllBoutiques",true);
                
                xhr.onreadystatechange = function(){
                    if(this.readyState == 4){
                        var bouts2 = JSON.parse(this.responseText);
                        var output = "";
                        
                        for(var i in bouts2){
                            output += "<ol>" +
                                    "<li>ID: "+bouts2[i].id+"</li>"+
                                    "<li>Location: "+bouts2[i].location+"</li>"+
                                    "<li>Daily Target: "+bouts2[i].dailyTarget+"</li>"+
                                    "<li>Password: "+bouts2[i].password+"</li>"+
                                    "<li>Monthly Target: "+bouts2[i].monthlyTarget+"</li>"+ "</ol>";
                            
                        }
                        document.getElementById("bouts").innerHTML = output;
                    }
                }
                xhr.send();
            }
            function getProduct(){
                var proid = document.getElementById("prod").value;
                var xhr = new XMLHttpRequest();
                xhr.open("GET","http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findProduct/"+proid,true);
                
                xhr.onreadystatechange = function(){
                    if(this.readyState == 4){
                        var product1 = JSON.parse(this.responseText);
                        var output = "";
                        //console.log(product1);
                        //var categories = product1.categories;
                        let product = new Product(); 
                        output += "<ol>"+
                                "<li>ID: "+product1.id+"</li>"+
                                "<li>Name: "+product1.name+"</li>"+
                                "<li>Descript:  " + product1.description +"</li>"+
                                "<li>price:  " + product1.price +"</li>"+
                                "<li>discountedPrice:  " + product1.discountedPrice +"</li>";
                                for(var i in product1.categories){
                                    output += "<ol><li>Cat ID: "+product1.categories[i].id+"</li>"+
                                    "<li>Cat Name:  " + product1.categories[i].name +"</li></ol>"
                                }
                                for(var i in product1.sizes){
                                    output += "<ol><li>Cat ID: "+product1.sizes[i].id+"</li>"+
                                    "<li>Cat Name:  " + product1.sizes[i].name +"</li></ol>"
                                }
                         "</ol>";
                        document.getElementById("pro").innerHTML = output;
                    }
                }
                xhr.send();
            }
            
        </script>
        
    </body>
    <script>
        function Product(id, name, description, size[], color, price, discountedPrice, categories[]){
            this.id = id;
            this.name = name;
            this.description = description;
            this.size = size;
            this.color = color;
            this.price = price;
            this.discountedPrice = discountedPrice;
            this.categories = categories;
        }
//        function Sale(id, employee, approved, totalPrice, items[], boutique, cardNumber, customerEmail){
//            this.id = id;
//            this.employee = employee;
//            this.approved = approved;
//            this.totalPrice = totalPrice;
//            this.items = items;
//            this.boutique = boutique;
//            this.cardNumber = cardNumber;
//            this.customerEmail = customerEmail;
//        };
    </script>
</html>

