<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%

	String id = request.getParameter("id");
	String nome = request.getParameter("nome");
	String categoria = request.getParameter("categoria");
	String price = request.getParameter("price");
	String active = request.getParameter("active");
	
try{
		
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		st.executeUpdate("update products set nome='" + nome + "', categoria='"+ categoria + "', price='"+ price + "', active='"+ active + "' where id='" + id + "' ");
		
		if(active.equals("no")){
			
			st.executeUpdate("delete from cart idProduto='"+id+"' and endereco is NULL");
		
		}
		
		response.sendRedirect("allProductEditProduct.jsp?msg=done");
		
	}
	catch(Exception e){
		
		response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
		
	}

%>
