package br.com.mafes.memoria.jdbc.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	public Connection getConnection(){
		try{
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());    

			return DriverManager.getConnection("jdbc:mysql://27.8.199.130/memoria", "adminEvmjQNp", "X3iC-KuPKIeu");

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
}
