<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <title>게시글 리스트</title>
</head>
<body>
<div>
<c:if test="${param.keyword ne null}">
    <c:if test="${searchStatus eq 'Success'}">
        ${param.keyword}에 대한 검색 결과입니다. <a href="/board/posts">돌아가기</a>
    </c:if>

    <c:if test="${searchStatus ne 'Success'}">
        ${param.keyword}에 대한 검색 결과는 없습니다.
    </c:if>
</c:if>
</div>

<table class="table table-striped">
    <c:out value="${test}" />
    <tr>
        <td>게시판</td>
        <td>제목</td>
        <td>작성자</td>
        <td>작성일</td>
        <td>조회수</td>
    </tr>
    <c:forEach var="row" items="${posts}">
        <tr>
            <td>${row.boardName}</td>
            <td><a href="read/${row.id}">${row.title}</a></td>
            <td>${row.writerName}</td>
            <td>${row.writeTimeString}</td>
            <td>${row.viewNumber}</td>
        </tr>
    </c:forEach>
</table>
<div style="text-align: center">
    <c:forEach var="num" begin="1" end="${pagesCount}">
        <c:if test="${num eq nowPage}">
            ${num}
        </c:if>

        <c:if test="${num ne nowPage && param.keyword eq null}">
            <a href="/board/posts?page=${num}">${num} </a>
        </c:if>

        <c:if test="${num ne nowPage && param.keyword ne null}">
            <a href="/board/posts?page=${num}&keyword=${param.keyword}">${num} </a>
        </c:if>
    </c:forEach>
</div>
<form method="get" action="/board/posts">
    <div>
        <input type="text" name="keyword" required>
        <input type="submit" class="btn btn-primary btn-sm" value="검색">
    </div>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>