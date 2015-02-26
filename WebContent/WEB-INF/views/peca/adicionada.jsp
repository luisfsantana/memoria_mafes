<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Peça Adicionada</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	
	<a href="logout">Sair do sistema</a><br/>
	<h2>Peça Adicionada!</h2>
	<a href="listaPecasDaTarefa?id=${tarefa.id}">Listar as peças da tarefa.</a>
		
	<c:import url="/WEB-INF/jsp/rodape.jsp" />
</body>
</html>