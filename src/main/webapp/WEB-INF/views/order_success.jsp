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
                <div class="panel-heading">Thông báo</div>
                <div class="panel-body">
                    <h4>Xác nhận đơn hàng thành công!</h4>
                </div>
            </div>
        </div>
        <div class="col-md-3 sidebar">
            <div class="panel panel-primary">
                <div class="panel-heading">Chi tiết</div>
                <table class="table">
                    <tr>
                        <td>Tổng giá:</td>
                        <td id="sumCart">${sessionScope.cart.totalPrice}</td>
                    </tr>
                </table>
            </div>
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

    function lengtItem(cart) {
        try {
            let n = cart.itemList.length;
            $('#itemLenght').html(
                '(' + n + ')'
            )
        } catch (e) {
            console.log("lỗi")
        }
    }
</script>
</body>
</html>