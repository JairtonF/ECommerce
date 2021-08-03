<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%

	String email =request.getParameter("email");

	String senha = request.getParameter("senha");
	
	if("admin@gmail.com".equals(email) && "admin".equals(senha)){
		
		session.setAttribute("email", email);
		
		response.sendRedirect("admin/adminHome.jsp");  
	
	}
	
	else {
		int z = 0;
		
		try {
			
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from users where email='"+ email +"' and senha ='"+ senha +"'");
			
			while(rs.next()) {
				
				z=1;
				
				session.setAttribute("email", email);
				response.sendRedirect("home.jsp");
			}
			
			if(z==0){
				
				response.sendRedirect("login.jsp?msg=notexist");
			
			}
		}
		catch (Exception e){
			
			System.out.println(e);
			response.sendRedirect("login.jsp?msg=invalid");
		
		}
	}

%>