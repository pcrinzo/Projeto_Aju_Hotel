<%-- 
    Document   : fechaCalculo
    Created on : 28 de out. de 2021, 21:05:05
    Author     : patri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar Apartamentos</title>
    </head>
    <body>
    <link rel="stylesheet" type="text/css" href="CSS.css">
        <% 
            String nr_apto=request.getParameter("numero_apartamento").trim();
     
            
            if(nr_apto!=null)
            {
                Connection conn=null;
                PreparedStatement pst=null;
                ResultSet rs=null;
                
                SimpleDateFormat DataSys= new SimpleDateFormat("yyyy-MM-dd");
                Date DataHoje= new Date(); 
                
                try
                {
                 Class.forName("org.postgresql.Driver");
                 conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/locacao","usuario","senha"); Class.forName("org.postgresql.Driver");
           
                
                pst=conn.prepareStatement("select * from apartamento where numero_apartamento=?");
                pst.setString(1, nr_apto);
                rs=pst.executeQuery();
                pst.clearParameters();
                
                if(rs.next()){
                %>
                <form name="fechamento" action="AtualizaApartamento.jsp" method="post">

<link rel="stylesheet" type="text/css" href="CSS.css">
<div class="body"></div>
    <div class="grad"></div>
    <div class="header">
      <img class="Logo" src="AracajuLogo.png" alt="LogoHotel" width="350" height="333">
      <div>Caju<span> Hotel</span></div>
    </div>
    <br>
    <div class="login">
        <h1>Inclui Apartamentos</h1>
        <table>
                        <tr>
                            <td>Número do apartamento:</td> 
                            <td><input type="text" name="pNrApto" value="<%=rs.getString("numero_apartamento")%>" /></td>                         
                        </tr>
                        <tr>
                            <td>Descrição:</td> 
                            <td><input type="text" name="pDescricao" value="<%=rs.getString("descricao")%>" /></td>                         
                        </tr>
                            <tr>
                            <td>Valor Diária:</td> 
                            <td><input type="double" name="pVrDiaria" value="<%=rs.getFloat("valor_diaria")%>"/></td>                         
                        </tr>
                       
        </table>  
     
                        <input type="submit" value="Atualiza registro" formaction="AtualizaApartamento.jsp">  
                        <input type="button" value="Deletar" onclick="document.getElementById('id01').style.display='block'" >
                        <input type="button" value="Sair" onclick="history.back()">
          
  <div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form class="modal-content" action="/action_page.php">
    <div class="container">
      <h1>Deletar Registro</h1>
      <p>Deseja realmanete deletar o registro?</p>

      <div class="clearfix">
        <input  type="button" value="Cancelar" onclick="document.getElementById('id01').style.display='none'" >
        <input type="submit" value="Deletar registro" formaction = 'DeletaApartamento.jsp' >
      </div>
    </div>
  </form>
</div>
                 
    </div>
                            <%
                                }
else{
out.println("Erro no Registro");
}
}
finally{
if(pst!=null)pst.close();
if(conn!=null)conn.close();
}
}

%>
</form>
</body>
</html>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target ===modal) {
    modal.style.display = "none";
  }
};
</script>
