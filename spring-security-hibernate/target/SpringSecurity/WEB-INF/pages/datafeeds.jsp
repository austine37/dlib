<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
	<h1>${title}</h1>
	<h1>${message}</h1>
	
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

 
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

<div id="tabs-4">
	<a href="">Data feed system</a><br><br>
	<c:out value="${date}"></c:out>

		<form name='feedForm'action="<c:url value='/datafeeds' />" method='POST'>
			<table>
			<tr>
			</tr>
			<tr>
			<td>Data feeds</td>
			<td>
			<select name="feedurl">
 	 		<option value="http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.atom">Earthquake Updates</option>
  			<option value="jaticles">Java Articles</option>
  			<option value="alerts">Platform Alerts</option>
			<option value="devops">DevOps Resources</option>
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
