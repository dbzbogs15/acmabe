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
                <div class="panel-body">
                    <div class="row thong_tin_ebook">
                        <div class="col-md-4 cover">
                            <img src="/${book.image}"
                                 class="img-thumbnail" alt="Cinque Terre" width="304"
                                 height="236">
                        </div>
                        <div class="col-md-8">
                            <a href="/book?id=${book.id}">
                                <h1 class="ebook_title text-primary">${book.name}</h1>
                            </a>
                            <div class="fb-like fb_iframe_widget"
                                 data-href="https://sachvui.com/ebook/huyet-an-lien-hoan-thuong-quan-ngo-da.4344.html"
                                 data-layout="button_count" data-action="like" data-size="large" data-show-faces="true"
                                 data-share="true" fb-xfbml-state="rendered"
                                 fb-iframe-plugin-query="action=like&amp;app_id=725719534131710&amp;container_width=393&amp;href=https%3A%2F%2Fsachvui.com%2Febook%2Fhuyet-an-lien-hoan-thuong-quan-ngo-da.4344.html&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true&amp;show_faces=true&amp;size=large">
                                <span style="vertical-align: bottom; width: 152px; height: 28px;"><iframe
                                        name="f29a38395f0c4ac" width="1000px" height="1000px"
                                        title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true"
                                        allowfullscreen="true" scrolling="no" allow="encrypted-media"
                                        src="https://www.facebook.com/v2.8/plugins/like.php?action=like&amp;app_id=725719534131710&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D44%23cb%3Df63aa22da0fa88%26domain%3Dsachvui.com%26origin%3Dhttps%253A%252F%252Fsachvui.com%252Ff23ad986ce2e7b8%26relation%3Dparent.parent&amp;container_width=393&amp;href=https%3A%2F%2Fsachvui.com%2Febook%2Fhuyet-an-lien-hoan-thuong-quan-ngo-da.4344.html&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true&amp;show_faces=true&amp;size=large"
                                        style="border: none; visibility: visible; width: 152px; height: 28px;"
                                        __idm_frm__="481" class=""></iframe></span></div>
                            <h5 class="">Tác giả : ${book.author}</h5>
                            <h5 class="">Thể Loại : <a href="#">${book.catalog.name}</a></h5>
                            <h5 class="">Lượt xem : 733</h5>
                            <div class="alert alert-info" role="alert">
                                <span class="glyphicon glyphicon-bitcoin"
                                      aria-hidden="true">
                                </span> <fmt:formatNumber value="${book.price}" pattern="###,###"/>đ
                            </div>
                            <a href="#" onclick="addToCart(${book.id}, 1)" type="button" class="btn btn-warning btn-md">
                                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                                Mua ngay
                            </a>
                        </div>
                    </div>
                    <hr>
                    <h4>Giới thiệu</h4>
                    <hr>
                    <div id="list-chapter" class="ebook_row">
                        <div class="gioi_thieu_sach text-justify">
                            <p>
                                ${book.name}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Bình luận</div>
                <div class="panel-body">
                    <div class="fb-comments fb_iframe_widget fb_iframe_widget_fluid_desktop"
                         data-href="http://sachvui.com/ebook/huyet-an-lien-hoan-thuong-quan-ngo-da.4344.html"
                         data-numposts="5" fb-xfbml-state="rendered"
                         fb-iframe-plugin-query="app_id=725719534131710&amp;container_width=604&amp;height=100&amp;href=http%3A%2F%2Fsachvui.com%2Febook%2Fhuyet-an-lien-hoan-thuong-quan-ngo-da.4344.html&amp;locale=vi_VN&amp;numposts=5&amp;sdk=joey&amp;version=v2.8&amp;width=550">
                        <span style="vertical-align: bottom; width: 550px; height: 179px;"><iframe name="f13ddcc9cf62ec"
                                                                                                   width="550px"
                                                                                                   height="100px"
                                                                                                   title="fb:comments Facebook Social Plugin"
                                                                                                   frameborder="0"
                                                                                                   allowtransparency="true"
                                                                                                   allowfullscreen="true"
                                                                                                   scrolling="no"
                                                                                                   allow="encrypted-media"
                                                                                                   src="https://www.facebook.com/v2.8/plugins/comments.php?app_id=725719534131710&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D44%23cb%3Df340556b738c19%26domain%3Dsachvui.com%26origin%3Dhttps%253A%252F%252Fsachvui.com%252Ff23ad986ce2e7b8%26relation%3Dparent.parent&amp;container_width=604&amp;height=100&amp;href=http%3A%2F%2Fsachvui.com%2Febook%2Fhuyet-an-lien-hoan-thuong-quan-ngo-da.4344.html&amp;locale=vi_VN&amp;numposts=5&amp;sdk=joey&amp;version=v2.8&amp;width=550"
                                                                                                   style="border: none; visibility: visible; width: 550px; height: 179px;"
                                                                                                   __idm_frm__="482"
                                                                                                   class=""></iframe></span>
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
                    $('#itemList').empty();
                    loadCart();
                }
            }
        })
    }
</script>
</body>
</html>