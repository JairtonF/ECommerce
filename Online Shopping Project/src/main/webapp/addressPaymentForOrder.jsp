<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>

<%@include file ="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>

<script>

if(window.history.forward(1) !=null){
	window.history.forward(1);
}

</script>

</head>
<body>
<br>
<table>
<thead>

<%
	String email=session.getAttribute("email").toString();
	int total=0;
	int sno=0;
	
try{
		
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs1 = st.executeQuery(" select sum(total) from cart where email='"+ email+"' and endereco is NULL");
		
		while(rs1.next()){
			
			total=rs1.getInt(1);
			
		}
%>

          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Voltar</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-dollar"></i> <%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Nome do Produto</th>
            <th scope="col">Categoria</th>
            <th scope="col"><i class="fa fa-dollar"></i> Preço</th>
            <th scope="col">Quantidade</th>
            <th scope="col">Sub Total</th>
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
            <td> <%= rs.getString(3) %>  </td>
            <td><i class="fa fa-dollar"></i> <%= rs.getString(4) %> </td>
            <td> <%= rs.getString(8) %> </td>
            <td><i class="fa fa-dollar"></i> <%= rs.getString(10) %> </td>
            </tr>
         
         <% 
         
      		}
      		
      		ResultSet rs2 = st.executeQuery("select * from users where email='" +email+ "' ");
      		
      		while(rs2.next())
      		
      		{
      			
      			%>      		
         
        </tbody>
      </table>
      
<hr style="width: 100%">

<form action="addressPaymentForOrderAction.jsp" method="post"> 

 	<div class="left-div">
 	
 		<h3> Endereço </h3>
 		
 		<input class="input-style" type="text" name="endereco" value="<%=rs2.getString(7) %>" placeholder="Coloque o endereço" required>

 	</div>

	<div class="right-div">
	
		<h3> Cidade </h3>
		
		<input class="input-style" type="text" name="cidade" value="<%=rs2.getString(8) %>" placeholder="Coloque a cidade" required>

	</div> 

	<div class="left-div">
	
		<h3> Estado </h3>
		
		<input class="input-style" type="text" name="estado" value="<%=rs2.getString(9) %>" placeholder="Coloque o estado" required>

	</div>

	<div class="right-div">
	
		<h3> País </h3>
		
		<input class="input-style" type="text" name="pais" value="<%=rs2.getString(8) %>" placeholder="Coloque o país" required>

	</div>



<h3 style="color: red">*Se não existir endereço no campo, é porque ainda não existe um salvo!</h3>
<h3 style="color: red">*Esse endereço aerá atualizado no seu cadastro</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Selecione meio de pagamento</h3>
 
 <select class="input-style" name="metodoPagamento">
 
 	<option value="Pagamento na entrega">Pagamento na Entrega</option>
 	
 	<option value="Pagamento online">Pagamento online</option>
 
 </select>
 
 
</div>

<div class="right-div">
<h3>Pague online através do PIX</h3>

<input class="input-style" type="text" name="transactionId" placeholder=" Coloque o código para transação " required>

<h3 style="color: red">*Se selecionou pagamento online, preencha o campo de ID do contrário deixe vazio</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>

<input class="input-style" type="text" name="numero" value="<%=rs2.getString(3)%>" placeholder=" Coloque o celular " required>

<h3 style="color: red">*Esse número será atualizado no seu cadastro</h3>
</div>
<div class="right-div">
<h3 style="color: red">*Se você colocar o Id de transação errado o pedido será cancelado</h3>

<button class="button" type="submit"> Continue para gera o boleto e salvar os dados <i class='far fa-arrow-alt-circle-right'></i> </button>


<h3 style="color: red">*Preencha o formulário corretamente</h3>
</div>

</form>

<%
      		}
	}
	catch (Exception e){
		
		System.out.println(e);
		
	}
%>
      <br>
      <br>
      <br>

</body>
</html>