<%-- 
    Document   : llistarImatges
    Created on : 25/10/2018, 15:19:36
    Author     : annagarcia-nieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Llista imatges</h1>
            <%-- start web service invocation --%><hr/>
    <%
    try {
	org.me.imatge.ImatgeWS_Service service = new org.me.imatge.ImatgeWS_Service();
	org.me.imatge.ImatgeWS port = service.getImatgeWSPort();
	// TODO process result here
	java.util.List<java.lang.Object> result = port.listImatges();
        
        for (int i = 0; i < result.size(); i++) {
            org.me.imatge.Imatge imatge = (org.me.imatge.Imatge) result.get(0);

            String titol = imatge.getTitol();
            int id_imatge = imatge.getId();
            String descripcio = imatge.getDescripcio();
            String clau = imatge.getKeywords();
            String autor = imatge.getAutor();
            String creacio = imatge.getDataCreacio();
            
            out.println("<h2>" + titol +"</h2>");
            out.println("<p>Descripció: " + descripcio +"</p>");
            out.println("<p>Autor: " + autor +"</p>");
            out.println("<p>Data de creació: " + creacio +"</p>");
            out.println("<form action=\"modificarImagen.jsp\" method=\"post\">"
                                + "<input type=\"hidden\" value=\"" + id_imatge + "\" name=\"id_imatge\" id=\"id_imatge\">"
                                + "<input type=\"submit\" value=\"Modificar\">"
                                        + "</form>");
        }
        
        
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>

        
    </body>
</html>
