<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="co.za.carolsBoutiqueServer.employee.model.Employee"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,
              initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
        <title>JSP Page</title>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/dynamsoft-javascript-barcode@9.0.2/dist/dbr.js"></script>
        <%Employee emp = new Employee();/*(Employee)request.getSession(false).getAttribute("employee");*/%>
        <%emp.setId("AB");%>
        <%emp.setBoutique("AB");%>
        <h1>Display Product</h1>
        <input type="text" name="id" id="prod">
        <button id="findProduct">Find Product</button>

        <div id="display"></div><br><br><br>
        <div id="total"></div>
        <label>Customer Email: <input type="text" name="id" id="email" required></label><br>
        <label>Card Num: <input type="text" name="id" id="card" required></label><br>
        <button id="checkout">Checkout</button>
        <div id="reply"></div>
        <script>
            let items = [];
            var index = 0;
            var totalPrice = 0;
            document.getElementById("findProduct").addEventListener("click", getProduct);
            document.getElementById("checkout").addEventListener("click", checkout);
            function getProduct() {
                var proid = document.getElementById("prod").value;
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findProduct/" + proid, true);

                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        var product1 = JSON.parse(this.responseText);
                        let sizes = [];
                        let categories = [];
                        for (var i in product1.categories) {
                            categories.splice(i, 0, new Category(product1.categories[i].id, product1.categories[i].name));
                            console.log(categories[i]);
                        }
                        for (var i in product1.sizes) {
                            sizes.splice(i, 0, new Size(product1.sizes[i].id, product1.sizes[i].name));
                        }
                        items.splice(index, 0, new Product(
                                product1.id,
                                product1.name,
                                product1.description,
                                sizes,
                                product1.color,
                                product1.price,
                                product1.discountedPrice,
                                categories));
                        console.log[items[index]];
                        index++;
                        let output = "";
                        let calculatedTotal = 0;
                        for (var i in items) {
                            console.log[items[i]];
                            calculatedTotal += items[i].discountedPrice;
                            console.log(totalPrice);
                            output += "<ol>" +
                                    "<li>" + items[i].name + "<br>Price:  " + items[i].price + "<br>Discounted Price:  " + items[i].discountedPrice + "</li></ol>";
                        }
                        totalPrice = calculatedTotal;
                        let displayPrice = "";
                        displayPrice += "<label>Total=" + totalPrice + "</label>";
                        document.getElementById("display").innerHTML = output;
                        document.getElementById("total").innerHTML = displayPrice;
                    }
                };
                xhr.send();
            }

            function getProduct2(productId) {
                this.proid = productId;
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findProduct/" + proid, true);

                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        var product1 = JSON.parse(this.responseText);
                        let sizes = [];
                        let categories = [];
                        for (var i in product1.categories) {
                            categories.splice(i, 0, new Category(product1.categories[i].id, product1.categories[i].name));
                            console.log(categories[i]);
                        }
                        for (var i in product1.sizes) {
                            sizes.splice(i, 0, new Size(product1.sizes[i].id, product1.sizes[i].name));
                        }
                        items.splice(index, 0, new Product(
                                product1.id,
                                product1.name,
                                product1.description,
                                sizes,
                                product1.color,
                                product1.price,
                                product1.discountedPrice,
                                categories));
                        console.log[items[index]];
                        index++;
                        let output = "";
                        var total = 0;
                        for (var i in items) {
                            console.log[items[i]];
                            total += items[i].discountedPrice;
                            console.log(total);
                            output += "<ol>" +
                                    "<li>" + items[i].name + "  " + items[i].price + "  " + items[i].discountedPrice + "</li></ol>";
                        }
                        let totalPrice = "";
                        totalPrice += "<label>Total=" + total + "</label>";
                        document.getElementById("display").innerHTML = output;
                        document.getElementById("total").innerHTML = totalPrice;
                    }
                };
                xhr.send();

            }

            function checkout() {
                var email = document.getElementById("email").value;
                var card = document.getElementById("card").value;
                var sale = new Sale("", "<%=emp.getId()%>", false, totalPrice, items, "<%=emp.getBoutique()%>", card, email);
                var toSend = JSON.stringify(sale);
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/sale/checkout", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        var reply = JSON.parse(this.responseText);
                        var output = "";
                        output += "<h5>" + reply + "</h5>";
                        document.getElementById("reply").innerHTML = output;
                    }
                };
                xhr.send(toSend);
            }

            function Category(id, name) {
                this.id = id;
                this.name = name;
            }

            function Size(id, name) {
                this.id = id;
                this.name = name;
            }

            function Product(id, name, description, sizes, color, price, discountedPrice, categories) {
                this.id = id;
                this.name = name;
                this.description = description;
                this.sizes = sizes;
                this.color = color;
                this.price = price;
                this.discountedPrice = discountedPrice;
                this.categories = categories;
            }

            function Sale(id, employee, approved, totalPrice, items, boutique, cardNumber, customerEmail) {
                this.id = id;
                this.employee = employee;
                this.approved = approved;
                this.totalPrice = totalPrice;
                this.items = items;
                this.boutique = boutique;
                this.cardNumber = cardNumber;
                this.customerEmail = customerEmail;
            }
            //function barcodeScanner() {
//                Dynamsoft.DBR.BarcodeScanner.license = 'DLS2eyJvcmdhbml6YXRpb25JRCI6IjIwMDAwMSJ9';
//                (async () => {
//                    let scanner = await Dynamsoft.DBR.BarcodeScanner.createInstance();
//                    scanner.onFrameRead = results => {
//                        if (results.length > 0)
//                            console.log(results);
//                    };
//                    scanner.onUniqueRead = (txt, result) => {
//                        getProduct2(txt);
//                    };
//                    await scanner.show();
//                })();
            //document.getElementById("cam").innerHTML = scanner;
            //};

        </script>

    </body>
</html>
