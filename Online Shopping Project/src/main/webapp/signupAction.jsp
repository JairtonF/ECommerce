<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%

	String nome = request.getParameter("nome");
	String email = request.getParameter("email");
	String numero = request.getParameter("numero");
	String securityQuestion = request.getParameter("securityQuestion");
	String resposta = request.getParameter("resposta");
	String senha = request.getParameter("senha");
	
	String endereco ="";
	String cidade ="";
	String estado ="";
	String pais ="";

	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("insert into users values(?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
		
		ps.setString(1, nome);
		ps.setString(2, email);
		ps.setString(3, numero);
		ps.setString(4, securityQuestion);
		ps.setString(5, resposta);
		ps.setString(6, senha);
		ps.setString(7, endereco);
		ps.setString(8, cidade);
		ps.setString(9, estado);
		ps.setString(10, pais);
		
		ps.executeUpdate();
		response.sendRedirect("signup.jsp?msg=valid");
	}
	catch (Exception e){
		
		System.out.println(e);
		
		response.sendRedirect("signup.jsp?msg=invalid");
	}
%>