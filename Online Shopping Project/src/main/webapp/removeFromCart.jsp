'<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%

	String email = session.getAttribute("email").toString();
	
	String idProduto = request.getParameter("id");
	
	try{
		
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		st.executeUpdate("delete from cart where email='"+email+"' and idProduto='"+idProduto+"' and endereco is NULL");

		response.sendRedirect("myCart.jsp?msg=removed");
	} catch (Exception e) {
		
	}
	
%>
