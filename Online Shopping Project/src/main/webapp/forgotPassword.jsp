<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  
  	<form action="forgotPasswordAction.jsp" method="post">
  	
  		<input type="email" name="email" placeholder="Coloque seu e-mail" required>
  		
  		<input type="number" name="numero" placeholder="Coloque seu n�mero de celular" required>
  		
  		<select name="securityQuestion" required>
  		
  			<option value="Qual o nome de solteira da sua mae?">Qual o nome de solteira da sua m�e?</option>
  			<option value="Qual o nome do seu primeiro bicho de estimacao?">Qual o nome do seu primeiro bicho de estima��o?</option>
  			<option value="Qual a cidade que voce nasceu?">Qual a cidade que voc� nasceu?</option>
  			<option value="Qual o nome da escola que voce frequentou?">Qual o nome da escola que voc� frequentou?</option>
  			<option value="Qual o nome da marca de seu primeiro carro?">Qual o nome da marca de seu primeiro carro?</option>
  		
  		</select>
  		
  		<input type="text" name="resposta" placeholder="Resposta" required>
  		
  		<input type="password" name="novaSenha" placeholder="Coloque sua nova senha" required>
  	
  		<input type="submit" value="save">
  	</form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  
   <%
  
  String msg = request.getParameter("msg");
  
  if("done".equals(msg)){
	  %>
	  
	  <h1>Senha trocada com sucesso</h1>
	  
	  <% 
  }
  if("invalid".equals(msg)){
	  
	  %>
	  
	  <h1>Alguma coisa deu errado! Tente novamente!</h1><%
	  
  }
  
  %>

    <h2>Joyeria Acess�rios Online</h2>
    
    <p>O sistema de compras online da Joyeria Acess�rios � a aplica��o que permite o usu�rio realizar compras sem precisar sair do comforto da sua resid�ncia. Junte-se a n�s!</p>
  
  </div>
</div>
</body>
</html>