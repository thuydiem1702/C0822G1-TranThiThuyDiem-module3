<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/1/2022
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit product</title>
</head>
<body>
<h1>Edit product page</h1>
<a href="/product">Back to the list page!</a>
<form action="/product?action=edit" method="post">
    <p>The product that has the id of <input type="text" name="id" value="${id}"> is about edited</p>
    <p>Select parameter you want to edit:
        <select name="option">
            <option value="1">Name</option>
            <option value="2">Price</option>
            <option value="3">Description</option>
            <option value="4">Manufacturer</option>
        </select>
    </p>
    <p>Input the value you want to change here: <input type="text" name="editChange"></p>
    <button>Set this!</button>
</form>
<c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if>
</body>
</html>
