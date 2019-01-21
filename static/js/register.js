$(function () {
    var isPhone = false;
    $('#register_box #phone').blur(function () {
        var reg = /^(1[3-9][\d]{9})$/
        if (reg.test($(this).val())) { // 符合要求
            $.get('/mx/checkphone/', {'phone': $(this).val()}, function (response) {
                $('.regInfo_msg').html(response.msg);
                if (response.status) {
                    isPhone = true;
                } else {
                    isPhone = false;
                }

            })
        } else {    // 不符合要求
            $('.regInfo_msg').html('请输入正确的手机号码');
        }
    })
    var isPsw = false;
    $('.psw1').blur(function () {
        var p = $(this).val();
        if (p != '' && p.length >= 6) {
            $('.regInfo_msg').html('');
            this.style.borderColor = "";
            isPsw = true;
        } else if (p == '') {
            this.style.borderColor = "#8e0c3a";
            $(".regInfo_msg").html("密码不能为空，请输入密码。")
            isPsw = false;
        } else if (p.length < 6 || p.length > 16) {
            this.style.borderColor = "#8e0c3a";
            $('.regInfo_msg').html('用户密码长度范围在6~16位之间。');
            isPsw = false
        }
    })
    $('.psw2').blur(function () {
        var p1 = $('.psw1').val();
        var p2 = $(this).val();
        if (p2 != '' && p1 == p2) {
            $('.regInfo_msg').html('');
            this.style.borderColor = "";
            isPsw = true
        } else {
            this.style.borderColor = "#8e0c3a";
            $('.regInfo_msg').html('密码不一致');
            isPsw = false;
        }
    })


    $('#subButton').click(function () {
        var isRegister = false   // 默认可以注册

        if (isPsw == true && isPhone == true) {
            isRegister = true
        }

        if (isRegister) {
            $('#register-view').submit()
        }
    })
})