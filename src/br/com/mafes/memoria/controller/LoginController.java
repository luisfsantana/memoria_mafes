package br.com.mafes.memoria.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.mafes.memoria.jdbc.dao.UsuarioDAO;
import br.com.mafes.memoria.jdbc.modelo.Usuario;

@Controller
public class LoginController {
	
	@RequestMapping("loginForm")
	public String loginForm(){
		return "formulario-login";
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session){
		UsuarioDAO dao = new UsuarioDAO();
		if(dao.existeUsuario(usuario)){
			session.setAttribute("usuarioLogado", usuario);
			usuario = dao.getUsuarioLoginSenha(usuario.getLogin(), usuario.getSenha());
			if(usuario.getGrupo().equals("Comum") || usuario.getGrupo().isEmpty())
				return "menu";
			else
				return "menu-admin"; 
		}
		return "redirect:loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
	  session.invalidate();
	  return "redirect:loginForm";
	}
}
