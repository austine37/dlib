<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
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
 
<body>
<button onclick="window.location.href='/spring-security-hibernate/admin'">Home</button>
<h3>${title}</h3>
<h3>${message}</h3>
<h3>${feedSummary}</h3>
<!--<h3>${date}</h3> -->

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Feeds</a></li>
    <li><a href="#tabs-2">--</a></li>
    <li><a href="#tabs-3">--</a></li>
    
  </ul>

 <div id="tabs-1">
	<a href="">Data feed system</a><br><br>
	<c:out value="${date}"></c:out>

		<form name='deployForm'action="<c:url value='/feeds' />" method='POST'>
			<table>
			<tr>
			</tr>
			<tr>
			<td>Data feeds</td>
			<td>
			<select name="feedurl">
 	 		<option value="http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.atom">Earthquake Updates</option>
  			<option value="jaticles">Java Articles</option>
			<option value="devops">Android Developement Resources</option>
  			<option value="alerts">Critical Platform Alerts</option>
			<option value="devops">DevOps Resources</option>
			<option value="devops">Users Feedback</option>
			</select>
			</td>
			</tr>

			<tr>
			<td colspan='2'><input name="submit" type="submit"
			value="Explore!" />
			</td>
			</tr>
			</table>
			${earthquakeDetails}

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
</div>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2>		
 
			Welcome : ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
		</h2>
	</c:if>

</body>
</html>
