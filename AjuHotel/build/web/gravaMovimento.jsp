<%-- 
    Document   : gravaMovimento
    Created on : 4 de nov. de 2021, 21:30:26
    Author     : patri
    Essa parte do projeto será para implementações futuras, com objetivo de criar reservas para hóspedes.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<%
    String nr_apto=request.getParameter("pNr_Apto");
    String descricao=request.getParameter("pDescricao_Apto");
    float vr_Diaria=Float.parseFloat(request.getParameter("pVrDiaria"));
    String dt_entrada=request.getParameter("pDataLocacao");
    String dt_saida=request.getParameter("pDataHoje");
    String tot_Dias=request.getParameter("pTotalDias");
    float vrPagar=Float.parseFloat(request.getParameter("pTotalPAgar"));
    String nomeHospede=request.getParameter("pNomeHospede");
    
            Connection conn=null;
            PreparedStatement pst=null;
            
            try
            {
            Class.forName("org.postgresql.Driver");
            conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/locacao","usuario","senha");
            
            String SQL="insert into apartamento(apartamento, descricao,vr_diaria, data_registro, data_saida, qtd_dias, vr_pagar, nome_hospede) values (?,?,?,?,?,?,?,?)";
            pst=conn.prepareStatement(SQL);
            
            pst.setString(1, nr_apto);
            pst.setString(2, descricao);
            pst.setFloat(3, vr_Diaria);
            pst.setString(4, dt_entrada);
            pst.setString(5, dt_saida);
            pst.setString(6, tot_Dias);
            pst.setFloat(7, vrPagar);
            pst.setString(8, nomeHospede);
           
            
            pst.executeUpdate();
            pst.clearParameters();
        }
        
       catch (Exception err)
       {
       err.printStackTrace();
 
        }
        finally
        {
        if(pst!=null) pst.close();
        if(conn!=null)conn.close();
        }
 
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Movimento gravado</h1>
        
    </body>
</html>
