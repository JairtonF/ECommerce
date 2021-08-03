<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%@include file ="footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>

<%
	String email=session.getAttribute("email").toString();

try{
	
	int total=0;
	int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill' ");
	
	while(rs.next()){
		total=rs.getInt(1);
	}
	
	ResultSet rs2 = st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill' ");

	while(rs2.next()){
		
	%>


<h3>Joyeria Acess�rios Online</h3>
<hr>
<div class="left-div"><h3>Nome: <%=rs2.getString(1)%> </h3></div>
<div class="right-div-right"><h3> <% out.println(email); %> </h3></div>
<div class="right-div"><h3>Telefone celular: <%=rs2.getString(20)%> </h3></div>  

<div class="left-div"><h3>Data do Pedido: <%=rs2.getString(21)%> </h3></div>
<div class="right-div-right"><h3>M�todo de Pagamento: <%=rs2.getString(23)%> </h3></div>
<div class="right-div"><h3>Expectativa de Entrega: <%=rs2.getString(22)%> </h3></div> 

<div class="left-div"><h3>Pix: <%=rs2.getString(24)%> </h3></div>
<div class="right-div-right"><h3>Cidade: <%=rs2.getString(17)%> </h3></div> 
<div class="right-div"><h3>Endere�o: <%=rs2.getString(16)%> </h3></div> 

<div class="left-div"><h3>Estado: <%=rs2.getString(18)%> </h3></div>
<div class="right-div-right"><h3>Pa�s: <%=rs2.getString(19)%> </h3></div>  


<hr>

<%	break;} %>
	
	<br>
	
<table id="customers">
<h3>Detalhes do Produto</h3>
  <tr>
    <th>S.No</th>
    <th>Nome do Produto</th>
    <th>Categoria</th>
    <th>Pre�o</th>
    <th>Quantidade</th>
     <th>Sub Total</th>
  </tr>
  
  <%
  	ResultSet rs1=st.executeQuery(" select * from cart inner join products where cart.idProduto=products.id and cart.email='"+email+"' and cart.status='bill' ");
  
  	while(rs1.next()){
  		sno=sno+1;
  %>
  
  <tr>
    <td> <% out.println(sno); %> </td>
    <td> <%= rs1.getString(17) %> </td>
    <td> <%= rs1.getString(18) %> </td>
    <td> <%= rs1.getString(19) %> </td>
    <td> <%= rs1.getString(3) %> </td>
     <td> <%= rs1.getString(5) %> </td>
  </tr>
  <tr>
  
<% } %>

</table>
<h3>Total: <%out.println(total); %>.00 </h3>
<a href="home.jsp"><button class="button left-button">Continue comprando</button></a>
<a onclick="window.print();"><button class="button right-button">Imprima</button></a>
<br><br><br><br>

<% 

}catch (Exception e){
	
	System.out.println(e);

}

%>

</body>
</html>