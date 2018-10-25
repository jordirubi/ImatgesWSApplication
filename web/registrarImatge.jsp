<%-- 
    Document   : registrarImatge
    Created on : 25/10/2018, 14:49:19
    Author     : annagarcia-nieto
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Imatge</title>
    </head>
    <body>
        <div>
            <h1 id="headerRegistreImatge">Registrar imatge</h1>
            <p id="dades"><strong>Introdueix les dades que es demanen a continuació</strong></p>
            <form method="post" action="registreServlet.java" id="registrarImatge" enctype="multipart/form-data">
                <label for="titol"><br>Títol:<br></label>
                <input type="text" name="titol" id="titol">
                <br>
                <textarea cols='30' rows='10' name="textArea" id="textArea" placeholder="Escriu una breu descripció..."></textarea>
                <br>
                <label for="clau"><br>Paraules clau:<br></label>
                <input type="text" name="clau" id="clau">
                <br>
                <label for="autor"><br>Autor:<br></label>
                <input type="text" name="autor" id="autor">
                <br>
                <label for="creacio"><br>Data de creació:<br></label>
                <input type="date" name="creacio" id="creacio">
                <br>
                <input type="submit" name="registrar" id="registrar" value="Registrar">
                <input type="reset" name="netejar" id="netejarQuestionari" value="Esborrar dades">
            </form>
        </div>
    </body>
</html>