<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/styletables.css">
<title>Détails Utilisateur</title>
</head>
<body>
<div align="center">
<br/>
<br/>
<br/>
<h2>Détails Utilisateur</h2>
<br/>
	<f:form modelAttribute="userBean" action="editUser"	method="POST" enctype="multipart/form-data">
		<table style="width : 70%">
			<tr>
				<td>ID Utilisateur :</td>
				<td><f:input type="text" path="selected.id"/></td>
			</tr>
			<tr >
				<td>Nom :</td>
				<td><f:input type="text" path="selected.nom"/></td>
			</tr>
			<tr >
				<td>Prénom : </td>
				<td><f:input type="text" path="selected.prenom"/></td>
			</tr>
			<tr >
				<td>Etat :</td>
				<td>
				<f:checkbox path="selected.active" value="#{selected.active }"/></td>
			</tr>
			<tr >
				<td><input type="submit" value="Enregistrer" /></td>
				<td><a href="users">
				<input type="button"  value="Retour"/> 
				 </a></td>
			</tr>
		</table>
	</f:form>
	</div>
</body>
</html>