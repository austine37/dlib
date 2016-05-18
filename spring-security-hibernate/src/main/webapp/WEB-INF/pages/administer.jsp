<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script>
  	$(function() {
    	$( "#tabs" ).tabs();
  	});
 	</script>
	
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>
</head>
<body>
<button onclick="window.location.href='/spring-security-hibernate/admin'">Home</button>
	<h1>${title}</h1>
	<h4>${message}</h4>

<h4>Configuration page!</h4>

<div id="tabs">
	<ul>
	<li><a href="#tabs-1">Configuration Management</a></li>
    	<li><a href="#tabs-2">Continous Integration System</a></li>
    	<li><a href="#tabs-3">Code Repository and Review</a></li>
	<li><a href="#tabs-4">Mange Storage Bug Management System</a></li>
  </ul>
  <div id="tabs-1">
	<a href="">Administer Chef</a><br><br>
	 
  </div>
  <div id="tabs-2">
	<a href=" ">Continous Integration</a><br><br>
	 
</div>
  <div id="tabs-3">
	<a href="">Code repository</a><br><br>
</div>
  <div id="tabs-4">
<a href=" ">Mange Storage, Backup and Restoration</a><br><br>
</div>
</div>
</body>
</html>
