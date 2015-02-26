<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	
	<div align="center">
		<h2>
			Bem-Vindo ao sistema de gerenciamento de Projetos<br/>
		</h2>
		
		<h3>Mafes Inteligência Agronômica <br/> <br/>
			<a href="loginForm">Área de Login</a><br /><br />
		</h3>
	</div>
	
	<c:import url="/WEB-INF/jsp/rodape.jsp" />
</body>
</html>