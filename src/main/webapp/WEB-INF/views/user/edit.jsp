<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit</title>
</head>
<body>
<c:url var="list" value="/user/list"></c:url>
<a href="${list}"> All List</a>
<a href=""></a>
<c:url var="action" value="/user/update"></c:url>
<form:form action="${action}" modelAttribute="user" method="post">
<table>
<tr>
<form:hidden path="userId"/>
<td><form:label path="fname"></form:label>First Name</td>
<td><form:input path="fname"/></td>
<td><form:errors path="fname" cssStyle="color: #ff0000;"/></td>
</tr>
<tr>
<td><form:label path="email"></form:label>Email</td>
<td><form:input path="email"/></td>
<td><form:errors path="email" cssStyle="color: #ff0000;"/></td>
</tr>
<tr>
<td><form:label path="mobile"></form:label>Mobile</td>
<td><form:input path="mobile"/></td>
<td><form:errors path="mobile" cssStyle="color: #ff0000;"/></td>
</tr>
<tr>
<td><form:label path="password"></form:label>Password</td>
<td><form:password path="password"/></td>
<td><form:errors path="password" cssStyle="color: #ff0000;"/></td>
</tr>
<tr>

<td colspan="2"><input type="submit" value="Update"></td>
</tr>
</table>
</form:form>
</body>
</html>