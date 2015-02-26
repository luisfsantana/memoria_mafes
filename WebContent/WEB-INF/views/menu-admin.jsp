<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Menu Administrador</title>
</head>
<body>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
		<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
		
		<div style="position: absolute; left: 100px;">
		<a href="logout">Sair do sistema</a>
		<h2>Página inicial da Lista de Tarefas</h2>
	    <p>Bem vindo, ${usuarioLogado.login}</p> 
	    
	    <a href="listaTarefas">Clique aqui</a> para acessar a lista de tarefas <br/><br/>
	    <a href="novoUsuario">Adicionar Usuário</a><br/><br/>
	    <a href="adicionaPrioridade_robertoForm">Clique aqui</a> para adicionar as prioridades <br/><br/>
	    </div>
	    <br/><br/><br/><br/>
	    <c:import url="/WEB-INF/jsp/rodape.jsp" />

</body>
</html>