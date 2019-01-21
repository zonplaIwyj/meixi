$(function () {
    $('#pay').click(function () {
        var identifier = $(this).attr('identifier')
        data = {
            'identifier':identifier
        }
        $.get('/mx/pay/', data, function (response) {
            console.log(response)
            if (response.status == 1){
                window.open(response.alipayurl, target='_self')
            }
        })
    })
})