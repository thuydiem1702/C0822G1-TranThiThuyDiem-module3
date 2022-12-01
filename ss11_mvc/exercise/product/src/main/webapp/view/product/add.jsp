<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/1/2022
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Adding new product</title>
</head>
<body>
<a href="/product">Back to the list page!</a>
<h1>Adding new product page</h1>
<form action="/product?action=add" method="post">
    <p>Product Id: <input type="number" name="id"></p>
    <p>Product Name: <input type="text" name="name"></p>
    <p>Product Price: <input type="number" name="price"></p>
    <p>Product Description: <input type="text" name="description"></p>
    <p>Product Manufacturer: <input type="text" name="manufacturer"></p>
    <button>Save</button>
</form>
<c:if test="${mess!=null}">
    <span> ${mess}</span>
</c:if>
</body>
</html>
