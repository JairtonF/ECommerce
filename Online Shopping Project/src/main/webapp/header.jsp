<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->

    <div class="topnav sticky">
    <% String email=session.getAttribute("email").toString(); %>
            
            <center><h2> Joyeria Acessórios Online Shopping </h2></center>
            
            <a href="home.jsp"> Início <i class="fa fa-institution"></i></a>
            <a href="myCart.jsp"> Carrinho de Compras <i class='fas fa-cart-arrow-down'></i></a>
            <a href=""> Meus Pedidos <i class='fab fa-elementor'></i></a>
            <a href=""> Mudar Detalhes <i class="fa fa-edit"></i></a>
            <a href=""> Contato <i class='fas fa-comment-alt'></i></a>
            <a href=""> Sobre <i class="fa fa-address-book"></i></a>
            <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
            
            <div class="search-container">
            	
            	<form action="searchHome.jsp" method="post">
            	
            		<input type="text" placeholder="pesquisar" name="pesquisar">
            		
            		<button type="submit"> <i class="fa fa-search"> </i> </button>
            	
            	</form>
             
            </div>
            
          </div>
           <br>
           <!--table-->
