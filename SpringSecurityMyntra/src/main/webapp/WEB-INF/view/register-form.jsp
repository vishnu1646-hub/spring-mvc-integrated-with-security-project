<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Spring Tiles Login Form</title>
<script>
	function validateForm() {
		var x = document.forms["myForm"]["name"].value;
		var y = document.forms["myForm"]["password"].value;
		var z = document.forms["myForm"]["email"].value;
		var m = document.forms["myForm"]["mobileNumber"].value;
		if (x == "") {
			alert("Name must be filled out");
			return false;
		}
		if (y == "") {
			alert("Password must be filled out");
			return false;
		}
		if (z == "") {
			alert("Email must be filled out");
			return false;
		}
		if (m == ""||isNaN(m)) {
			alert("MobileNumber field is not proper");
			return false;
		}
	}
</script>
<style type="text/css">
table {
	padding: 10px;
	border: 2px solid #000000;
	border-radius: 5px;
}

table.center {
	border: 5px solid black;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<form:form name="myForm" onsubmit="return validateForm()" action="save">
		<table class="center">
			<caption>
				<h2>Register</h2>
			</caption>
			<tr>
				<td><form:label path="name">Name</form:label></td>
				<td>:<form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="password">Password</form:label></td>
				<td>:<form:input path="password" /></td>
			</tr>
			<tr>
				<td><form:label path="email">Email</form:label></td>
				<td>:<form:input path="email" /></td>
			</tr>
			<tr>
				<td><form:label path="mobileNumber">MobileNumber</form:label></td>
				<td>:<form:input path="mobileNumber" /></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><input type="submit" value="register" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>