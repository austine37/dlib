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
<h4>${title}</h4>
<h4>${message}</h4>
<h4>${hostname}</h4>
<!--<h3>${date}</h3> -->

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Configuration Manager</a></li>
    <li><a href="#tabs-2">Code Repo/Review</a></li>
    <li><a href="#tabs-3">CI and Build Systems</a></li>
    
  </ul>
  <div id="tabs-1">
     <a href=" ">Deploy Configuration Management</a><br><br>
		<form name='deployForm'
			action="<c:url value='/deploy' />" method='POST'>
			<table>
			<tr>
			<td>Hostname:</td>
			<td><input type='text' name='hostname'></td>
			</tr>
			<tr>
			<td>Config Manager Type:</td>
			<td>
			<select name="confmanagetype">
			<option value="chef">Chef</option>
			<option value="puppet">Puppet</option>
  			<option value="cfeng">CFEngine</option>
  			<option value="ansible">Ansible</option>
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
    <a href=" ">Deploy Code Repository</a><br><br>
	    	
		<form name='deployForm'action="<c:url value='/deploy' />" method='POST'>
			<table>
			<tr>
			<td>Hostnames:</td>
			<td><input type='text' name='hostname'></td>
			</tr>
			<tr>
			<td>Type of Code repo/revie:</td>
			<td>
			<select name="repotype">
 	 		<option value="git/Gerrit">Git/gerrit</option>
  			<option value="svn">SVN</option>
  			<option value="subversion">Subversion</option>
  			<option value="perforce">Perforce</option>
			</select>
			</td>
			</tr>
			<tr>
			<td colspan='2'><input name="submit" type="submit"
			value="Go!" />
			</td>
			</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
 
</div>
  <div id="tabs-3">
	<a href=" '">Deploy CI and Build System</a><br><br>

		<form name='deployForm'action="<c:url value='/deploy' />" method='POST'>
			<table>
			<tr>
			<td>Hostnames:</td>
			<td><input type='text' name='hostname'></td>
			</tr>
			<tr>
			<td>Type of Code CI:</td>
			<td>
			<select name="citype">
 	 		<option value="jenkinsmaster">Jenkins Master</option>
  			<option value="jenkinslave">Jenkins Slave</option>
  			<option value="packagemanage">Package Manager</option>
  			<option value="signing">Software Signing Service</option>
			<option value="mvn">Maven</option>
			<option value="gradle">Gradle</option>
			</select>
			</td>
			</tr>

			<tr>
			<td colspan='2'><input name="submit" type="submit"
			value="Go!" />
			</td>
			</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
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
