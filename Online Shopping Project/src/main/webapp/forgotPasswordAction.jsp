<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%

String email =request.getParameter("email");

String numero = request.getParameter("numero");

String securityQuestion =request.getParameter("securityQuestion");

String resposta =request.getParameter("resposta");

String novaSenha = request.getParameter("novaSenha");

int check = 0;

try {
	
	Connection con = ConnectionProvider.getCon();
	
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("select * from users where email='"+ email +"' and numero ='"+ numero +"' and securityQuestion ='"+ securityQuestion +"' and resposta ='"+ resposta +"' ");
	
	while(rs.next()){
		
		check=1;
		
		st.executeUpdate("update users set senha='"+novaSenha+"' where email ='"+ email +"' ");
		
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	
	if(check==0){
		
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
		
	}
	
	
} catch (Exception e){
	
	System.out.println(e);
	
}

%>