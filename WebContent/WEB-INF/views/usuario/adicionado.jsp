<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Sucesso</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	
	
	<h2>Usuario Adicionado!</h2>
	<a href="logout">Sair do sistema</a><br/>
	<a href=novoUsuario> Novo Usuário </a><br/><br/>
	<a href=loginForm>Àrea de Login</a>
		
	<c:import url="/WEB-INF/jsp/rodape.jsp" />
</body>
</html>