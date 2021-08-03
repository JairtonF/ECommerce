<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%

	String email=session.getAttribute("email").toString();
	String idProduto = request.getParameter("id");
	
	int quantidade = 1;
	int precoProduto = 0;
	int precoTotal= 0;
	int cartTotal = 0;
	
	int z = 0;
	try{
		
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from products where id='"+idProduto+"' ");

		while(rs.next()){
			
			precoProduto = rs.getInt(4);
			precoTotal=precoProduto;
		
		}
		
		ResultSet rs1=st.executeQuery("select * from cart where idProduto='" +idProduto+ "' and email='" +email+ "' and endereco is NULL");
		
		while(rs1.next()){
			
			cartTotal = rs1.getInt(5);
			cartTotal = cartTotal+precoProduto;
			
			quantidade = rs1.getInt(3);
			
			quantidade = quantidade+1;
			
			z=1;
			
		}
		if(z==1){
			st.executeUpdate("update cart set total='"+cartTotal+"', quantidade='"+ quantidade+"' where idProduto='" +idProduto+ "' and email='"+email+"' and endereco is NULL");
			response.sendRedirect("home.jsp?msg=exist");
		}
		if(z==0){
			PreparedStatement ps=con.prepareStatement("insert into cart(email, idProduto, quantidade, price, total) values(?, ?, ?, ?, ?)");
			
			ps.setString(1, email);
			ps.setString(2, idProduto);
			ps.setInt(3, quantidade);
			ps.setInt(4, precoProduto);
			ps.setInt(5, precoTotal);
			
			ps.executeUpdate();
			response.sendRedirect("home.jsp?msg=added");
		}
	
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("home.jsp?msg=invalid");
	}

%>