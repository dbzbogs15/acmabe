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
                <div class="panel-heading">Giỏ hàng</div>
                <div class="panel-body">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Ảnh</th>
                            <th>Tên</th>
                            <th width="10%">Số lượng</th>
                            <th>Giá</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${cart.itemList}" var="item">
                            <tr id="item${item.book.id}">
                                <td>
                                    <img src="/${item.book.image}" style="width: 50px"/>
                                </td>
                                <td>${item.book.name}</td>
                                <td width="10%">
                                    <input value="${item.quantity}">
                                </td>
                                <td>${item.book.price * item.quantity}</td>
                                <td>
                                    <button onclick="removeItem(${item.book.id})" class="btn btn-danger" href="">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-3 sidebar">
            <div class="panel panel-primary">
                <div class="panel-heading">Chi tiết</div>
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <td>Tổng giá:</td>
                            <td id="sumCart">${cart.totalPrice}</td>
                        </tr>
                    </table>
                    <a class="btn btn-success" href="/cart/confirm">Xác nhận mua</a>
                </div>
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

    function addToCart(productId, quantity) {
        $.ajax({
            url: '/cart/add',
            data: {
                productId: productId,
                quantity: quantity
            },
            success: function (cart) {
                if (cart != null) {
                    swal("Sản phẩm đã được thêm vào giỏ hàng");
                    lengtItem(cart)
                }
            }
        })
    }

    function removeItem(productId) {
        $.ajax({
            url: '/cart/'+productId+'',
            method: 'delete',
            success: function (result) {
                if(result) {
                    $('#item'+productId+'').empty();
                }
                loadCart()
            }
        })
    }
</script>
</body>
</html>