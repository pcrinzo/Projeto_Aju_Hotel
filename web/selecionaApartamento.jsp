<%-- 
    Document   : selecionaApartamento
    Created on : 28 de out. de 2021, 20:36:14
    Author     : patri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleciona Apartamento</title>
    </head>
    <body>
        <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleciona Apartementos</title>
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
        <input type="button" value="Voltar para página de cadastro" onClick="location.href = 'incluiItem.jsp';">
        <input type="button" value="Sair" onClick="location.href = 'index.html';">
        <h1>Selecionar Apartamentos</h1>
        <h3>Favor clicar no número do apartamento</h3>
                 <table class="table table-fixed" border="1">
            <thead>
                <tr>
                    <th>NÚMERO APARTAMENTO</th><th>DESCRIÇÃO</th><th>VALOR DIÁRIA: R$</th>      
                </tr>
            </thead>
          
                
            <%
                Connection conn=null;
                Statement st=null;
                ResultSet rs=null;
                
                try
                {
                Class.forName("org.postgresql.Driver");
                conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/locacao","usuario","senha");
                st=conn.createStatement();
                rs=st.executeQuery("select numero_apartamento, descricao, valor_diaria from apartamento");
                
                while (rs.next())
                {
                String nrApartamento_jsp = rs.getString("numero_apartamento");
                String descricao_jsp = rs.getString("descricao");
                float vrDiaria_jsp = rs.getFloat("valor_diaria");
 
                
                out.println("<tr>");
                out.println("<td class='apSelect'><a href='AlteraDeletaQuartos.jsp?numero_apartamento="+nrApartamento_jsp+"'>"+nrApartamento_jsp+"</a></td><td>"+descricao_jsp+"</td>");
                out.println("<td>"+vrDiaria_jsp+"</td>");
                out.println("</tr>");
                
              
                
            }//fim do while 
            }//fim do try 
            catch (Exception erro)
            {
             erro.printStackTrace();
            
            }
        finally 
        {
        if(rs!=null)rs.close();
        if(st!=null)st.close();
        if(conn!=null)conn.close();
            }
            
            %>                
                 </table>
    </div>  
         </body>
</html>
