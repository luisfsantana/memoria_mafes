<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<c:url value="resources/css/jquery-ui.css" />" rel="stylesheet">
	<script src="<c:url value="resources/js/jquery.js" />"></script>
	<script src="<c:url value="resources/js/jquery-ui.js" />"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/Tabela.css">
	<link rel="stylesheet" type="text/css" href="resources/css/caelum.css">
	
	<title>Lista de todas as tarefas</title>
	
	  <script type="text/javascript">
		  function finalizaAgora(id) {
		    $.post("finalizaTarefa", {'id' : id}, function(resposta) {
		      $("#tarefa_"+id).html(resposta);
		    });
		  }
</script>
	
</head>
<body>
	
		<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
		
		 
		<a href="logout">Sair do sistema</a><br/>
		
		<a href="novaTarefa">Criar nova tarefa</a> <br/><br/>
		
		<table>
			<tr>
				<th>Prioridade Sr. Roberto</th>
				<th>Prioridade</th>
				<th>Status</th>
				<th>Nome</th>
				<th>Observações</th>
				<th>Data Início</th>
				<th>Data Fim</th>
				<th>Responsável</th>
				<th>Finalizado?</th>
				
			</tr>
			 
			<!-- percorre contatos montando as linhas da tabela -->
			<c:forEach var="tarefa" items="${tarefas}">
				<tr>
					<c:choose>
						<c:when test="${tarefa.prioridade_roberto eq 1}">
	    					<td><div style="background-color: #FF0000;" >Urgente</div></td>
	  					</c:when>
	  					<c:when test="${tarefa.prioridade_roberto eq 2}">
	    					<td><div style="background-color: #FF8C00;" >Alta</div></td>
	  					</c:when>
					 	<c:when test="${tarefa.prioridade_roberto eq 3}">
	    					<td><div style="background-color: #FFD700;" >Média</div></td>
	  					</c:when>
	  					<c:when test="${tarefa.prioridade_roberto eq 4}">
	    					<td><div style="background-color: #32CD32;" >Baixa</div></td>
	  					</c:when>
	  					<c:otherwise>
	  						<td>       </td>
	  					</c:otherwise>
  					</c:choose>
  					
  					<c:if test="${tarefa.prioridade eq 1}">
    					<td><div style="background-color: #FF0000;" >Urgente</div></td>
  					</c:if>
  					<c:if test="${tarefa.prioridade eq 2}">
    					<td><div style="background-color: #FF8C00;" >Alta</div></td>
  					</c:if>
				 	<c:if test="${tarefa.prioridade eq 3}">
    					<td><div style="background-color: #FFD700;" >Média</div></td>
  					</c:if>
  					<c:if test="${tarefa.prioridade eq 4}">
    					<td><div style="background-color: #32CD32;" >Baixa</div></td>
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
					  <td id="tarefa_${tarefa.id}">
					      <a href="#" onClick="finalizaAgora(${tarefa.id})">Finalizar</a>
					  </td>
			  		</c:if>	
					
					<td>
						<fmt:formatDate value="${tarefa.dataFinalizado.time}" pattern="dd/MM/yyyy" />
					</td>
					
				 	<td>
      					<a href="removeTarefa?id=${tarefa.id}">Remover</a>
    				</td>	
    				
    				<td>
      					<a href="mostraTarefa?id=${tarefa.id}">Alterar</a>
    				</td>	
    				
    				<td>
    					<a href="novaPeca?id=${tarefa.id}">Adicionar Peça</a>	
					</td>
					
					<td>
    					<a href="listaPecasDaTarefa?id=${tarefa.id}">Exibir Lista de Peças</a>	
					</td>
				</tr>
			
				</c:forEach>
				
							
				
		</table>
		
		<c:import url="/WEB-INF/jsp/rodape.jsp" />
</body>
</html>