<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
            crossorigin="anonymous"></script>

    <title>${post.title}</title>
    <script type="text/javascript">
        function isValidate(obj) {
            if (obj.content.value === "") {
                alert("내용이 입력되지 않았습니다.")
                return false;
            }

            return true;
        }
    </script>

    <script type="text/javascript">
        function deleteComment(obj) {
            if (obj.content.value === "") {
                alert("내용이 입력되지 않았습니다.")
                return false;
            }

            return true;
        }
    </script>

    <script type="text/javascript">
        function doLike(){
            // ajax 통신
            $.ajax({
                type : "GET",            // HTTP method type(GET, POST) 형식이다.
                url : "/like/do/${post.id}",
                success : function(res){ // 비동기통신의 성공일경우 success 콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    // 응답코드 > 0000
                    alert(res.code);
                },
                error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    alert("통신 실패.")
                }
            });
        }

    </script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>

<body>

<div style="width: 100%; text-align: right">
    <c:if test="${loginedId ne null}">
        <h4>${loginedName}님 환영합니다. | <a href="${pageContext.request.contextPath}/logout">로그아웃</a></h4>
    </c:if>

    <c:if test="${loginedId eq null}">
        <table class="table" style="background: #FFFFFF">
            <thead>
            <tr class="table-active" style="background: #FFFFFF">
                <td style="width: 33%; background: #FFFFFF"></td>
                <td style="width: 33%; background: #FFFFFF"></td>
                <td style="width: 33%; float: right; background: #FFFFFF">
                    <div class="btn-toolbar" role="toolbar">
                        <a style="" href="${pageContext.request.contextPath}/login">
                            <button type="button" class="btn btn-secondary float-right">로그인</button>
                        </a>
                        <a style="" href="${pageContext.request.contextPath}/members/register">
                            <button type="button" class="btn btn-secondary float-right">회원가입</button>
                        </a>
                    </div>
                </td>
            </tr>
            </thead>
        </table>
    </c:if>
</div>

<div class="container ">
    <div class="row">
        <table class="table">
            <thead>
            <tr class="table-active">
                <th scope="col" style="width: 60%">제목 : <c:out value="${post.title}"/><br>
                    작성자 : <c:out value="${post.writerName}"/></th>
                <th scope="col" style="width: 40%" class="text-right">조회 : <c:out value="${post.viewNumber}"/>
                    <br>작성시간 : <c:out value="${post.writeTimeString}"/></th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td>
                    <pre>${post.content}</pre>
                </td>
            </tr>

            <tr>
                <td>
                    <pre>추천: ${likeCount}</pre>
                    <button type="button" onclick="doLike()">추천하기</button>
                </td>
            </tr>
            </tbody>
        </table>
        <br>
        <c:if test="${loginedId eq post.writerId}">
            <div class="btn-toolbar" role="toolbar" style="width: 100%;">
                <div class="btn-group mr-2" role="group">
                    <a href="/board/posts">
                        <button type="button" class="btn btn-secondary">목록</button>
                    </a>
                    <a href="${pageContext.request.contextPath}/board/write?mode=modify&postId=${post.id}">
                        <button type="button" class="btn btn-secondary">수정</button>
                    </a>
                    <a href="${pageContext.request.contextPath}/board/delete/${post.id}">
                        <button type="button" class="btn btn-secondary">삭제</button>
                    </a>
                </div>
            </div>
        </c:if>
        <c:if test="${loginedId ne post.writerId}">
            <a href="/board/posts">
                <button type="button" class="btn btn-secondary">목록</button>
            </a>
            <br>
        </c:if>
        <br>
        <table class="table">
            <thead>
            답글[${comment_count}]<br>
            <br>
            <c:forEach var="row" items="${comments}">
                <tr class="table-active">
                    작성자: ${row.writerName}<br>
                    작성 시간: ${row.writeTimeString}<br>
                        ${row.content}<br>
                    <br>
                </tr>

                <c:if test="${loginedId eq row.writerId}">
                    <div style="width: 100%;">
                        <a href="${pageContext.request.contextPath}/comment/delete/${row.id}">
                            <button type="button" class="btn btn-secondary">삭제</button>
                        </a>
                    </div>
                </c:if>
            </c:forEach>
            </thead>
        </table>
        <c:if test="${loginedId ne null}">
            <table>
                <thead>
                <tr class="table-active">
                    <form action="${pageContext.request.contextPath}/comment/insert/${postId}" method="post" onsubmit="return isValidate(this)">
                        <input type="text" name="content"><br>
                        <input type="submit" value="답글 작성">
                    </form>
                </tr>
                </thead>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>
