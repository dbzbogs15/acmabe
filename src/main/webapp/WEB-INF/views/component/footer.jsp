<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<footer class="footer">
    <p>© 2019 TùngĐăngCảnh.com, Nonprofit Organization.</p>
</footer>

<%--Form đăng ký--%>
<div class="modal fade" id="nav_register_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">Đăng ký tài khoản tại Acmabe.com</h4>
            </div>
            <div class="modal-body">
                <div class="well">
                    <form class="row" id="form" method="GET" action="/account/register">
                        <div class="col-xs-6">
                            <div class="form-group">
                                <label for="email" class="control-label">Email</label>
                                <input type="text" class="form-control" id="email"
                                       name="email"
                                       required="required"
                                       autocomplete="false"/>
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label">Mật khẩu</label>
                                <input type="password" class="form-control" id="password" name="password"
                                       title="Vui lòng nhập mật khẩu" autocomplete="off">
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Giới tính</label>
                                <select name="gender" class="form-control">
                                    <option value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="form-group">
                                <label for="name" class="control-label">Họ tên</label>
                                <input type="text" class="form-control" id="name" name="name"
                                       title="Vui lòng nhập họ tên">
                            </div>
                            <div class="form-group">
                                <label for="repwd" class="control-label">Xác nhận mật khẩu</label>
                                <input type="password" class="form-control" id="repwd" name="repwd"
                                       title="Vui lòng nhập mật khẩu">
                                <span class="help-block error"></span>
                            </div>
                            <div class="form-group">
                                <label for="dateOfBirth" class="control-label">Ngày sinh</label>
                                <input type="text" class="form-control" id="dateOfBirth" name="dateOfBirth"
                                       title="Ngày sinh">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <button type="submit" id="reg" class="btn btn-info btn-block">Đăng ký</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Modal đăng ký thành công--%>
<div class="modal fade" id="nav_register_success">
    <div class="modal-dialog">
        <div class="modal-content alert alert-info text-center">
            <h2>Đăng ký tài khoản thành công vui lòng đăng nhập</h2>
            <hr>
            <button class="btn btn-lg btn-primary btn-home" href="https://sachvui.com/the-loai/tat-ca.html"
                    role="button"> Đăng nhập
            </button>
        </div>
    </div>
</div>

