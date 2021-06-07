<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>log out page</title>
<style type="text/css">
table {
	padding: 10px;
	border: 2px solid #000000;
	border-radius: 5px;
}

table.out {
	border: 5px solid black;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<div align="center">
		<form:form action="logout" method="POST">
			<table class="out">
				<tr>
					<td>Logout here!...</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="logout"></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>