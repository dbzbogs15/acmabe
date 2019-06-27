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
                <div class="panel-heading">Thông tin thanh toán</div>
                <div class="panel-body">
                    <form class="form-horizontal" id="form_order" action="/order" method="post">
                        <div class="form-group">
                            <label class="control-label col-sm-3">Họ tên:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Điện thoại:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Tỉnh/Thành phố:</label>
                            <div class="col-sm-9">
                                <select class="form-control"
                                        id="province" name="province"
                                        onchange="checkdistrict(this.value)">
                                    <option value="">Chọn</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Quận/huyện:</label>
                            <div class="col-sm-9">
                                <select class="form-control"
                                        onchange="checklocation(this.value);"
                                        id="districts" name="districts">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Phường xã:</label>
                            <div class="col-sm-9">
                                <select class="form-control"
                                        id="wardid" name="wardid">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Địa chỉ:</label>
                            <div class="col-sm-9">
                                <textarea name="address"
                                          class="form-control"
                                          rows="5" id="comment"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-success">Xác nhận mua hàng</button>
                                <a href="#" class="btn btn-danger">Quay lại</a>
                            </div>
                        </div>
                    </form>
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

    //load Province
    $.ajax({
        url: '/address/provinces',
        dataType: 'json',
        success: function (province) {
            $.each(province, function (index, data) {
                $('#province').append(
                    '<option value="' + data.provinceid + '">' + data.name + '</option>'
                )
            })
        }
    })

    //load District
    function checkdistrict(districtid) {
        $('#districts').empty();
        $('#wardid').empty();
        $.ajax({
            url: '/address/' + districtid + '',
            dataType: 'json',
            success: function (district) {
                $('#districts').empty();
                $('#districts').append(
                    '<option value="">Chọn Quận/huyện</option>'
                )
                $.each(district, function (index, data) {
                    $('#districts').append(
                        '<option value="' + data.districtid + '">' + data.name + '</option>'
                    )
                })
            }
        })
    }

    function checklocation(wardid) {
        console.log(wardid)
        $.ajax({
            url: '/address/district/' + wardid + '',
            dataType: 'json',
            success: function (ward) {
                $('#wardid').empty();
                $.each(ward, function (index, data) {
                    $('#wardid').append(
                        '<option value="' + data.wardid + '">' + data.name + '</option>'
                    )
                })
            }
        })
    }
    $('#form_order').validate({
        rules: {
            name: 'required',
            phone: {
                required: true,
                number: true,
                minlength: 10,
                maxlength: 11
            },
            province: 'required',
            address: 'required'
        },
        messages: {
            name: 'Vui lòng nhập vào họ tên',
            phone: {
                required: 'Vui lòng nhập số điện thoại',
                number: 'Số điện thoại không hợp lệ',
                minlength: 'Số điện thoại không hợp lệ',
                maxlength: 'Số điện thoại không hợp lệ'
            },
            province: 'Vui lòng chọn Tỉnh/Thành phố',
            address: 'Vui lòng nhập địa chỉ'
        }
    })
</script>
</body>
</html>