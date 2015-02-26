<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="mafes" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery.js" />"></script>
	<script src="<c:url value="/resources/js/jquery-ui.js" />"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Prioridades</title>
	
	
	<script type="text/javascript">
		  function submete(id) {
			var prioridade_roberto = document.getElementById("prioridade_roberto").value;  
		    $.post("adicionarPrioridade_roberto", {'id' : id, 'prioridade_roberto' : prioridade_roberto}, function(resposta) {
		      $("#tarefa_"+id).html(resposta);
		    });
		  }
	</script>
	
</head>
<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	<div style="position: absolute; left: 0px;">
	<a href="logout">Sair do sistema</a><br/>
		
	
	<h3>Prioridade tarefa</h3>
		
	
	<table>
			<tr>
				<th>Prioridade Roberto Sako</th>
				<th>Prioridade do Responsável</th>
				<th>Status</th>
				<th>Nome</th>
				<th>Observações</th>
				<th>Data Início</th>
				<th>Data Fim</th>
				<th>Responsável</th>
				<th>Finalizada?</th>
				
			</tr>
			 
			<!-- percorre contatos montando as linhas da tabela -->
			<c:forEach var="tarefa" items="${tarefas}">
				<tr>
					<td>
						<select id="prioridade_roberto" name="prioridade_roberto">
						  <option value="1" style="background-color: red">Urgente</option>
						  <option value="2" style="background-color: orange">Alta</option>
						  <option value="3" style="background-color: yellow">Média</option>
						  <option value="4" style="background-color: blue">Baixa</option>
						</select>
					</td>
				 	
				 	<c:if test="${tarefa.prioridade eq 1}">
    					<td>Urgente</td>
  					</c:if>
  					<c:if test="${tarefa.prioridade eq 2}">
    					<td>Alta</td>
  					</c:if>
				 	<c:if test="${tarefa.prioridade eq 3}">
    					<td>Média</td>
  					</c:if>
  					<c:if test="${tarefa.prioridade eq 4}">
    					<td>Baixa</td>
  					</c:if>
				 	
				 	
				 	
					<td>${tarefa.status}</td>
				 	<td>${tarefa.nome}</td>
					<td>${tarefa.observacao}</td>
					<td><fmt:formatDate value="${tarefa.datainicio.time}" pattern="dd/MM/yyyy"/></td>
				 	<td><fmt:formatDate value="${tarefa.datafim.time}" pattern="dd/MM/yyyy"/></td>
				 	<td>${tarefa.responsavel}</td>
				 	
				 	<c:if test="${tarefa.finalizado eq true}">
    					<td>Finalizada</td>
  					</c:if>
  					<c:if test="${tarefa.finalizado eq false}">
    					<td>Não finalizada</td>
  					</c:if>
  					
  					<c:set var="number1" value="${0}"/>
						
  					<c:choose>
  						<c:when test="${tarefa.prioridade_roberto eq number1}">
	    					<td id="tarefa_${tarefa.id}">
							      <a href="#" onClick="submete(${tarefa.id})">Atribuir Prioridade</a>
							   
							</td>
						</c:when>
	  					<c:otherwise>
	    					<td id="tarefa_${tarefa.id}">
							      Já atribuída.
							</td>
						</c:otherwise>
					</c:choose>
			</tr>
			
			</c:forEach>
	</table>	
	</div>	
	
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<c:import url="/WEB-INF/jsp/rodape.jsp" />
</body>
</html>