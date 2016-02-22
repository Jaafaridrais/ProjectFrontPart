<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/styletables.css">
<title>Mon Profil</title>
</head>
<body>
	<h2 align="center">Bonjour ${loginBean.connected.nom }
		${loginBean.connected.prenom }</h2>

	<div align="center">
		<table style="border: 1; width: 50%">
			<tr align="center">
				<th colspan="2">
					<h3>Service solde du compte à la date du : ${dateJ}</h3>
				</th>
			</tr>
			<tr align="center">
				<td>Compte N° :</td>
				<td>${ loginBean.compte.rib}</td>
			</tr>
			<tr align="center">
				<td>Date solde :</td>
				<td>${ derniereTrans }</td>
			</tr>
			<tr align="center">
				<td>Solde :</td>
				<td>${loginBean.compte.solde }</td>
			</tr>
		</table>
		<br /> <br /> <br />
		<table>
			<tr>
				<td><a href="histo">Historique</a></td>
				<td><a href="myCashes">CashRetracteds</a></td>
				<td><a href="hideInfo">Masquer informations</a></td>
			<c:if test="${loginBean.admin}">
				<td><a href="<c:url value="/admin/index"/>">Espace Administrateur</a></td>
			</c:if>
				<td><a href="<c:url value="/j_spring_security_logout"/>"> Déconnexion</a></td>
			</tr>
		</table>
	<br/>
<br/>
<br/>
<br/>


		<c:if test="${loginBean.choix eq 1}">
			<div>
				<table border="1">
					<tr align="center">
						<th>ID Transaction</th>
						<th>Date Transaction</th>
						<th>Montant</th>
						<th>Type de Transactionq</th>
					</tr>
					<c:forEach items="${loginBean.trans}" var="trs">
						<tr align="center">
							<td><c:out value="${trs.id}" /></td>
							<td><c:out value="${trs.date}" /></td>
							<td><c:out value="${trs.montant}" /></td>
							<td><c:out value="${trs.type}" /></td>
						</tr>
					</c:forEach>
				</table>

			</div>
		</c:if>
		<c:if test="${loginBean.choix eq 2}">
			<div>
				<table border="1">

					<tr align="center">
						<th>Elements corrigés</th>
						<th>Elements En attente</th>
						<th>Total des Elements</th>
					</tr>
					<tr align="center">
						<td>${cashRetractedBean.nbrCashesCorriges}</td>
						<td>${cashRetractedBean.totalcasehes - cashRetractedBean.nbrCashesCorriges}</td>
						<td>${cashRetractedBean.totalcasehes}</td>
					</tr>
				</table>
				<br /> <br />
				<table border="1">
					<tr align="center">
						<th>ID</th>
						<th>Date</th>
						<th>Montant</th>
						<th>Etat de l'élément</th>
						<th>Date Correction</th>
						<th>Transaction de correction</th>
					</tr>
					<c:forEach items="${cashRetractedBean.cashes}" var="cash">
						<tr align="center">
							<td><c:out value="${cash.id}" /></td>
							<td><c:out value="${cash.date}" /></td>
							<td><c:out value="${cash.transaction.montant}" /></td>
							<td><c:out value="${cash.etat}" /></td>

							<c:if test="${empty cash.dateCorrection}">
								<td><c:out value=" - " /></td>
								<td><c:out value=" - " /></td>
							</c:if>
							<c:if test="${ not empty cash.dateCorrection}">
								<td><c:out value="${cash.dateCorrection}" /></td>
								<td><c:out value="${cash.transactionCorrection.id}" /></td>
							</c:if>

						</tr>
					</c:forEach>
				</table>
			</div>
		</c:if>
	</div>
</body>
</html>
