<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  
  	<form action="signupAction.jsp" method="post">
  	
  		<input type="text" name="nome" placeholder="Coloque seu nome" required>
  		<input type="email" name="email" placeholder="Coloque seu e-mail" required>
  		<input type="number" name="numero" placeholder="Coloque seu número de celular" required>
  		
  		<select name="securityQuestion" required>
  		
  			<option value="Qual o nome de solteira da sua mae?">Qual o nome de solteira da sua mãe?</option>
  			<option value="Qual o nome do seu primeiro bicho de estimacao?">Qual o nome do seu primeiro bicho de estimação?</option>
  			<option value="Qual a cidade que voce nasceu?">Qual a cidade que você nasceu?</option>
  			<option value="Qual o nome da escola que voce frequentou?">Qual o nome da escola que você frequentou?</option>
  			<option value="Qual o nome da marca de seu primeiro carro?">Qual o nome da marca de seu primeiro carro?</option>
  		
  		</select>
  		
  		<input type="text" name="resposta" placeholder="Resposta" required>
  		
  		<input type="password" name="senha" placeholder="Coloque sua senha" required>
  		
  		<input type="submit" value="signup">
  	
  	</form>
    
    <h2><a href="login.jsp">Login</a></h2>
  
  </div>
  <div class='whysign'>
  
  <%
  
  String msg = request.getParameter("msg");
  
  if("valid".equals(msg)){
	  %>
	  
	  <h1>Successfully Updated</h1>
	  
	  <% 
  }
  if("invalid".equals(msg)){
	  
	  %>
	  
	  <h1>Some thing Went Wrong! Try Again !</h1><%
	  
  }
  
  %>

    <h2>Joyeria Acessórios Online</h2>
    
    <p>O sistema de compras online da Joyeria Acessórios é a aplicação que permite o usuário realizar compras sem precisar sair do comforto da sua residência. Junte-se a nós! </p>
    
  </div>
</div>

</body>
</html>