<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Share file</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div style="margin-bottom: 25px; margin-top: 43px; margin-left: 20px;" class="form-group">
	<form action="ShareFileWithPerson">
		<div class="form-group">
		  <label for="emailToShare">Compartir documento ${sessionScope.newFilename.getTitle()} con: </label>
		  <input type="text" class="form-control" name="emailToShare" id="emailToShare" placeholder="Ingrese un gmail..." style="width: 17%;">
		</div>
	 	<input type="submit" class="btn btn-success" value="Compartir">
	 </form>
</div>
</body>
</html>