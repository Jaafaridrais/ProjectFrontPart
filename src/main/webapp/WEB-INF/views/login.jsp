<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>ZJS Bienvenue</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
</head>
<body>

<br/>
<br/>
<br/>
<div class="container">
	<section id="content">
		<form   action="j_spring_security_check"	method="POST"  >
			<h1>Accés Utilisateur</h1>
			<div>
				<input type="text" name="j_username"  id="username"/>
				
			</div>
			<div>
				<input type="password" name="j_password" id="password" />
			</div>
			<div>
				<input type="submit" value="Log in" />
			</div>
		</form>
		
		<div class="button">
			<a href="#">Mot de Passe oublié ?</a>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>