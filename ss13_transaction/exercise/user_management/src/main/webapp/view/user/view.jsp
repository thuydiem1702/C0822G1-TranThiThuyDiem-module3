<%--
  Created by IntelliJ IDEA.
  User: tranthingoclan
  Date: 05/12/2022
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>View</title>
</head>
<body>
<h3>Thông tin người dùng</h3>

<pre>Id:                <span>${user.getId()}</span></pre>
<pre>Tên người dùng:    <span>${user.getName()}</span></pre>
<pre>Email:             <span>${user.getEmail()}</span></pre>
<pre>Quốc gia:          <span>${user.getCountry()}</span></pre>

<a href="/user">< Quay lại trang Danh sách người dùng</a>
</form>
</body>
</html>

