<%--
  Created by IntelliJ IDEA.
  User: bhagan
  Date: 6/4/20
  Time: 10:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upsert Data</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h3>HBase Sample App</h3>
<!-- ul>
    <li><a href="CreateTable">Create Table</a></li>
    <li><a href="UpsertData">Put Data</a></li>
    <li><a href="QueryTable">Get Data</a></li>
</ul -->
<table>
    <tr>
        <td><a href="setup.jsp">Setup</a></td>
        <td><a href="CreateTable">Create Table</a></td>
        <td><a href="UpsertData">Put Data</a></td>
        <td><a href="QueryTable">Get Data</a></td>
    </tr>
</table>
<div>
<h3>Upsert Data Code</h3>
    <pre>
        <code>
public void init(ServletConfig config) throws ServletException {

    try {
        Class.forName("org.apache.phoenix.jdbc.PhoenixDriver");
        connection = DriverManager.getConnection("jdbc:phoenix:localhost");
        System.out.println("Connected to phoenix");
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    long millis = System.currentTimeMillis();
    Date date = new Date(millis);
    int eventType = new Random().nextInt(3);

    String queryText = "UPSERT INTO demo.events VALUES('hagan','brian',eventType,date)";
    Statement stmt;

    try {
        stmt = connection.createStatement();
        boolean result = stmt.executeQuery(queryText);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    RequestDispatcher dispatcher = request.getRequestDispatcher("upsertdata.jsp");
    dispatcher.forward(request, response);
    response.sendRedirect("upsertdata.jsp");
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
}
        </code>
    </pre>
</div>
</body>
</html>
