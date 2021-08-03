<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>
<%@include file ="adminHeader.jsp" %>
<%@include file ="../footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Todos os produtos & Editar Produtos <i class='fab fa-elementor'></i></div>

<% 

	String msg = request.getParameter("msg");

if("done".equals(msg)){
	  %>
	  
	  <h1>Produto alterado com sucesso</h1>
	  
	  <% 
}
if("wrong".equals(msg)){
	  
	  %>
	  
	  <h1>Alguma coisa deu errado! Tente novamente!</h1><%
	  
}

%>


<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Nome</th>
            <th scope="col">Categoria</th>
            <th scope="col"><i class="fa fa-dollar"></i> Pre�o</th>
            <th>Status</th>
            <th scope="col">Editar <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
        
        <% 
        
        try{
    		
    		Connection con = ConnectionProvider.getCon();
    		Statement st = con.createStatement();
    		ResultSet rs = st.executeQuery("select * from products");
    		
    		while(rs.next()){
    		%>	
        
          <tr>
            <td> <%= rs.getString(1) %> </td>
            <td> <%= rs.getString(2) %> </td>
            <td> <%= rs.getString(3) %> </td>
            <td><i class="fa fa-dollar"></i> <%= rs.getString(4) %>.00 </td>
            <td> <%= rs.getString(5) %> </td>
            <td><a href="editProduct.jsp?id=<%= rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
          
          <%
    		}
        } catch (Exception e) {
        	
        	System.out.println(e);
        
        }
          %>
         
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>