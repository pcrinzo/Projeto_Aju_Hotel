<%-- 
    Document   : consultaMovimento
    Created on : 4 de nov. de 2021, 21:53:47
    Author     : patri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<%
    Connection conn=null;
    Statement st= null;
    ResultSet rs=null;
    
    try{
            Class.forName("org.postgresql.Driver");
            conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/locacao","postgres","dsacademy");
            st=conn.createStatement();
            rs=st.executeQuery("select apartamento,descricao,vr_diaria,data_saida, qt_dias, vr_pagar, nome_hospede from movimento");
            
            SimpleDateFormat formatoData= new SimpleDateFormat("dd/MM/yyyy");
            
            while(rs.next())
            {

%>
<tr>
