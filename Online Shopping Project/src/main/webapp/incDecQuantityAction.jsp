<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>
<%

String email = session.getAttribute("email").toString();

String idProduto = request.getParameter("id");

String incdec = request.getParameter("quantidade");

int price=0;
int total=0;
int quantidade=0;
int finalTotal=0;

try{
	
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("select * from cart where email='" +email+ "' and idProduto='" +idProduto+ "' and endereco is NULL");
	
	while(rs.next()){
		
		price = rs.getInt(4);
		total = rs.getInt(5);
		quantidade = rs.getInt(3);
		
	}
	if (quantidade==1 && incdec.equals("dec")){
		
		response.sendRedirect("myCart.jsp?msg=notPossible");
	
	} else if (quantidade!=1 && incdec.equals("dec")){
		
		total = total-price;
		quantidade = quantidade-1;
		st.executeUpdate("update cart set total='"+ total +"', quantidade='" + quantidade + "' where email='" + email + "' and idProduto='" + idProduto + "' and endereco is NULL ");
		
		response.sendRedirect("myCart.jsp?msg=dec");
		
	} else {
		
		total = total+price;
		quantidade = quantidade+1;
		st.executeUpdate("update cart set total='" + total + "', quantidade='" + quantidade + "' where email='" + email + "' and idProduto='" + idProduto + "' and endereco is NULL ");
		
		response.sendRedirect("myCart.jsp?msg=inc");
	}
	
} catch (Exception e){
	System.out.println(e);
	
}

%>