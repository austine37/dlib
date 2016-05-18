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
	<li><a href="#tabs-1">Manage Platforms and Environment</a></li>
    	<li><a href="#tabs-2">Security setup</a></li>
    	<li><a href="#tabs-3">Configure Build and Testing</a></li>
	<li><a href="#tabs-4">Storage and Recovery</a></li>
  </ul>
  <div id="tabs-1">
     <a href=" ">Manage The Platform</a><br><br>
		<form name='deployconfigForm'
			action="<c:url value='/deploy' />" method='POST'>
			<table>
			<tr>
			<td>Admin password</td>
			<td><input type='text' name='hostname'></td>
			</tr>
			<tr>
			<td>What Platform do you want to Configure?</td>
			<td>
			<select name="confure">
			<option value="vmw">Virtual-VMWare</option>
			<option value="aws">Amazon-EC2</option>
  			<option value="rackspace">Rackspace</option>
  			<option value="virtualbox">Virtualbox</option>
			<option value="KVM">KVM</option>
			<option value="vagrant">Vagrant</option>
			<option value="dns">DNS-Services</option>
			<option value="usrmng">User-Manager</option>
			</select>
			</td>
			</tr>
			<tr>
			<td colspan='2'><input name="submit" type="submit"
			value="Go!" /></td>
			</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		</form>
  </div>
  <div id="tabs-2">
	<a href=" ">Manage Users and Security Keys</a><br><br>
		<form name='deployForm'
			action="<c:url value='/deploy' />" method='POST'>
			<table>
			<tr>
			<td>Enter Admin password</td>
			<td><input type='text' name='hostname'></td>
			</tr>
			<tr>
			<td>Manage users or Keys?</td>
			<td>
			<select name="confure">
			<option value="usrmng">User-Manager</option>
			<option value="keymng">Key-Manager</option>
			</select>
			</td>
			</tr>
			<tr>
			<td colspan='2'><input name="submit" type="submit"
			value="Go!" /></td>
			</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		</form>
</div>
  <div id="tabs-3">
        <a href="">Configure buid, test and deployment componenets</a><br><br>

	 
</div>
  <div id="tabs-4">
<a href=" ">Mange Storage, Backup and Restoration</a><br><br>
<form name='deployForm'
			action="<c:url value='/deploy' />" method='POST'>
			<table>
			<tr>
			<td>Enter Admin password</td>
			<td><input type='text' name='hostname'></td>
			</tr>
			<tr>
			<td>What are you configuring?</td>
			<td>
			<select name="manageresources">
			<option value="usrmng">Storage</option>
			<option value="backups">Backup and Recovery</option>
			<option value="moniotr">Monitoring</option>
			<option value="logging">Logging</option>
			</select>
			</td>
			</tr>
			<tr>
			<td colspan='2'><input name="submit" type="submit"
			value="Go!" /></td>
			</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		</form>
</div>
</div>

<!--
	<form action="WEB-INF/pages/configure" method="post">
	<input type="Submit" name="configure" value="Configure"></input>
	</form>
	<input type="Submit" name="configure" value="Configure"></input>
	<input type="Submit" name="Administer" value="Administer"></input>
-->

	<script>
		function formSubmit() {
			document.getElementById("configure").submit();
		}
	</script>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2>
			Welcome! ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
		</h2>
	</c:if>
 
</body>
</html>
