<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>         
<!DOCTYPE html>
<html>
    <body>
    <c:set var="emailid" value="${param.email}" /><!-- comment -->
    <c:set value="${param.password}" var="pass" />
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/jobportal" user="root" password="" />   
    <sql:query dataSource="${db}" var="rs" >
        SELECT password FROM users WHERE email="${emailid}";
    </sql:query>
    <c:forEach items="${rs.rows}" var="row">
        <c:set var="passwd" value="${row.password}" />
    </c:forEach>
    ${passwd}
    <c:choose>
        <c:when test="${passwd==pass}" >      
            <c:redirect url="../index.html" />
        </c:when>
        <c:otherwise>
            <div align="center"> <h1><font color="red"> Invalid Username and Password ... </font></h1></div>
                    <jsp:include page="login.html" />
        </c:otherwise>
    </c:choose>
</body>
</html>
