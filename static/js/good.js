$(function () {
    var sum = $('.g_r_num_d1_c').val()
    $('.g_r_num_d1_r').click(function () {
        sum++
        $('.g_r_num_d1_c').val(sum)
    })
    $('.g_r_num_d1_l').click(function () {
        if (sum > 1) {
            sum--
            $('.g_r_num_d1_c').val(sum)
        }
    })
    $('.addcart').click(function () {
        var goodid = $('.g_r_num_d1_r').attr('goodid')
        var number = $('.g_r_num_d1_c').val()
        $.get('/mx/addcart/', {'goodid': goodid, 'number': number}, function (response) {
            alert('已加入购入车')
        })
    })
    $('.masbuy').click(function () {
        var goodid = $('.g_r_num_d1_r').attr('goodid')
        var number = $('.g_r_num_d1_c').val()
        $.get('/mx/addcart/', {'goodid': goodid, 'number': number}, function (response) {
            window.open('/mx/cart/', target = '_self')


        })
    })

})