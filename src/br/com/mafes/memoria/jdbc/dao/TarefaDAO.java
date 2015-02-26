package br.com.mafes.memoria.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.asm.Type;

import br.com.mafes.memoria.jdbc.controller.ConnectionFactory;
import br.com.mafes.memoria.jdbc.modelo.Peca;
import br.com.mafes.memoria.jdbc.modelo.Tarefa;

public class TarefaDAO {

	private Connection connection;
	
	public TarefaDAO(){
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void adiciona(Tarefa tarefa) {
		String sql = "INSERT INTO tarefas " +
				"(prioridade, prioridade_roberto, status, nome, observacao, datainicio, datafim, responsavel, id_usuario, ordem, finalizado, dataFinalizado) " +
				"VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setLong(1, tarefa.getPrioridade());
			
			if(tarefa.getPrioridade_roberto()!=null)
				stmt.setLong(2, tarefa.getPrioridade_roberto());
			else
				stmt.setNull(2, Type.LONG);
			
			
			stmt.setString(3, tarefa.getStatus());
			stmt.setString(4, tarefa.getNome());
			stmt.setString(5, tarefa.getObservacao());
			
			stmt.setDate(6, new java.sql.Date(tarefa.getDatainicio().getTimeInMillis()));
			stmt.setDate(7, new java.sql.Date(tarefa.getDatafim().getTimeInMillis()));
			
			stmt.setString(8, tarefa.getResponsavel());
			stmt.setLong(9, tarefa.getId_usuario());
			stmt.setLong(10, tarefa.getOrdem());
			stmt.setBoolean(11, tarefa.getFinalizado());
			
			
			if(tarefa.getDataFinalizado() == null)
				stmt.setNull(12, Types.DATE);
			else
				stmt.setDate(12, new java.sql.Date(tarefa.getDataFinalizado().getTimeInMillis()));
			
			stmt.execute();
			stmt.close();
			
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
		
		
	}

	public void altera(Tarefa tarefa){
		String sql = "update tarefas set prioridade=?, prioridade_roberto=?, status=?, nome=?, observacao=?, datainicio=?, datafim=?, responsavel=?, id_usuario=?, ordem=?, finalizado=?, dataFinalizado=? where id=?";
				
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setLong(1, tarefa.getPrioridade());
			if(tarefa.getPrioridade_roberto()!=null)
				stmt.setLong(2, tarefa.getPrioridade_roberto());
			else
				stmt.setNull(2, Type.LONG);
			
			stmt.setString(3, tarefa.getStatus());
			stmt.setString(4, tarefa.getNome());
			stmt.setString(5, tarefa.getObservacao());
			stmt.setDate(6, new java.sql.Date(tarefa.getDatainicio().getTimeInMillis()));
			stmt.setDate(7, new java.sql.Date(tarefa.getDatafim().getTimeInMillis()));
			stmt.setString(8, tarefa.getResponsavel());
			stmt.setLong(9, tarefa.getId_usuario());
			stmt.setLong(10, tarefa.getOrdem());
			stmt.setBoolean(11, tarefa.getFinalizado());
			
			if(tarefa.getDataFinalizado() == null)
				stmt.setNull(12, Types.DATE);
			else
				stmt.setDate(12, new java.sql.Date(tarefa.getDataFinalizado().getTimeInMillis()));
			
			stmt.setLong(13, tarefa.getId());
			
			stmt.execute();
			stmt.close();
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public void exclui(Tarefa tarefa){
		try{
			PreparedStatement stmt = connection.prepareStatement("delete from tarefas where id=?");
			stmt.setLong(1, tarefa.getId());
			
			//Excluo todas as pecas relacionadas a tarefa
			PecaDAO dao = new PecaDAO();
			
			List<Peca> pecas = new ArrayList<Peca>();
			pecas = dao.getListPecasIdTarefa(tarefa.getId());
			for(Peca peca : pecas){
				dao.exclui(peca);
			}
			
			
			
			stmt.execute();
			stmt.close();
		}catch(SQLException e){
			throw new RuntimeException(e);
		}	
	}
	
	public List<Tarefa> getLista(){
		
		try{
			List<Tarefa> tarefas = new ArrayList<Tarefa>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tarefas");  
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Tarefa tarefa = new Tarefa();
				tarefa.setId(rs.getLong("id"));
				tarefa.setNome(rs.getString("nome"));
				tarefa.setPrioridade(rs.getInt("prioridade"));
				tarefa.setPrioridade_roberto(rs.getInt("prioridade_roberto"));
				tarefa.setStatus(rs.getString("status"));
				tarefa.setObservacao(rs.getString("observacao"));
				
				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("datainicio"));
				tarefa.setDatainicio(data);
				
				Calendar dataFim = Calendar.getInstance();
				
				dataFim.setTime(rs.getDate("datafim"));
				tarefa.setDatafim(dataFim);
				
				tarefa.setResponsavel(rs.getString("responsavel"));		
				tarefa.setId_usuario(rs.getLong("id_usuario"));		
				tarefa.setOrdem(rs.getLong("ordem"));
				tarefa.setFinalizado(rs.getBoolean("finalizado"));
				
				Calendar dataFinalizado = Calendar.getInstance();
				if(rs.getDate("dataFinalizado") == null)
					dataFinalizado = null;
				else
					dataFinalizado.setTime(rs.getDate("dataFinalizado"));
					
				tarefa.setDataFinalizado(dataFinalizado);
				
				tarefas.add(tarefa);
			}
			rs.close();
			stmt.close();
			return tarefas;
			
		}catch(SQLException e){
			throw new RuntimeException(e);
			
		}
	}
	
