<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<div class="user-panel">
    <div class="pull-left image">
        <img src="/resources/admin/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
    </div>
    <div class="pull-left info">
        <p>Alexander Pierce</p>
        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
    </div>
</div>
<!-- search form -->
<form action="#" method="get" class="sidebar-form">
    <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="Search...">
        <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
    </div>
</form>
<!-- /.search form -->
<!-- sidebar menu: : style can be found in sidebar.less -->
<ul class="sidebar-menu" data-widget="tree">
    <li class="header">MAIN NAVIGATION</li>
    <li class="active">
        <a href="/admin">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
<%--            <span class="pull-right-container">--%>
<%--              <i class="fa fa-angle-left pull-right"></i>--%>
<%--            </span>--%>
        </a>
    </li>
    <li><a href="/admin/book/manager"><i class="fa fa-book"></i> <span>Quản lý sách</span></a></li>
    <li><a href="#"><i class="fa fa-book"></i> <span>Quản lý danh mục</span></a></li>
    <li><a href="#"><i class="fa fa-book"></i> <span>Quản lý nhà phát hành</span></a></li>
    <li><a href="#"><i class="fa fa-book"></i> <span>Quản lý khách hàng</span></a></li>
    <li><a href="#"><i class="fa fa-book"></i> <span>Quản lý đơn hàng</span></a></li>
</ul>