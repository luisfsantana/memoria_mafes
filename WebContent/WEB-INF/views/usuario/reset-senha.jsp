<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reset Senha</title>

	<script>   
		function validarSenha(){   
			var senha1 = document.getElementById("senha1");
			var senha2 = document.getElementById("senha2");  
	  
			if (senha1 == senha2){
				alert("SENHAS IGUAIS"); 
				 
			}else   
				alert("SENHAS DIFERENTES");   
		}   
	</script>   

</head>
<body>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	
	
	

	<form id="formulario" action="resetSenha" method="post">
		<label>Login: <input type="text" id="login" name="login"/></label><br/><br/>
		<label>Nova Senha: <input type="password" id="senha1" name="senha"/></label><br/><br/>
		<label>Confirmar senha: <input type="password" id="senha2" /></label><br/><br/>
		<input type="submit" value="Salvar" onclick="validarSenha()"/>
	</form>
	
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<c:import url="/WEB-INF/jsp/rodape.jsp" />

</body>
</html>