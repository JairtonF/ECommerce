
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  
  	<form action="loginAction.jsp" method="post">
  
  		<input type="email" name="email" placeholder="Coloque seu e-mail" required>
  		
  		<input type="password" name="senha" placeholder="Coloque sua senha" required>
  		
  		<input type="submit" value="login">
  
  	</form>
     
      <h2><a href="signup.jsp">Cadastrar</a></h2>
       <h2><a href="forgotPassword.jsp">Esqueceu a senha?</a></h2>
  </div>
  <div class='whysignLogin'>
  
  <% 
  	String msg = request.getParameter("msg");
  
  if("notexist".equals(msg)){
	  %>
	  <h1>Usu�rio ou senha incorrreto</h1>
	  <% 
  }
  
  if("invalid".equals(msg)){
	  %>
	  
	  <h1>Alguma coisa deu errado! Tente novamente!</h1>
	  
	  <%  
  }

  %>

    <h2>Joyeria Acess�rios Online</h2>
    
    <p>O sistema de compras online da Joyeria Acess�rios � a aplica��o que permite o usu�rio realizar compras sem precisar sair do comforto da sua resid�ncia. Junte-se a n�s!</p>
  
  </div>
</div>

</body>
</html>