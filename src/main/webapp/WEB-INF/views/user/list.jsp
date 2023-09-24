<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User list</title>
</head>
<body>
	<c:url value="register" var="register" />
	<a href="${register}">Register</a>
	<c:if test="${!empty userlist}">
		<table>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Password</th>
				<th>Settings</th>
			</tr>
			<c:forEach var="userlist" items="${userlist}">
				<tr>
					<td><c:out value="${userlist.userId}"></c:out></td>
					<td><c:out value="${userlist.fname}"></c:out></td>
					<td><c:out value="${userlist.email}"></c:out></td>
					<td><c:out value="${userlist.mobile}"></c:out></td>
					<td><c:out value="${userlist.password}"></c:out></td>
					<td><a href="<c:url value="edit/${userlist.userId}"  />" >Edit</a>
					<a href="<c:url value="details/${userlist.userId}"  />">Details</a>
					<a href="<c:url value="delete/${userlist.userId}"  />">Delete</a>
					</td>
				</tr>
			</c:forEach>

		</table>
	</c:if>

</body>
</html>