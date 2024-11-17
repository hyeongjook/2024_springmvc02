<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>가로수길 목록</title>
</head>
<body>
    
<h1>가로수길 검색 결과</h1>
    <table border="1">
        <thead>
            <tr>
                <th>가로수길명</th>
                <th>소재지지번주소</th>
                <th>관리기관명</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="road" items="${roadList}">
                <tr>
                    <td>${road.r_na}</td>
                    <td>${road.r_sto}</td> 
                    <td>${road.r_rsec}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>