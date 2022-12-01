<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/1/2022
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find product</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Find product page</h1>
<p>
    <a href="/product">Back to the list page</a>
</p>
<form action="/product?action=find" method="post">
    <fieldset>
        <legend>Find according to:</legend>
        <table>
            <tr>
                <p>Name</p>
                <td><input type="text" name="name" id="name"></br>
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Find product"></td>
            </tr>
        </table>
    </fieldset>
</form>
<c:if test="${output.size()==null}">
    <p>Not found any product by given name!</p>
</c:if>
<c:if test="${output.size()!=null}">
    <table class="table table-dark">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Manufacturer</th>
        </tr>
        <c:forEach var="x" items="${output}" varStatus="index">
            <tr>
                <td>${x.getId()}</td>
                <td>${x.getName()}</td>
                <td>${x.getPrice()}</td>
                <td>${x.getDescription()}</td>
                <td>${x.getManufacturer()}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
