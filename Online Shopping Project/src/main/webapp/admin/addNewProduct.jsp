<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*" %>
<%@include file ="adminHeader.jsp" %>
<%@include file ="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Adicionar novo produto</title>
</head>
<body>

<%
  
  String msg = request.getParameter("msg");
  
  if("done".equals(msg)){
	  %>
	  
	  <h1>Produto adicionado com sucesso</h1>
	  
	  <% 
  }
  if("wrong".equals(msg)){
	  
	  %>
	  
	  <h1>Alguma coisa deu errado! Tente novamente!</h1><%
	  
  }
  
  %>

<%
	int id=1;
	try {
		
		Connection con = ConnectionProvider.getCon();
	
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery("select max(id) from products");
		
		while(rs.next()){
			
			id=rs.getInt(1);
			id=id+1;
			
		}
		
	
	} catch (Exception e){
		
	}

%>

<form action="addNewProductAction.jsp" method="post">

<h3 style="color: yellow;">ID Produto: <% out.println(id); %> </h3>

<input type="hidden" name="id" value="<% out.println(id); %>">

<div class="left-div">
 <h3>Coloque o nome do produto</h3>
 
 <input class="input-style" type="text" name="nome" placeholder="Nome do produto" required>
 
<hr>
</div>

<div class="right-div">
<h3>Coloque a Categoria</h3>

<input class="input-style" type="text" name="categoria" placeholder="Nome da categoria" required>
 
<hr>
</div>

<div class="left-div">
<h3>Coloque o Preço</h3>
 
 <input class="input-style" type="number" name="price" placeholder="Preço" required>
 
<hr>
</div>

<div class="right-div">
<h3>Disponível</h3>

	<select class="input-style" name="active">

		<option value="yes"> Sim </option>

		<option value="no"> Não </option>

	</select>
   
<hr>
</div>
 <button class="button"> Salvar <i class='far fa-arrow-alt-circle-right'></i> </button>
 
 </form>

</body>
<br><br><br>
</body>
</html>