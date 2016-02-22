<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<html>
<head>
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styletables.css">
<title>Détails Utilisateur</title>
</head>
<body>
<div align="center">
<br/>
<br/>
<br/>
<br/>
<h2>Détails du Compte</h2>

	<f:form modelAttribute="compteBean" action="editCompte"	method="POST" enctype="multipart/form-data">
		<table border="1">
			<tr align="center">
				<td>Rib Compte :</td>
				<td><f:input type="text" path="selected.rib"/></td>
			</tr>
			<tr align="center">
				<td>date Ouverture :</td>
				<td><f:input type="text" path="selected.dateOuverture"/></td>
			</tr>
			<tr align="center">
				<td>Solde : </td>
				<td><f:input type="text" path="selected.solde"/></td>
			</tr>
			<tr align="center">
				<td>Type de Compte :</td>
				<td>
				<f:input type="text" path="selected.type" /></td>
			</tr>
			<tr align="center">
				<td><input type="submit" value="Enregistrer" /></td>
				<td><a href="comptes">
				<input type="button"  value="Retour"/> 
				 </a></td>
			</tr>
		</table>
	</f:form>
</div>
</body>
</html>