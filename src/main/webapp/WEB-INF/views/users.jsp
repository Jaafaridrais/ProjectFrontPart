<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<html>
<head>

<title>Users List</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styletables.css">
<script src="<c:url value="/resources/js/paging.js" />">
	
	</script>
<style type="text/css">
.pg-normal {
	color: black;
	font-weight: normal;
	text-decoration: none;
	cursor: pointer;
}

.pg-selected {
	color: black;
	font-weight: bold;
	text-decoration: underline;
	cursor: pointer;
}
</style>
</head>
<body>

	<div align="center">
		<h1>Liste des Utilisateurs</h1>
		<h4 align="right">
			<a href="<c:url value="/j_spring_security_logout"/>"> Déconnexion</a>
		</h4>
		<br /> <br /> <a href="home">Retour</a> <br /> <br />

		<table style="align: center; width: 90%" id="results">
			<tr>
				<th>ID</th>
				<th>Nom Utilisateur</th>
				<th>Etat de l'élément</th>
				<th>Détails Utilisateur</th>
			</tr>
			<c:forEach items="${userBean.users}" var="user">
				<tr>
					<td><c:out value="${user.id}" /></td>
					<td><c:out value="${user.nom}" />
						<c:out value="    " />
						<c:out value="${user.prenom}" /></td>
					<c:if test="${user.active}">
						<td><c:out value=" Activé " /></td>
					</c:if>
					<c:if test="${!user.active}">
						<td><c:out value=" Bloqué " /></td>
					</c:if>
					<td><a href="userdetails?idUser=${user.id}"> Détail..</a></td>
				</tr>
			</c:forEach>
		</table>

		<br />
		<div id="pageNavPosition"></div>

		<br />
		<script type="text/javascript"><!--
        var pager = new Pager('results', 8); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    
        </script>
	</div>
</body>
</html>
