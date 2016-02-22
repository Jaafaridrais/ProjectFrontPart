<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/m.css">
	<title>Home</title>
	<script>
      function load_home(){
    	  jQuery("#contentList").load('<%= request.getContextPath() %>/WEB-INF/views/users.jsp');
  }
</script>
</head>
<body>


<div align="center">
<h2> Espace Administrateur</h2>

<br/>
<br/>
<br/>
<ul id="menu_wrap" class="White">
	<li class="button"><a href="comptes">Gestion des Comptes </a></li>
	<li class="button"><a href="transactions">Gestion des Transactions</a></li>
	<li class="button"><a href="cashes">Gestion des CashRetracteds</a></li>
	<li class="button"><a href="users" onclick="load_home()">Gestion des Utilisateurs</a></li>
	<li class="button"><a href="<c:url value="/user/index"/>">Espace Personnel</a></li>
	<li class="button"><a href="<c:url value="/j_spring_security_logout"/>"> Déconnexion</a></li>
</ul>

</div>
</body>
</html>
