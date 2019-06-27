<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@include file="component/header.jsp" %>
</head>
<body>
<div class="container">
    <%@include file="component/nav.jsp" %>
    <div class="row">
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Sách Mới
                </div>
                <div class="panel-body">
                    <div class="col-xs-12">
                        <c:forEach items="${sachMoi.content}" var="book">
                        <div class="col-xs-6 col-md-3 col-sm-3 ebook">
                            <a href="/book?id=${book.id}"
                               class="thumbnail">
                                <img src="/${book.image}"
                                     alt="${book.name}">
                                <span class="box-book bg-primary">
                                    <fmt:formatNumber pattern="###,###" value="${book.price}" />đ
                                </span>
                            </a>
                            <h5 class="tieude text-center">
                                <a href="/book?id=${book.id}">
                                    ${book.name}
                                </a>
                            </h5>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Sách Bán Chạy
                </div>
                <div class="panel-body">
                    <div class="col-xs-12">
                        <c:forEach items="${sachBanChay}" var="book">
                            <div class="col-xs-6 col-md-3 col-sm-3 ebook">
                                <a href="/book?id=${book.id}"
                                   class="thumbnail">
                                    <img src="/${book.image}"
                                         alt="${book.name}">
                                    <span class="box-book bg-primary">
                                    <fmt:formatNumber pattern="###,###" value="${book.price}" />đ
                                </span>
                                </a>
                                <h5 class="tieude text-center">
                                    <a href="/book?id=${book.id}">
                                            ${book.name}
                                    </a>
                                </h5>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 sidebar">
            <%@include file="component/sidebar.jsp" %>
        </div>
    </div>
    <%@include file="component/footer.jsp" %>
</div>
<script>
    //Load danh mục sách vào navbar
    loadAllCatalog()
        .then(result =>
            $.each(result, function (index, item) {
                $('#catalog_list').append(
                    '<li class="cat-item col-xs-12 col-md-4 col-sm-6">' +
                    '<a href="/catalog?id=' + item.id + '">' +
                    '<span class="glyphicon glyphicon-folder-open"></span> &nbsp;' + item.name + '' +
                    '</a>' +
                    '</li>'
                )
            })
        )
    //Load catalog vào sidebar
    loadAllCatalog().then(data =>
        $.each(data, function (index, item) {
            $('#sidebar').append(
                '<li><a href="/catalog?id=' + item.id + '">' +
                '<span class="glyphicon glyphicon-record"> </span> ' + item.name + '' +
                '</a>' +
                '</li>'
            )
        })
    )
</script>
</body>
</html>