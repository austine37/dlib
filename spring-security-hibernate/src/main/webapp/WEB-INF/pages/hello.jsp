<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<h1>${title}</h1>
	<h1>${message}</h1>
	<p>
	<h2> what? </h2>
	This is a learning and demonstration application/project:<br>
	The learning objectives are to build a Dev-Ops tool, written in Java and using Spring framework<br><br>
	the tool is meant to rapidly and efficiently provision, deploy, and <br>
	configure critical components of a software developement lab.<br> 
	Moreso, the application can be fed data streams of data from varying sources at run-time, it parses and presents the data to users.<br>
	The tool can be extended for configuring and managing existing lab components.<br>
	
	<h2> How, what, whic, when? </h2>
	The following concepts and technologies were mildly  explored and demonstrated in this applicatioin:
	<ul>
	<li>Java Spring Framework</li>
	<li>Model View Controller</li>
	<li>Relational Databases used for authentication and data storage</li>
	<li>JDBC + Hibernate</li>
	<li>Application Containers - Tomcat8, jetty</li>
	<li>Java Spring Security</li>
	<li>REST API</li>
	<li>Continuous Integration system</li>
	<li>Build tools - Maven and Gradle</li>
	<li>Code Review System - Gerrit</li>
	<li>Distributed Code Repository System - GIT</li>
	<li>Configuraton Management System - Chef</li>
	<li>Project Management and Bug Management System - Redmine</li>
	<li>Data Feed - RSS Integration with Java Spring Framework</li>
	<li></li>
	
	</ul>
	<button onclick="window.location.href='/spring-security-hibernate/admin'">Login and Start exploring</button></p>

	<sec:authorize access="hasRole('ROLE_USER')">
		<!-- For login user -->
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>


	</sec:authorize>
</body>
</html>
