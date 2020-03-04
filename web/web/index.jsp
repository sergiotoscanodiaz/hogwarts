<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title>Hogwarts</title>
  </head>

  <body>
  <div class="container">
			<br><br>			
      <div class="panel panel-primary">
        <div class="panel-heading text-center"><h2>Alumnos de Primer Año en Hogwarts</h2></div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/hogwarts","admin", "1234");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM alumno");
        %>

        <table class="table table-striped">
        <tr><th>Nº de alumno</th><th>Nombre</th><th>Nº de casa</th></tr>
        <form method="get" action="grabaSocio.jsp">
          <tr><td><input type="text" name="Nº de alumno" size="5"></td>
              <td><input type="text" name="nombre" size="50"></td>
              <td><input type="text" name="Nº de casa" size="5"></td>              
              <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>           
        </form>
        <%
          while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("Código_Alumno") + "</td>");
            out.println("<td>" + listado.getString("nombre") + "</td>");
            out.println("<td>" + listado.getString("Código_Casa") + "</td>");           
        %>
        <td>
        <form method="get" action="modificaAlumno.jsp">
	  <input type="hidden" name="Código Alumno" value="<%=listado.getString("Código_Alumno") %>">
          <input type="hidden" name="nombre" value="<%=listado.getString("nombre") %>">
          <input type="hidden" name="Código_Casa" value="<%=listado.getString("Código_Casa") %>">
          <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
	</form>
	</td>
	<td>
        <form method="get" action="borraAlumno.jsp">
          <input type="hidden" name="Código_Alumno" value="<%=listado.getString("Código_Alumno") %>"/>
          <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
        </form>
        </td>
        <%
          } // while   

          conexion.close();
        %> 

        </table>
      </div>
      <div class="text-center">&copy; Sergio Toscano Díaz</div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>