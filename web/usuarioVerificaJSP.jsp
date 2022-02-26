<%-- 
    Document   : usuarioVeriificaJSP
    Created on : 21 de out. de 2021, 21:28:07
    Author     : patri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Login.usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
        usuario usuar = new usuario();
        String usuario=request.getParameter("nome");
        String senha=request.getParameter("senha");
        
        boolean posicao = usuar.verificaUsuario(usuario, senha);
        
        if(usuar.resultado==true)
        {
        out.println("<h3>Bem Vindo: "+usuario.toUpperCase()+"</h3>");
        %>
        <%@include file="incluiItem.jsp" %>
        <%
            
       }
else
{
out.println("<h3>Senha ou Usuário Inválidos</h3>");
%>
<%@include file="index.html" %>
       <%
           }
%>
         
    </body>
</html>
