<%-- 
    Document   : incluiItem
    Created on : 28 de out. de 2021, 19:57:54
    Author     : patri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Apartementos</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="CSS.css">
<div class="body"></div>
    <div class="grad"></div>
    <div class="header">
      <img class="Logo" src="AracajuLogo.png" alt="LogoHotel" width="350" height="333">
      <div>Caju<span> Hotel</span></div>
    </div>
    <br>
    <div class="login">
        <h1>Incluir Apartamentos</h1>
        <form action="incluiItemTabela.jsp" method="post">
        <input type="text" placeholder="Número do apartamento:" name="nr_apto"><br><br>
        <input type="text" placeholder="Descrição:" name="descricao"><br>
        <input type="double" placeholder="Valor da Diária:" name="vr_diaria"><br>
        <input type="submit" value="Adicionar Apartamento" >
        <input type="button" value="Selecionar Apartamento" onClick="location.href = 'selecionaApartamento.jsp';">
        <input type="button" value="Sair" onclick="history.back()">
    </div>       
</form>
    </body>
</html>
