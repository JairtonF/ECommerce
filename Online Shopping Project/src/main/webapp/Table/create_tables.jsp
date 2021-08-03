<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%
	try{
		Connection con = ConnectionProvider.getCon();
		
		Statement st = con.createStatement();
		
		String q1 = "create table users(nome varchar(150), email varchar(100) primary key, numero bigint, securityQuestion varchar(200),resposta varchar(150), senha varchar(50), endereco varchar(250), cidade varchar(100), estado varchar(100), pais varchar(100) )";
		String q2 = "create table products(id int, nome varchar(100), categoria varchar(200), price int, active varchar(10) )";

		String q3 = "create table cart( email varchar(100), idProduto int, quantidade int, price int, total int, endereco varchar(250), cidade varchar(100), estado varchar(100), pais varchar(100), numero bigint, dataPedido varchar(100), dataRecebimento varchar(100), metodoPagamento varchar(100), idTransacao varchar(100), status varchar(10))";
		
		System.out.println(q1);
		System.out.println(q2);
		System.out.println(q3);
		
		//st.execute(q1);
		//st.execute(q2);
		st.execute(q3);
		
		System.out.println("Table created");
		
		con.close();
	}
	
	catch (Exception e){
	
		System.out.println(e);
	
	}

%>