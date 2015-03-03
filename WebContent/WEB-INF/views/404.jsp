<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>404</title>
</head>
<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />

	<div style="position: absolute; left: 100px;">
		<h2>
			Desculpe, essa página não está disponível.
		</h2>
		<h3>
			O link que você seguiu pode estar quebrado ou a página pode ter sido removida.
		</h3>
		
		<a href="listaTarefas">Clique aqui</a> para acessar a lista de tarefas<br/><br/>
		<a href="logout">Sair</a>
		
		
	</div>
	<c:import url="/WEB-INF/jsp/rodape.jsp" />
	
</body>
</html>