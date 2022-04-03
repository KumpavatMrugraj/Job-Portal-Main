<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <c:set var="name" value="${param.username}" />
        <c:set var="repassword" value="${param.retype}" />
        <c:set var="password" value="${param.password}" />
        <c:set var="email" value="${param.email}" />
        <c:set var="contact" value="${param.contact}" />

        ${param.password} ${param.retype}
        <c:choose >
            <c:when test="${password==repassword}">
                <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/jobportal" user="root" password="" />
                <sql:update dataSource="${db}" var="c">
                    INSERT INTO users VALUES("${name}","${email}","${contact}","${password}");
                </sql:update>
                <c:out value="User added " />
            </c:when>
            <c:otherwise>
                <div align="center"> <h1><font color="red"> Password must be same... </font></h1></div>
                <jsp:include page="Register.html" />
            </c:otherwise>
        </c:choose>







    </body>
</html>
