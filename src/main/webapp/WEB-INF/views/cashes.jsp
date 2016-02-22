<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styletables.css">
	<script src="<c:url value="/resources/js/paging.js" />"></script>
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
<title>ChashRetracteds List</title>
</head>
<body>

	<div align="center">
		<h1>Liste des CashRetracteds</h1>
		<h4 align="right">
			<a href="<c:url value="/j_spring_security_logout"/>"> Déconnexion</a>
		</h4>
		<a href="comptes">Retour</a> <br /> <br />
		<table style="align: center; width: 90%" >

			<tr>
				<th>Elements corrigés</th>
				<th>Elements En attente</th>
				<th>Total des Elements</th>
			</tr>
			<tr>
				<td>${cashRetractedBean.nbrCashesCorriges}</td>
				<td>${cashRetractedBean.totalcasehes - cashRetractedBean.nbrCashesCorriges}</td>
				<td>${cashRetractedBean.totalcasehes}</td>
			</tr>
		</table>
		<br /> <br />
		<table style="align: center; width: 90%" id="results">
			<tr>
				<th>ID</th>
				<th>Compte</th>
				<th>Date</th>
				<th>Etat de l'élément</th>
				<th>Date Correction</th>
				<th>Transaction de correction</th>
			</tr>
			<c:forEach items="${cashRetractedBean.cashes}" var="cash">
				<tr>
					<td><c:out value="${cash.id}" /></td>
					<td><c:out value="${cash.compte.rib}" /></td>
					<td><c:out value="${cash.date}" /></td>
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
