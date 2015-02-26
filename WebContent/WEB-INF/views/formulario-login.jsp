<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">
	
	<title>Login Usuário Mafes</title>
</head>
<body>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
		<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	
			<h1>Página de Login</h1>
			<hr />
		<div style="position: absolute; left: 100px;">	
		
			<form action="efetuaLogin" method="post" >
				Login: <input type="text" name="login" size="50"/><br /><br />
				Senha: <input type="password" name="senha" size="25"/><br /><br />
				
				<a href="resetSenhaForm">Esqueceu a senha</a><br /><br />
		
				
				<input type="submit" value="Entrar" />
			</form>
		</div>	
		
		<c:import url="/WEB-INF/jsp/rodape.jsp" />
		
</body>
</html>