	public Tarefa getTarefa(Long id){
		try{
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tarefas WHERE id=?"); 
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			
			Tarefa tarefa = null;
			if(rs.next()){ 	
				tarefa = new Tarefa();
				
				tarefa.setId(rs.getLong("id"));
				tarefa.setNome(rs.getString("nome"));
				tarefa.setPrioridade(rs.getInt("prioridade"));
				tarefa.setPrioridade_roberto(rs.getInt("prioridade_roberto"));
				
				tarefa.setStatus(rs.getString("status"));
				tarefa.setObservacao(rs.getString("observacao"));
				
				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("datainicio"));
				tarefa.setDatainicio(data);
				
				Calendar dataFim = Calendar.getInstance();
				dataFim.setTime(rs.getDate("datafim"));
				tarefa.setDatafim(dataFim);
				
				tarefa.setResponsavel(rs.getString("responsavel"));		
				tarefa.setId_usuario(rs.getLong("id_usuario"));		
				tarefa.setOrdem(rs.getLong("ordem"));
				tarefa.setFinalizado(rs.getBoolean("finalizado"));
				
				Calendar dataFinalizado = Calendar.getInstance();
				if(rs.getDate("dataFinalizado") == null)
					dataFinalizado = null;
				else
					dataFinalizado.setTime(rs.getDate("dataFinalizado"));
					
				tarefa.setDataFinalizado(dataFinalizado);
				
				
				rs.close();
				stmt.close();
			}
		
		return tarefa;
			
		}catch(SQLException e){
			throw new RuntimeException(e);
			
		}		
	} 
	
	public List<Tarefa> getListTarefasIdUsuario(Long id_usuario){
		try{
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tarefas WHERE id_usuario=?"); 
			stmt.setLong(1, id_usuario);
			
			
			ResultSet rs = stmt.executeQuery();
			
			List<Tarefa> tarefas = new ArrayList<Tarefa>();
			
			Tarefa tarefa = null;
			while(rs.next()){ 	
				tarefa = new Tarefa();
				
				tarefa.setId(rs.getLong("id"));
				tarefa.setNome(rs.getString("nome"));
				tarefa.setPrioridade(rs.getInt("prioridade"));
				tarefa.setPrioridade_roberto(rs.getInt("prioridade_roberto"));
				
				tarefa.setStatus(rs.getString("status"));
				tarefa.setObservacao(rs.getString("observacao"));
				
				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("datainicio"));
				tarefa.setDatainicio(data);
				
				Calendar dataFim = Calendar.getInstance();
				dataFim.setTime(rs.getDate("datafim"));
				tarefa.setDatafim(dataFim);
				
				tarefa.setResponsavel(rs.getString("responsavel"));		
				tarefa.setId_usuario(rs.getLong("id_usuario"));		
				tarefa.setOrdem(rs.getLong("ordem"));
				tarefa.setFinalizado(rs.getBoolean("finalizado"));
				
				Calendar dataFinalizado = Calendar.getInstance();
				dataFinalizado.setTime(rs.getDate("dataFinalizado"));
				tarefa.setDataFinalizado(dataFinalizado);
				
				tarefas.add(tarefa);
			}
			rs.close();
			stmt.close();
		
			return tarefas;
			
			}catch(SQLException e){
				throw new RuntimeException(e);
				
			}		
	}
	
	
	public void finaliza(Tarefa tarefa){
		String sql = "update tarefas set prioridade=?, prioridade_roberto=?, status=?, nome=?, observacao=?, datainicio=?, datafim=?, responsavel=?, id_usuario=?, ordem=?, finalizado=?, dataFinalizado=? where id=?";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
					
			stmt.setLong(1, tarefa.getPrioridade());
			
			if(tarefa.getPrioridade_roberto()!=null)
				stmt.setLong(2, tarefa.getPrioridade_roberto());
			else
				stmt.setNull(2, Type.LONG);
			
			
			stmt.setString(3, tarefa.getStatus());
			stmt.setString(4, tarefa.getNome());
			stmt.setString(5, tarefa.getObservacao());
			stmt.setDate(6, new java.sql.Date(tarefa.getDatainicio().getTimeInMillis()));
			stmt.setDate(7, new java.sql.Date(tarefa.getDatafim().getTimeInMillis()));
			stmt.setString(8, tarefa.getResponsavel());
			stmt.setLong(9, tarefa.getId_usuario());
			stmt.setLong(10, tarefa.getOrdem());
			
			
			tarefa.setFinalizado(true);
			stmt.setBoolean(11, tarefa.getFinalizado());
			
			Calendar dataFinalizado = new GregorianCalendar();  
			Date date = new Date();  
			dataFinalizado.setTime(date);
			tarefa.setDataFinalizado(dataFinalizado);
			 
			stmt.setDate(12, new java.sql.Date(tarefa.getDataFinalizado().getTimeInMillis()));
			stmt.setLong(13, tarefa.getId());

			stmt.execute();
			stmt.close();
			
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
			
	}

	public Object getListaPrioridadeRobertoNull() {
		try{
			List<Tarefa> tarefas = new ArrayList<Tarefa>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tarefas");  
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Tarefa tarefa = new Tarefa();
				tarefa.setId(rs.getLong("id"));
				tarefa.setNome(rs.getString("nome"));
				tarefa.setPrioridade(rs.getInt("prioridade"));
				tarefa.setPrioridade_roberto(rs.getInt("prioridade_roberto"));
				tarefa.setStatus(rs.getString("status"));
				tarefa.setObservacao(rs.getString("observacao"));
				
				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("datainicio"));
				tarefa.setDatainicio(data);
				
				Calendar dataFim = Calendar.getInstance();
				
				dataFim.setTime(rs.getDate("datafim"));
				tarefa.setDatafim(dataFim);
				
				tarefa.setResponsavel(rs.getString("responsavel"));		
				tarefa.setId_usuario(rs.getLong("id_usuario"));		
				tarefa.setOrdem(rs.getLong("ordem"));
				tarefa.setFinalizado(rs.getBoolean("finalizado"));
				
				Calendar dataFinalizado = Calendar.getInstance();
				if(rs.getDate("dataFinalizado") == null)
					dataFinalizado = null;
				else
					dataFinalizado.setTime(rs.getDate("dataFinalizado"));
					
				tarefa.setDataFinalizado(dataFinalizado);
				
				if(tarefa.getPrioridade_roberto() == null || tarefa.getPrioridade_roberto() == 0){
					tarefa.setPrioridade_roberto(0);
					tarefas.add(tarefa);
				}
			}
			rs.close();
			stmt.close();
			return tarefas;
			
		}catch(SQLException e){
			throw new RuntimeException(e);
			
		}
	}
	
	
	public void alteraPrioridadeSako(Tarefa tarefa){
		String sql = "update tarefas set prioridade_roberto=? where id=?";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setLong(1, tarefa.getPrioridade_roberto());
			stmt.setLong(2, tarefa.getId());
		
			stmt.execute();
			stmt.close();
			
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	
}
