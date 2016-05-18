<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>

<body>
<button onclick="window.location.href='/spring-security-hibernate/admin'">Home</button>
<br>
<br>
 	<h1>${title}</h1>
	<h1>${message}</h1>

	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<button onclick="window.location.href='/spring-security-hibernate/deploy'">Deploy</button>
	<button onclick="window.location.href='/spring-security-hibernate/configure'">Configure</button>
	<button onclick="window.location.href='/spring-security-hibernate/administer'">Administer</button>
	<button onclick="window.location.href='/spring-security-hibernate/feeds'">Data Feeds</button>
	
<!--
	<input type="Submit" name="configure" value="Configure"></input>
	<input type="Submit" name="Administer" value="Administer"></input>
-->

	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2>
			Welcome : ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
		</h2>
	</c:if>

</body>
</html>
