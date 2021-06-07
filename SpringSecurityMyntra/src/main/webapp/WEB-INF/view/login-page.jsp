<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login page</title>
<style type="text/css">
table {
	padding: 10px;
	border: 2px solid #000000;
	border-radius: 5px;
}

table.logincenter {
	border: 5px solid black;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<div align="center">
		<!-- to handle invalid -->
		<c:if test="${param.error!=null}">
			<i style="color: red;">Invalid login or password</i>
		</c:if>
		<c:if test="${param.logout!=null}">
			<i style="color: red;">you are successfully logged out</i>
		</c:if>
	</div>
	<form:form action="loginSuccess" method="POST">
		<table class="logincenter">
			<caption>
				<h2>Login</h2>
			</caption>
			<tr>
				<td>Username</td>
				<td>:<form:input path="username" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td>:<form:password path="password" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="login"></td>
			</tr>
		</table>
	</form:form>

</body>
</html>