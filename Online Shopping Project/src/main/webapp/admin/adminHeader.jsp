<%@page errorPage="error.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <div class="topnav sticky">
    
   	<%String email = session.getAttribute("email").toString(); %>
    
            <center><h2>Online shopping (Joyeria Acessórios)</h2></center>
            
            <a href="addNewProduct.jsp">Adicionar novo produto<i class='fas fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">Todos produtos e editar produtos <i class='fab fa-elementor'></i></a>
            <a href="">Mensagens Recebidas <i class='fas fa-comment-alt'></i></a>
            <a href="">Pedidos Recebidos <i class="fas fa-archive"></i></a>
            <a href="">Cancelar Pedidos <i class='fas fa-window-close'></i></a>
            <a href="">Entrega de Pedidos <i class='fas fa-dolly'></i></a>
            <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
          </div>
           <br>
           <!--table-->
