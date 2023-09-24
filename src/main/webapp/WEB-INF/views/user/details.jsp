<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details</title>
</head>
<body>
<c:url var="list" value="/user/list"></c:url>
<a href="${list}"> All List</a>
<table>
<tr> 
<td>name: </td>
<td>${fname}</td>
</tr>
<tr>
<td>email: </td>
<td>${email}</td>
</tr>
<tr>
<td>mobile: </td>
<td>${mobile}</td>
</tr>
<tr>
<td>password: </td>
<td>${password}</td>
</tr>

</table>

</body>
</html>