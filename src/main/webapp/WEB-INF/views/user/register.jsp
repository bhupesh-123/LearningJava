<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<style type="text/css">
input[type=text] {
	padding: 12px 20px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 12px 30px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

canvas {
	/*prevent interaction with the canvas*/
	pointer-events: none;
}
</style>
<script type="text/javascript">
	var code;
	function createCaptcha() {
		//clear the contents of captcha div first 
		document.getElementById('captcha').innerHTML = "";
		var charsArray = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$%^&*";
		var lengthOtp = 6;
		var captcha = [];
		for (var i = 0; i < lengthOtp; i++) {
			//below code will not allow Repetition of Characters
			var index = Math.floor(Math.random() * charsArray.length + 1); //get the next character from the array
			if (captcha.indexOf(charsArray[index]) == -1)
				captcha.push(charsArray[index]);
			else
				i--;
		}
		var canv = document.createElement("canvas");
		canv.id = "captcha";
		canv.width = 100;
		canv.height = 50;
		var ctx = canv.getContext("2d");
		ctx.font = "25px Georgia";
		ctx.strokeText(captcha.join(""), 0, 30);
		//storing captcha so that can validate you can save it somewhere else according to your specific requirements
		code = captcha.join("");
		document.getElementById("captcha").appendChild(canv); // adds the canvas to the body element
	}
	function validateCaptcha() {
		event.preventDefault();
		debugger
		if (document.getElementById("cpatchaTextBox").value == code) {
			alert("Valid Captcha")
		} else {
			alert("Invalid Captcha. try Again");
			createCaptcha();
		}
	}
</script>

</head>
<body onload="createCaptcha()">
	<h3>user register form</h3>
	<c:url var="action" value="/user/create"></c:url>
	<form:form action="${action}" modelAttribute="user" method="post"
		onsubmit="validateCaptcha()">
		<table>
			<tr>
				<td><form:label path="fname"></form:label>First Name</td>
				<td><form:input path="fname" /></td>
				<td><form:errors path="fname" cssStyle="color: #ff0000;" /></td>
			</tr>
			<tr>
				<td><form:label path="email"></form:label>Email</td>
				<td><form:input path="email" /></td>
				<td><form:errors path="email" cssStyle="color: #ff0000;" /></td>
			</tr>
			<tr>
				<td><form:label path="mobile"></form:label>Mobile</td>
				<td><form:input path="mobile" /></td>
				<td><form:errors path="mobile" cssStyle="color: #ff0000;" /></td>
			</tr>
			<tr>
				<td><form:label path="password"></form:label>Password</td>
				<td><form:password path="password"/></td>
				<td><form:errors path="password" cssStyle="color: #ff0000;" /></td>
			</tr>
			<tr>
				<td>
					<div id="captcha"></div>
				</td>
				<td><input type="text" placeholder="Captcha"
					id="cpatchaTextBox" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="add user"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>