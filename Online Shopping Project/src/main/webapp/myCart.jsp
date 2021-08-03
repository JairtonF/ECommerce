<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>
<%@include file ="header.jsp" %>
<%@include file ="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color:white; text-align:center; font-size: 30px;"> Carrinho de Compras <i class="fas fa-cart-arrow-down"></i></div>
<%

String msg=request.getParameter("msg");

if("notPossible".equals(msg)){
	%>
	<h3 class="alert">Só existe um item! Clique em remover!</h3>
<%
}

if ("inc".equals(msg)){
	%>
	<h3 class="alert">Quanidade adicionada com sucesso!</h3>
	<%
}

if ("dec".equals(msg)){
	%>
	<h3 class="alert">Quantidade diminuída com sucesso!</h3>
	<%
}

if ("removed".equals(msg)){
	%>
	<h3 class="alert">Produto removido!</h3>
	<%
}
%>

<table>
<thead>

	<% 
	
	int total = 0;
	int sno = 0;
	
	try{
		
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs1 = st.executeQuery(" select sum(total) from cart where email='"+ email+"' and endereco is NULL");
		
		while(rs1.next()){
			
			total=rs1.getInt(1);
			
		}
		
	%>

          <tr>
            <th scope="col" style="background-color: yellow;"> <i class="fa fa-dollar"></i> Total: <%out.println(total); %> </th>
            <% if(total>0) { %><th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><% } %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Nome do Produto </th>
            <th scope="col">Categoria </th>
            <th scope="col"><i class="fa fa-dollar"></i>Preço </th>
            <th scope="col">Quantidade </th>
            <th scope="col">Sub Total </th>
            <th scope="col">Remover <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs=st.executeQuery("select * from products inner join cart on products.id=cart.idProduto and cart.email='"+ email +"' and cart.endereco is NULL");
      
      while(rs.next()){
      
      %>
      
          <tr>
			
			<%sno=sno+1; %>
           
           <td> <% out.println(sno); %> </td>
           
            <td> <%= rs.getString(2) %> </td>
           
            <td> <%= rs.getString(3) %> </td>
           
            <td><i class="fa fa-dollar"></i> <%= rs.getString(4) %>  </td>
            
            <td><a href="incDecQuantityAction.jsp?id=<%= rs.getString(1)%>&quantidade=inc "><i class='fas fa-plus-circle'></i></a>  <%= rs.getString(8) %>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantidade=dec"><i class='fas fa-minus-circle'></i></a></td>
            
            <td><i class="fa fa-dollar"></i>  <%= rs.getString(10) %>  </td>
           
            <td><a href="removeFromCart.jsp?id=<%= rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
          
          </tr>
<%

      	}
	}
	catch(Exception e){
		
	}

%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>