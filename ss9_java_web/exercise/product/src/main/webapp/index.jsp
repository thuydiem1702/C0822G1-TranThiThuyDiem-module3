<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/29/2022
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/display-discount" method="post">
    <p>Product Description</p>
    <input type="text" name="ProductDescription">
    <p>List Price</p>
    <input type="text" name="ListPrice">
    <p>Discount Percent</p>
    <input type="text" name="DiscountPercent">
    <hr>
    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>
