<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%

	String id =request.getParameter("id");

	String nome = request.getParameter("nome");
	
	String categoria = request.getParameter("categoria");
	String price = request.getParameter("price");
	String active = request.getParameter("active");
	
	try{
		
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("insert into products values (?, ?, ?, ?, ?)");
		
		ps.setString(1, id);
		ps.setString(2, nome);
		ps.setString(3, categoria);
		ps.setString(4, price);
		ps.setString(5, active);
		
		ps.executeUpdate();
		response.sendRedirect("addNewProduct.jsp?msg=done");
	}
	catch(Exception e){
		
		response.sendRedirect("addNewProduct.jsp?msg=wrong");
		
	}

%>