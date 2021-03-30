<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Persona"%>
<%
    if (session.getAttribute("listaper") == null) {
        ArrayList<Persona> listaux = new ArrayList<Persona>();
        session.setAttribute("listaper", listaux);
    }
    ArrayList<Persona> lista = (ArrayList<Persona>) session.getAttribute("listaper");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MVC Persona</title>
    </head>
    <body>

        <h1>Lista de Personas</h1>
        <a href="Controlador?op=nuevo">Nuevo Registro</a>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>APELLIDO</th>
                <th>EDAD</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null) {
                    for (Persona item : lista) {

            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombres()%></td>
                <td><%= item.getApellidos()%></td>
                <td><%= item.getEdad()%></td>
                <td><a href="Controlador?op=editar&id=<%= item.getId()%>">Modificar</a></td>
                <td><a href="Controlador?op=eliminar&id=<%= item.getId()%>"
                       onclick='return confirm("Esta seguro de elimar el registro ??");'>Eliminar</a></td>

            </tr>
            <%
                    }
                }
            %>
        </table>

    </body>
</html>
