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
<h3>${title}</h3>
<h3>${message}</h3>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Platform</a></li>
    <li><a href="#tabs-2">Hostname Management</a></li>
    <li><a href="#tabs-3">Security</a></li>
    <li><a href="#tabs-4">Storage-Recovery</a></li>
  </ul>
  <div id="tabs-1">
    <button onclick="window.location.href=''">Local-Servers</button><br><br>
    <button onclick="window.location.href=''">Mesosphere</button><br><br>
    <button onclick="window.location.href=''">Virtual-VMWare</button><br><br>
    <button onclick="window.location.href=''">Amazon-EC2</button><br><br>
    <button onclick="window.location.href=''">Rackspace</button><br><br>
    <button onclick="window.location.href=''">Virtualbox</button><br><br>
    <button onclick="window.location.href=''">KVM</button><br><br>
    <button onclick="window.location.href=''">Vagrant</button><br><br>
  </div>
  <div id="tabs-2">
    <button onclick="window.location.href=''">DNS-Servers</button><br><br> 
    <button onclick="window.location.href=''">AWS-Route53</button><br><br>
    <button onclick="window.location.href=''">Mannual-Config</button><br><br>
</div>
  <div id="tabs-3">
    <button onclick="window.location.href=''">Key-Manager</button><br><br>
    <button onclick="window.location.href=''">User-Manager</button><br><br>
</div>
  <div id="tabs-4">
    <button onclick="window.location.href=''">Network-Drive</button><br><br>
    <button onclick="window.location.href=''">Auto-Backups</button><br><br>
    <button onclick="window.location.href=''">Restoration</button><br><br>
</div>
</div>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2>
			Welcome: ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
		</h2>
	</c:if>
 
    </body>
</html>
