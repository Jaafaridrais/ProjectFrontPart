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
<title>Transactions List</title>
</head>
<body>
	<div align="center">
		<h1>Liste des Transactions</h1>
		<h4 align="right">
			<a href="<c:url value="/j_spring_security_logout"/>"> Déconnexion</a>
		</h4>

		<a href="comptes">Retour</a> <br /> <br /> <br />
	
		<table style="align: center; width: 90%" id="results">
			<tr>
				<th>ID Transaction</th>
				<th>Compte</th>
				<th>Date Transaction</th>
				<th>Type de Transactionq</th>
			</tr>
			<c:forEach items="${transactionBean.transactions}" var="trs">
				<tr>
					<td><c:out value="${trs.id}" /></td>
					<td><c:out value="${trs.compte.rib}" /></td>
					<td><c:out value="${trs.date}" /></td>
					<td><c:out value="${trs.type}" /></td>
				</tr>
			</c:forEach>
		</table>
		<br />
		   <div id="pageNavPosition"></div>
          
		 <br />
		  <script type="text/javascript">
        var pager = new Pager('results', 10); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    
        </script>
	</div>
</body>
</html>
