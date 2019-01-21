$(function () {
    sumprice()
    $('.g_r_num_d1_r').click(function () {
        sumprice()
        var goodid = $(this).attr('goodid')
        sumprice()
        var $that = $(this)
        sumprice()
        $.get('/mx/pluscart/', {'goodid': goodid}, function (response) {
            sumprice()
            $that.prev().val(response.number)
            sumprice()
        })
        sumprice()
    })
    $('.g_r_num_d1_l').click(function () {
        sumprice()
        var goodid = $(this).attr('goodid')
        sumprice()
        var $that = $(this)
        sumprice()
        $.get('/mx/subcart/', {'goodid': goodid}, function (response) {
            $that.next().val(response.number)
            sumprice()
        })
        sumprice()
    })
    $('.removegood').click(function () {
        sumprice()
        var goodid = $(this).attr('goodid')
        $.get('/mx/removegood/', {'goodid': goodid}, function (response) {
            window.open('/mx/cart/', target = '_self')
        })
    })
    $('.checkself').click(function () {
        sumprice()
        var cartid = $(this).attr('cartid')
        var $that = $(this)
        $.get('/mx/checkself/', {'cartid': cartid}, function (response) {
            var isselect = response['isselect']
            $that.attr('isselect', isselect)
            $that.children().remove()
            if (isselect) {
                $that.append('<img class="isok"  src="/static/img/ok.png">')
                sumprice()
            } else {
                $that.append('<img src="/static/img/no.png">')
                sumprice()
            }
        })
    })
    $('.checkall').click(function () {
        sumprice()
        var isall = $(this).attr('isall')
        var $that = $(this)
        isall = (isall == 'true') ? true : false
        isall = !isall
        $(this).attr('isall', isall)
        $(this).children().remove()
        if (isall) {
            $that.append('<img src="/static/img/ok.png">')
            sumprice()
        } else {
            $that.append('<img src="/static/img/no.png">')
            sumprice()
        }
        data = {
            'isall': isall
        }
        $.get('/mx/checkall/', data, function (response) {
            if (response.status == 1) {
                $('.checkself').each(function () {
                    if (isall) {
                        $(this).children().remove()
                        $(this).append('<img class="isok"  src="/static/img/ok.png">')
                        sumprice()
                    } else {
                        $(this).children().remove()
                        $(this).append('<img src="/static/img/no.png">')
                        sumprice()
                    }

                })

            }
        })
    })

    function sump() {
        $('.carttab').each(function () {
            var price = $(this).find('.cartneir').find('.price').html()
            var number = $(this).find('.cartneir').find('.g_r_num_d1_c').val()
            $(this).find('.prices').html(parseInt(price) * parseInt(number))
        })
    }

    function ssmp() {
        var sssmp = 0
        $('.carttab').each(function () {
            var sprice = $(this).find('.prices').html()
            var isok = $(this).find('.checkself').children().first().hasClass('isok')
            if (isok) {
                sssmp += parseInt(sprice)
            } else {
            }

        })
        $('#ssmp').html(sssmp)
    }

    function sumprice() {
        sump()
        ssmp()
    }

    sumprice()
    $('.jiesuan').click(function () {
        $.get('/mx/makeorder/', function (response) {
            if (response.status == 1) {
                window.open('/mx/orderdetail/' + response.identifier + '/', target = '_self')
            }

        })
    })
})