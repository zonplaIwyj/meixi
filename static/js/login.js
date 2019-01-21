$(function () {
	var isPhone = false;
    $('#register_box #phone').blur(function () {
        var reg = /^(1[3-9][\d]{9})$/
        if (reg.test($(this).val())) { // 符合要求
			 isPhone = true;
        } else {    // 不符合要求
            $('.regInfo_msg').html('请输入正确的手机号码');
        }
    })
	var isPsw = false;
    $('.psw').blur(function () {
        var p = $(this).val();
        if (p != '' && p.length >= 6) {
             $('.regInfo_msg').html('');
            this.style.borderColor = "";
            isPsw = true;
        } else if (p == '') {
            this.style.borderColor = "#8e0c3a";
            $(".regInfo_msg").html("密码不能为空，请输入密码。")
        } else if (p.length < 6 || p.length > 16) {
            this.style.borderColor = "#8e0c3a";
            $('.regInfo_msg').html('用户密码长度范围在6~16位之间。');
        }
    })

	    $('#subButton').click(function () {
        var isRegister = false   // 默认不可以

        if (isPsw == true && isPhone == true) {
            isRegister = true
        }

        if (isRegister) {
            $('#register-view').submit()
        }
    })
})