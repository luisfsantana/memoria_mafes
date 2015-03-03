<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Erro</title>
	
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	<div style="position: absolute; left: 100px;">
		<h2>Desculpe, mas um erro interno ocorreu. Contate o administrador do sistema.</h2>
		<h3>Envie um email para lsantana@mafes.com.br reportando o erro.</h3>
	</div>
	<c:import url="/WEB-INF/jsp/rodape.jsp" />
	
</body>
</html>