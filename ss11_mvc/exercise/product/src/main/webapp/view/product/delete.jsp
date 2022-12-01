<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/1/2022
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Delete product</title>
</head>
<body>
<h1>Delete product page</h1>
<a href="/product">Back to the list page!</a>
<form action="/product?action=delete" method="post">
    <p>Do you wish to delete the product that has the id of <input type="text" name="id" value="${id}"></p>
    <p>
        <button>Yes</button>
        <a href="/product">No</a></p>
</form>
<c:if test="${mess!=null}">
    <span> ${mess}</span>
</c:if>
</body>
</html>

