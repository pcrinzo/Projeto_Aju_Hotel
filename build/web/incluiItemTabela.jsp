<%-- 
    Document   : incluiItemTabela
    Created on : 28 de out. de 2021, 20:07:18
    Author     : patri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import ="java.sql.* "%>
<%@page import="PacoteNome.Apartamento"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inclui Apartementos</title>
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
        <h1> Sucesso!!</h1>
        <input type="button" value="Sair" onclick="history.back()">
    </div>       
        <%
            Apartamento digitaApto = new Apartamento();
            String  nrApto=request.getParameter("nr_apto");
            String descricao=request.getParameter("descricao");
            Double vrDiaria= Double.parseDouble(request.getParameter("vr_diaria"));
            
            digitaApto.InsereDados(nrApto, descricao, vrDiaria);
        %>
        
    </body>
</html>
