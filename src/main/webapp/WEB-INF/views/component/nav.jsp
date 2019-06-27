<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <%--            <a class="navbar-brand" href="/">Ác ma bé</a>--%>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/">Trang chủ <span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">Danh mục sách <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" id="catalog_list_nav" style="columns: 2;">
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input id="kw" type="text" class="form-control" placeholder="Nhập tên sách">
                </div>
                <button type="button" id="search" class="btn btn-default">Tìm kiếm</button>
                <div class="panel-body navbar navbar-default"
                     id="box_search"
                     style="position: absolute; width: 50%; z-index: 999; display: none">
                    <ul class="list-group" id="list_search">
                        <li class="list-group-item">
                            <a href="#">
                                Học bootstrap 3 free cùng với freetuts.net
                                <span class="label label-danger pull-right">Mới</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown" style="margin-right: 5px">
                    <button href="#" class="btn btn-default navbar-btn dropdown-toggle" data-toggle="dropdown"
                            role="button" aria-haspopup="true" aria-expanded="false"><span
                            class="glyphicon glyphicon-shopping-cart"></span>
                        Giỏ hàng <span id="itemLenght"></span> <span class="caret"></span></button>
                    <ul class="dropdown-menu dropdown-menu-left" id="itemList"
                        style="width: 500px; text-overflow: ellipsis; overflow: hidden">
                    </ul>

                </li>
                <li class="dropdown">
                    <c:choose>
                        <c:when test="${sessionScope.account == null}">
                            <button href="#" class="btn btn-default navbar-btn dropdown-toggle" data-toggle="dropdown"
                                    role="button" aria-haspopup="true" aria-expanded="false"><span
                                    class="glyphicon glyphicon-user"></span>
                                Tài khoản <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#" id="nav_login">Đăng nhập</a></li>
                                <li><a href="#" id="nav_register">Đăng ký</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Quên mật khẩu</a></li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <button href="#" class="btn btn-default navbar-btn dropdown-toggle" data-toggle="dropdown"
                                    role="button" aria-haspopup="true" aria-expanded="false"><span
                                    class="glyphicon glyphicon-user"></span>
                                    ${sessionScope.account.name} <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Cập nhật thông tin</a></li>
                                <li><a href="#">Bộ sưu tập</a></li>
                                <li role="separator" class="divider"></li>
                                <li>
                                    <a href="/account/logout">
                                        <span class="glyphicon glyphicon-log-out"></span> Đăng xuất
                                    </a>
                                </li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<hr>
<div class="alert alert-success" role="alert"><b>NÊN</b> sao chép, chia sẻ, <b>KHÔNG NÊN</b> thương mại hoá.</div>