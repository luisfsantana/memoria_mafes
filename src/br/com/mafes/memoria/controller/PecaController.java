package br.com.mafes.memoria.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.mafes.memoria.jdbc.dao.PecaDAO;
import br.com.mafes.memoria.jdbc.dao.TarefaDAO;
import br.com.mafes.memoria.jdbc.modelo.Peca;
import br.com.mafes.memoria.jdbc.modelo.Tarefa;

@Controller
public class PecaController {
	
	@RequestMapping("novaPeca")
	public String form(Tarefa tarefa, Model model){
		
		model.addAttribute("id_tarefa", tarefa.getId());
			
		return "peca/adiciona-peca";
	}
	
	
	
	
	@RequestMapping("listaPecas")
	public String lista(Model model){
		PecaDAO dao = new PecaDAO();
		model.addAttribute("pecas", dao.getLista());
		
		return "peca/lista";
	}
	
	@RequestMapping("listaPecasDaTarefa")
	public String listaTarefa(Model model, Tarefa tarefa){
		PecaDAO dao = new PecaDAO();
		
		model.addAttribute("pecas", dao.getListPecasIdTarefa(tarefa.getId()));
		
		return "peca/lista";
	}
	
	
	@RequestMapping("adicionaPeca")
	public String adiciona(@Valid Peca peca, BindingResult result, Model model) {
		  
		if(result.hasErrors()){
			return "peca/adiciona-peca";
		}
		
		PecaDAO dao = new PecaDAO();
		dao.adiciona(peca);
		
		Long id = peca.getId_tarefa();
		
		return "redirect:listaPecasDaTarefa?id="+id;
		
	}
	
	@RequestMapping("removePeca")
	public String remove(Peca peca) {
	  PecaDAO dao = new PecaDAO();
	  dao.exclui(peca);
	  return "redirect:listaPecas";
	}
	
	@RequestMapping("mostraPeca")
	public String mostra(Long id, Model model) {
	  PecaDAO dao = new PecaDAO();
	  model.addAttribute("peca", dao.getPeca(id));
	  return "peca/mostra";
	}
	
	@RequestMapping("alteraPeca")
	public String altera(@Valid Peca peca, BindingResult result) {
		
		if(result.hasErrors()){
			Long id = peca.getId();
			return "redirect:mostraPeca?id="+id;
		}	
		
	  PecaDAO dao = new PecaDAO();
	  dao.altera(peca);
	  return "redirect:listaPecas";
	}
	
}
