<%-- 
    Document   : fechaCalculo
    Created on : 28 de out. de 2021, 21:05:05
    Author     : patri
    Description: Essa parte do projeto será para implementações futuras, com objetivo de criar reservas para hóspedes.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="JavaScript">
            function CalculaDias(){
                var ValDia=document.fechamento.pVrDiaria.value;
                var DataLocacao=new Date(document.fechamento.pDataLocacao.value);
                var DataHoje=new Date();
                var TotalDias=(Date.parse(DataHoje)-Date.parse(DataLocacao));
                var TotalDias1= TotalDias/(1000*60*60*24);
                var ConverteDias=Math.trunc(TotalDias1);
                var ValorTotalPagar=ConverteDias*ValDia;
                
                document.fechamento.pTotalDiarias.value=ConverteDias;
                document.fechamento.pTotalPagar.value=ValorTotalPagar;
            }
            
        </script>
    </head>
    <body>
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
                <form name="fechamento" action="gravaMovimento.jsp" method="post">
                    <table>
                        <tr>
                            <td>Número do apartamento:</td> 
                            <td><input type="text" name="pNrApto" value="<%=rs.getString("numero_apartamento")%>" readonly="readonly"/></td>                         
                        </tr>
                        <tr>
                            <td>Descrição:</td> 
                            <td><input type="text" name="pDescricao" value="<%=rs.getString("descricao")%>" readonly="readonly"/></td>                         
                        </tr>
                            <tr>
                            <td>Valor Diária:</td> 
                            <td><input type="number" name="pVrDiaria" value="<%=rs.getFloat("valor_diaria")%>" readonly="readonly"/></td>                         
                        </tr>
                        <tr>
                            <td>Data do Check-in:</td>
                            <td><input type="date" name="pDataLocacao"/><td>
                        </tr>
                        <tr>
                            <td>Data do Fechamento:</td>
                            <td><input type="text" name="pDataHoje" value="<%=DataSys.format(DataHoje)%>" readonly="readonly"/></td>  
                        </tr>
                        <tr>
                            <td>Total de diárias:</td>
                            <td><input type="number" name="pTotalDiarias"/></td>
                        </tr>
                        <tr>
                            <td>Valor total a pagar:</td>
                            <td><input type="number" name="pTotalPagar"</></td>  
                        </tr>
                        <tr>
                            <td><input type="button" value="Fecha Diárias" onclick="CalculaDias()"/></td>
                        </tr>
                    </table>
                        <p>Digite o nome do hospede:<input type="text" name="pNomeHospede">
                        <input type="submit" value="Grava registro">
                               
                </form>
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

</body>
</html>
