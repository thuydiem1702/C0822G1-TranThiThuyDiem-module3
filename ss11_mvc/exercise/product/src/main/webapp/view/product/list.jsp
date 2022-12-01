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
    <title>Customer display</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <style>
        img {
            height: 100px;
            width: 100px;
        }
    </style>
</head>
<body>
<h1>List customer</h1>
<a href="/product?action=add">Add new product</a>
<a href="/product?action=find">Find product</a>
<table class="table table-dark">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Manufacturer</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>View details</th>
    </tr>
    <c:forEach var="x" items="${products}" varStatus="index">
        <tr>
            <td>${x.getId()}</td>
            <td>${x.getName()}</td>
            <td>${x.getPrice()}</td>
            <td>${x.getDescription()}</td>
            <td>${x.getManufacturer()}</td>
            <td><a href="/product?action=edit&id=${x.getId()}">Edit</a></td>
            <td><a href="/product?action=delete&id=${x.getId()}">Delete</a></td>
            <td><a href="/product?action=view&id=${x.getId()}">View</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>