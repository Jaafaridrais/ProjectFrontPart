<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<html>
<head>
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
<title>Comptes Clients</title>
</head>
<body>
<div align="center">
	<h1>Liste des Comptes</h1>
<h4 align="right"> <a href="<c:url value="/j_spring_security_logout"/>"> Déconnexion</a></h4>
	<a href="home" style="align: center">Retour..</a>
	<br />
	<br />
	<br />
	<table border="1" style="width: 90%" id="results">
		<tr align="center">
			<th>RIB</th>
			<th>Date Ouverture</th>
			<th>Type</th>
			<th>Propriétaire</th>
			<th colspan="3">Gestion du Compte</th>
		</tr>
		<c:forEach items="${compteBean.comptes}" var="compte">
			<tr align="center">
				<td><c:out value="${compte.rib}" /></td>
				<td><c:out value="${compte.dateOuverture}" /></td>

				<td><c:out value="${compte.user.nom}" />
					<c:out value="  " /> <c:out value="${compte.user.prenom}" /></td>
				<td><c:out value="${compte.type}" /></td>
				<td><a href="comptedetails?rib=${compte.rib}">Détails</a></td>
				<td><a href="trans?rib=${compte.rib}">Historique</a></td>
				<td><a href="comptecashes?rib=${compte.rib}">CashRetracteds</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
		   <div id="pageNavPosition"></div>
          
		 <br />
		  <script type="text/javascript"><!--
        var pager = new Pager('results', 6); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    
        </script>
        </div>
</body>
</html>
