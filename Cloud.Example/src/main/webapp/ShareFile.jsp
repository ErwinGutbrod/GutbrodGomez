<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Share file</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://apis.google.com/js/api.js"></script>
<script type="text/javascript">
    init = function() {
        s = new gapi.drive.share.ShareClient();
        var token = ${sessionScope.accessToken};    
        var fileId = ${sessionScope.newFilename.getId()}; 
        s.setOAuthToken(token);
        s.setItemIds([fileId]);
    }
    window.onload = function() {
        gapi.load('drive-share', init);
    }
</script>
</head>
<body>
<div style="margin-bottom: 25px; margin-top: 43px; margin-left: 20px;" class="form-group">

	 <label >Compartir documento ${sessionScope.newFilename.getTitle()}: </label>
	 <button onclick="s.showSettingsDialog()">Share</button>
</div>
</body>
</html>