<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%

String email=session.getAttribute("email").toString();

String endereco = request.getParameter("endereco");
String cidade = request.getParameter("cidade");
String estado = request.getParameter("estado");
String pais = request.getParameter("pais");
String numero = request.getParameter("numero");
String metodoPagamento = request.getParameter("metodoPagamento");
String idTransacao = request.getParameter("transactionId");

String status = "bill";

try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update users set endereco=?, cidade=?, estado=?, pais=?, numero=? where email=? ");
	
	ps.setString(1, endereco);
	ps.setString(2, cidade);
	ps.setString(3, estado);
	ps.setString(4, pais);
	ps.setString(5, numero);
	ps.setString(6, email);
	
	ps.executeUpdate();
	
	PreparedStatement ps1 = con.prepareStatement("update cart set  endereco=?, cidade=?, estado=?, pais=?, numero=?, dataPedido=now(), dataRecebimento=DATE_ADD(dataPedido, INTERVAL 7 DAY), metodoPagamento=?, idTransacao=?, status=? where email=? and endereco is NULL ");
	
	ps1.setString(1, endereco);
	ps1.setString(2, cidade);
	ps1.setString(3, estado);
	ps1.setString(4, pais);
	ps1.setString(5, numero);
	ps1.setString(6, metodoPagamento);
	ps1.setString(7, idTransacao);
	ps1.setString(8, status);
	ps1.setString(9, email);
	
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
	
} catch (Exception e){
	System.out.println(e);
}

%>