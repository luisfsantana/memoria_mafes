<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="mafes" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery.js" />"></script>
	<script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Mostra detalhes da Peça</title>
</head>
<body>
	  	
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	
	<div style="position: absolute; left: 100px;">	
	  <h3>Alterar dados da peca - ${peca.id} - ${peca.nome}</h3>
	
	<table>
		<tr>
				<th>Quantidade</th>
				<th>Nome</th>
				<th>Estado</th>
				<th>Observações</th>
				<th>data</th>
				<th>Status</th>
				
		</tr>

		<tr>
		 	<td>${peca.quantidade}</td>
		 	<td>${peca.nome}</td>
		 	<td>${peca.estado}</td>
		 	<td>${peca.observacao}</td>
		 	<td><fmt:formatDate value="${peca.data.time}" pattern="dd/MM/yyyy"/></td>
		 	<td>${peca.status}</td>
		 	
		</tr>
	</table>
	<br /><br /><br />
	<form action="alteraPeca" method="post">
			Número de peças:  <input type="number" value="${peca.quantidade}" name="quantidade" min="1" max="100"><br/><br/>
			<form:errors path="peca.quantidade" cssStyle="color:red"/>
	
			Nome da peça: <input type="text" name="nome" value="${peca.nome}" size="75"/><br /><br />
				<form:errors path="peca.nome" cssStyle="color:red"/>
	
			Estado:&nbsp;&nbsp; <select name="estado">
			  <option value="Atrasada">Atrasada</option>
			  <option value="Em Processo" selected>No Prazo</option>
			  <option value="Concluida">Concluída</option>
			</select>
			<br/><br/>
			
			Observações:<br/> <textarea name="observacao" rows="5" cols="100">${peca.observacao}</textarea>
			<form:errors path="peca.observacao" cssStyle="color:red"/>
			<br /><br />
	
			<fmt:formatDate value="${peca.data.time}" pattern="dd/MM/yyyy" var="theFormattedDate" />
			Data estimada aquisição: <mafes:campoData name="data" id="data" value="${theFormattedDate}"/>
			<form:errors path="peca.data" cssStyle="color:red"/>
			
			<br /><br />
			Status: <input type="text" name="status" value="${peca.status}" size="35"/>
			<br /><br />
			<input type="hidden" name="id_tarefa" value="${peca.id_tarefa}">
			<input type="hidden" name="id" value="${peca.id}">
			
			<input type="submit" value="Alterar" />
	</form>
	<a href="logout">Sair</a>
	
	</div>
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	<c:import url="/WEB-INF/jsp/rodape.jsp" />	
</body>
</html>