<%--Modal đăng nhập--%>
<div class="modal fade" id="nav_login_modal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">Đăng nhập</h4>
            </div>
            <div class="modal-body">
                <div class="well">
                    <h5 class="error text-center" id="login_message_fail"></h5>
                    <form class="row" id="form_login" method="POST" action="/account/login">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label for="email" class="control-label">Email</label>
                                <input type="text" class="form-control" id="email_login"
                                       name="email"
                                       autocomplete="off"/>
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label">Mật khẩu</label>
                                <input type="password" class="form-control" id="pwd" name="password"
                                       title="Vui lòng nhập mật khẩu" autocomplete="off">
                                <span class="help-block"></span>
                            </div>
                            <button type="submit" id="log" class="btn btn-success btn-block">Đăng nhập</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let form = $('#form');
    let form_login = $('#form_login');

    //Validate ngày VietNam
    $.validator.addMethod("vnDate", function (value, element) {
        return value.match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/);
    }, 'Ngày sinh vui lòng nhập đúng định dạng, ví 12/02/1997');

    //Bắt lỗi form
    form.validate({
        debug: true,
        rules: {
            email: {
                required: true,
                email: true,
                remote: {
                    url: '/account/checkEmail',
                    data: {
                        email: function () {
                            return $('#email').val()
                        }
                    }
                }
            },
            password: {
                required: true,
                minlength: 6
            },
            repwd: {
                equalTo: '#password'
            },
            name: 'required',
            dateOfBirth: {
                required: true,
                vnDate: true
            }

        },
        messages: {
            email: {
                required: 'Vui lòng nhập email',
                email: 'Email không đúng định dạng',
                remote: 'Email đã có người sử dụng'
            },
            password: {
                required: 'Vui lòng nhập mật khẩu',
                minlength: 'Mật khẩu tối thiểu 6 kí tự'
            },
            repwd: {
                equalTo: 'Xác nhận mật khẩu không trùng khớp'
            },
            name: 'Vui lòng điền vào họ tên',
            dateOfBirth: {
                required: 'Vui lòng điền ngày sinh',
                vnDate: 'Ngày sinh không đúng định dạng dd/mm/yyyy, ví dụ 12/02/1997'
            }
        }
    })

    //Modal đăng ký
    $('#nav_register').click(function () {
        $('#nav_login_modal').modal('hide')
        $('#nav_register_modal').modal()
    })

    //Submit form đăng ký
    form.submit(function (e) {
        e.preventDefault();
        if (form.valid()) {
            let data = form.serialize();
            $.ajax({
                url: '/account/register',
                data: data,
                method: 'POST',
                dataType: 'json',
                success: function (result) {
                    $('#nav_register_modal').modal('hide')
                    $('#nav_register_success').modal();
                }
            })
        } else {
            console.log(false)
        }
    })

    //Show modal login
    $('#nav_login').click(function () {
        $('#nav_login_modal').modal()
    })

    //Bắt lỗi form login
    form_login.validate({
        rules: {
            email: {
                required: true,
                email: true
            },
            password: {
                required: true
            }
        },
        messages: {
            email: {
                required: 'Vui lòng nhập email!',
                email: 'Email không hợp lệ!',
            },
            password: {
                required: 'Vui lòng nhập mật khẩu!'
            }
        }
    })

    // Gửi form login
    form_login.submit(function (e) {
        e.preventDefault();
        let data = form_login.serialize();
        $.ajax({
            url: '/account/login',
            data: data,
            method: 'POST',
            success: function (result) {
                if (!result) {
                    $('#login_message_fail').html('Sai thông tin đăng nhập');
                } else {
                    window.location.assign("/");
                }
            }
        })
    })

    // Promise
    function loadAllCatalog() {
        return $.ajax({
            url: '/catalog/all',
            dataType: 'json'
        })
    }

    // Load catalog lên nav
    loadAllCatalog().then(data =>
        $.each(data, function (index, item) {
            $('#catalog_list_nav').append(
                '<li><a href="/catalog?id='+item.id+'">' + item.name + '</a></li>'
            )
        })
    )
    //Tìm kiếm
    $('#kw').keyup(function () {
        $('#list_search').empty();
        let kw = $('#kw').val();
        if(kw.length == 0) {
            $('#box_search').hide();
            return;
        }
        $.ajax({
            url: '/book/search?k='+kw+'',
            success: function (data) {
                if(data.length > 0) {
                    data.forEach(item =>
                        $('#list_search').append(
                            '<li class="list-group-item">' +
                                '<a href="/book?id='+item.id+'">'+item.name+'</a>'+
                                '<span class="pull-right label label-danger">'+item.price.toLocaleString()+'đ</span>' +
                            '</li>'
                        )
                    )
                    $('#box_search').show()
                }
            }
        })
    })
    function loadCart() {
        $.ajax({
            url: '/cart/index',
            success: function (cart) {
                if($.isEmptyObject(cart)) {
                    $('#itemLenght').html('(0)')
                } else {
                    $('#itemLenght').html('('+cart.itemList.length+')');
                    cart.itemList.forEach(item =>
                        $('#itemList').append(
                            '<li><a href="#">'+item.book.name+'</a></li>'
                        )
                    )
                    $('#itemList').append(
                        '<li role="separator" class="divider"></li>' +
                        '<li class="text-center"><a href="/cart">Xem tất cả</a></li>'
                    )
                    console.log(cart.totalPrice)
                    $('#sumCart').html(''+cart.totalPrice+'')
                }
            }
        })
    }
    loadCart()
</script>