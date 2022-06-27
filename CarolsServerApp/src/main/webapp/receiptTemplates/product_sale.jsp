<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="co.za.carolsBoutiqueServer.employee.model.Employee"%>
<%@ page import="co.za.carolsBoutiqueServer.Sale.model.Sale"%>
<%@ page import="co.za.carolsBoutiqueServer.product.model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>sale receipt page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <style type="text/css">
            body{
                margin-top:10px;
                background:#eee;
            }
        </style>
        <script type="text/javascript">
        </script>
        </head>
        <body>
        <div class="container bootdey">
            <div class="row invoice row-printable">
                <div class="col-md-10">
                    <!-- col-lg-12 start here -->
                    <div class="panel panel-default plain" id="dash_0">
                        <!-- Start .panel -->
                        <div class="panel-body p30">
                            <div class="row">
                                <!-- Start .row -->
                                <div class="col-lg-6">
                                    <div class="text-center">
                                        <img src="carolsboutique.png" alt="logo" height="150" width="170">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <!-- col-lg-12 start here -->
                                    <div class="invoice-details mt25">
                                        <div class="well">
                                            <ul class="list-unstyled mb0">
                                                <li><strong>SaleId&nbsp;&nbsp; :&nbsp; </strong> #936988</li>
                                                <li><strong>Teller&nbsp;&nbsp;&nbsp; :&nbsp; </strong><%=employee.getName()%></li>
                                                <li><strong>StoreId :&nbsp; </strong> PTA</li>
                                                <li><strong>Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; </strong>
                                                        <script>
                                                            date = new Date().toLocaleDateString();
                                                            document.write(date);
                                                        </script>
                                                
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="invoice-items">
                                        <div class="table-responsive" style="overflow: hidden; outline: none;" tabindex="0">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr >
                                                        <th class="per70 text-center">Item</th>
                                                        <th class="per70 text-center">Qty</th>
                                                        <th class="per5 text-center" width="155px">Price</th>
                                                        <th class="per125 text-left" width="155px">DiscountedPrice</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr height="35px">
                                                        <td> <!-- Purchased item --> </td>
                                                        <td class="text-center">  <!--Qty--> </td>
                                                        <td class="text-center"><!-- Original-price --> </td>
                                                        <td class="text-center"><!--Discounted price --> </td>
                                                    </tr>
                                                    
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th colspan="3" class="text-right">Sub Total:</th>
                                                        <th class="text-center"><!--R200 --> </th>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="3" class="text-right">Discount:</th>
                                                        <th class="text-center"><!-- Discount to subtract --></th>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="3" class="text-right">15% VAT:</th>
                                                        <th class="text-center"><!-- Total calculated vat --></th>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="3" class="text-right">Total:</th>
                                                        <th class="text-center"><!-- Grand total --></th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="invoice-footer mt25">
                                        <p class="text-center">Thank you please call again</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

