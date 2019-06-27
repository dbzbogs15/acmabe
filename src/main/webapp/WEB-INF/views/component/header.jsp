<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<title>Ác Ma Bé - Amumu</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="/resources/jquery/jquery.min.js" type="text/javascript"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/jquery/dist/jquery.validate.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
    @media (min-width: 992px) {
        .ebook .thumbnail img {
            height: 160px;
        }
    }

    @media (min-width: 768px) {

        .ebook .thumbnail img {
            height: 160px;
        }

        .container {
            max-width: 888px;
        }
    }

    .ebook .thumbnail {
        padding: 0px;
        margin-bottom: 1px;
    }

    .ebook .thumbnail img {
        height: 160px;
    }

    h5.tieude {
        font-size: 12px;
        margin-top: 5px;
        height: 48px;
    }

    h5.tieude a {
        color: #666;
        font-family: Tahoma, Helvetica, Verdana, Arial;
    }

    .text-center {
        text-align: center
    }

    .thumbnail {
        display: block;
        padding: 4px;
        margin-bottom: 20px;
        line-height: 1.42857143;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 4px;
        -webkit-transition: border .2s ease-in-out;
        -o-transition: border .2s ease-in-out;
        transition: border .2s ease-in-out;
    }

    .thumbnail {
        position: relative;
        padding: 0px;
        margin-bottom: 20px;
    }

    .thumbnail img {
        width: 100%;
    }

    .panel-bt {
        font-size: 12px;
        padding: 5px;
    }

    .footer {
        padding-top: 19px;
        padding-bottom: 30px;
        color: #777;
        border-top: 1px solid #e5e5e5;
    }

    h1.ebook_title {
        font-size: 20px;
        margin-top: 0px;
        margin-bottom: 14px;
    }

    .panel {
        border-color: #e8e8e8;
    }

    .thong_tin_ebook .btn {
        margin-bottom: 15px;
    }

    .cover img.img-thumbnail {
        margin-bottom: 15px;
    }

    .trangchu li.cat-item {
        padding-bottom: 10px;
    }

    .error {
        color: red;
    }

    .sidebar .nav > li > a {
        padding: 6px 10px;
        font-size: 12px;
    }
    .box-book {
        position: absolute;
        bottom: 0%;
        right: 0%;
        color: #fff;
        font-size: 12px;
        padding: 2px;
    }

    #box_search {
        max-height: 320px;
        overflow: scroll;
    }
</style>