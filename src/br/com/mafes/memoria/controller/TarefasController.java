package br.com.mafes.memoria.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.mafes.memoria.jdbc.dao.TarefaDAO;
import br.com.mafes.memoria.jdbc.dao.UsuarioDAO;
import br.com.mafes.memoria.jdbc.modelo.Tarefa;
import br.com.mafes.memoria.jdbc.modelo.Usuario;

@Controller
public class TarefasController {
	
	@RequestMapping("novaTarefa")
	public String form(Model model, HttpSession session){
		
		
		Object usuarioO = session.getAttribute("usuarioLogado");
		
		Usuario usuario = (Usuario) usuarioO;
		
		UsuarioDAO dao = new UsuarioDAO();
		
		
		Usuario usuarioId = dao.getUsuarioLoginSenha(usuario.getLogin(), usuario.getSenha());
		
		model.addAttribute("usuario", usuarioId);
		
		return "tarefa/adiciona-tarefa";
	}
	
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {
		  
		if(result.hasErrors()){
			return "tarefa/adiciona-tarefa";
		}
		
		TarefaDAO dao = new TarefaDAO();
		dao.adiciona(tarefa);
		
		return "tarefa/adicionada";
		
	}

	@RequestMapping("listaTarefas")
	public String lista(Model model){
		TarefaDAO dao = new TarefaDAO();
		model.addAttribute("tarefas", dao.getLista());
		
		return "tarefa/lista";
	}
	
	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) {
	  TarefaDAO dao = new TarefaDAO();
	  dao.exclui(tarefa);
	  return "redirect:listaTarefas";
	}
	
	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model) {
	  TarefaDAO dao = new TarefaDAO();
	  model.addAttribute("tarefa", dao.getTarefa(id));
	  return "tarefa/mostra";
	}
	
	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa) {
	  TarefaDAO dao = new TarefaDAO();
	  dao.altera(tarefa);
	  
	  return "redirect:listaTarefas";
	}
	
	@RequestMapping("finalizaTarefa")
	public String finaliza(Long id, Model model) {
	  TarefaDAO dao = new TarefaDAO();
	  Tarefa tarefa = dao.getTarefa(id);
	  dao.finaliza(tarefa);
	  model.addAttribute("tarefa", dao.getTarefa(id));
	  return "tarefa/finalizada";
	}
	
	@RequestMapping("adicionaPrioridade_robertoForm")
	public String adicionaPrioridadeForm(Model model){
		TarefaDAO dao = new TarefaDAO();
		model.addAttribute("tarefas", dao.getListaPrioridadeRobertoNull());
		
		
		return "tarefa/adiciona-prioridade";
	}
	
	@RequestMapping("adicionarPrioridade_roberto") 
	public String alterarPrioridade_roberto(Tarefa tarefa){
		
		TarefaDAO dao = new TarefaDAO();
		dao.alteraPrioridadeSako(tarefa);
		
		return "tarefa/prioridade-submetida";
	}
}
