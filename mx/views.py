import hashlib
import random
import time

from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from mx.alp import alipay
from mx.models import Slide, User, Good, Cart, Order, Ordergoods


def index(request):
    slides = Slide.objects.all()
    goods = Good.objects.all()
    token = request.session.get('token')
    data={
        'goods': goods,
        'slides': slides
    }
    if token:
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user).exclude(num=0)
        csn = carts.count()
        data = {
            'users': user,
            'carts': carts,
            'csn': csn,
            'goods': goods,
            'slides': slides
        }
        return render(request, 'index.html', data)
    else:
        return render(request, 'index.html', data)


def checkphone(request):
    phone = request.GET.get('phone')

    users = User.objects.filter(phone=phone)
    print(phone)
    if users.exists():
        return JsonResponse({'msg': '手机号已被注册!', 'status': 0})
    else:
        return JsonResponse({'msg': '手机号可以注册!', 'status': 1})


def generate_token():
    token = str(time.time()) + str(random.random())
    md5 = hashlib.md5()
    md5.update(token.encode('utf-8'))

    return md5.hexdigest()


def generate_password(phone, password):
    pho = phone[1] + phone[0] + phone[3]
    pas = password[4] + password[0] + password[1]
    jly = pho + pas
    md5 = hashlib.md5()
    md5.update(jly.encode('utf-8'))
    return md5.hexdigest()


def register(request):
    if request.method == 'GET':
        return render(request, 'register.html')
    elif request.method == 'POST':
        user = User()
        user.phone = request.POST.get('phone')
        user.password = generate_password(request.POST.get('phone'), request.POST.get('password'))
        user.token = generate_token()
        user.save()
        response = redirect('mx:index')
        request.session['token'] = user.token
        return response


def login(request):
    if request.method == 'GET':
        return render(request, 'login.html')
    elif request.method == 'POST':
        phone = request.POST.get('phone')
        password = generate_password(request.POST.get('phone'), request.POST.get('password'))
        users = User.objects.filter(phone=phone).filter(password=password)
        if users.count():
            response = redirect('mx:index')
            user = users.first()
            user.token = generate_token()
            user.save()
            request.session['token'] = user.token
            return response
        else:
            return render(request, 'login.html', context={'err': '用户名或密码错误'})


def logout(request):
    response = redirect('mx:index')
    request.session.flush()
    return response


def cart(request):
    token = request.session.get('token')
    if token:
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user).exclude(num=0)
        csn = carts.count()
        data = {
            'users': user,
            'carts': carts,
            'csn': csn
        }
        return render(request, 'cart.html', data)
    else:
        return redirect("mx:login")


def goods(request, goodid):
    good = Good.objects.get(id=goodid)
    data = {
        'good': good,
    }
    token = request.session.get('token')
    users = User.objects.filter(token=token)
    carts = Cart.objects.filter(user=users).exclude(num=0)
    csn = carts.count()
    if users:
        data["users"] = users.first()
        data['csn'] = csn
    return render(request, 'goods_des.html', data)


def addcart(request):
    token = request.session.get('token')
    user = User.objects.filter(token=token).first()
    goodid = request.GET.get('goodid')
    goods = Good.objects.get(pk=goodid)
    number = int(request.GET.get('number'))



    carts = Cart.objects.filter(user=user).filter(goods=goods)
    csn = carts.count()
    if carts.exists():  # 存在
        cart = carts.first()
        cart.num = cart.num + number
        cart.save()
    else:  # 不存在
        cart = Cart()
        cart.user = user
        cart.goods = goods
        cart.num = number
        cart.save()
    return JsonResponse({'number': cart.num, 'status': 1,'csn':csn})


def pluscart(request):
    token = request.session.get('token')
    user = User.objects.filter(token=token).first()
    goodid = request.GET.get('goodid')
    goods = Good.objects.get(pk=goodid)
    carts = Cart.objects.filter(user=user).filter(goods=goods)
    cart = carts.first()
    cart.num = cart.num + 1
    cart.save()

    return JsonResponse({'number': cart.num, 'status': 1})


def subcart(request):
    token = request.session.get('token')
    user = User.objects.filter(token=token).first()
    goodid = request.GET.get('goodid')
    goods = Good.objects.get(pk=goodid)
    carts = Cart.objects.filter(user=user).filter(goods=goods)
    cart = carts.first()
    if cart.num >= 2:
        cart.num = cart.num - 1
        cart.save()
        return JsonResponse({'number': cart.num, 'status': 1})


def removegood(request):
    token = request.session.get('token')
    user = User.objects.filter(token=token).first()
    goodid = request.GET.get('goodid')
    goods = Good.objects.get(pk=goodid)
    carts = Cart.objects.filter(user=user).filter(goods=goods)
    cart = carts.first()
    cart.num = 0
    cart.save()
    response = redirect('mx:cart')
    return response


def checkself(request):
    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect
    cart.save()

    responseData = {
        'msg': '修改状态成功',
        'status': '1',
        'isselect': cart.isselect
    }

    return JsonResponse(responseData)


def checkall(request):
    isall = request.GET.get('isall')
    print(isall)
    if isall == 'true':
        isall = True
    else:
        isall = False
    token = request.session.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user)
    for cart in carts:
        cart.isselect = isall
        cart.save()
    responseData = {
        'status': '1',
        'msg': '全选/取消全选 操作成功'
    }

    return JsonResponse(responseData)


def generate_identifire():
    tempstr = str(int(time.time())) + str(random.random())[2:]
    return tempstr


def makeorder(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    # 订单
    order = Order()
    # 对应的用户
    order.user = user
    # 订单号
    order.identifier = generate_identifire()
    order.save()
    # 订单商品
    carts = Cart.objects.filter(user=user).filter(isselect=True).exclude(num=0)
    for cart in carts:
        orderGoods = Ordergoods()
        orderGoods.order = order
        orderGoods.goods = cart.goods
        orderGoods.num = cart.num
        orderGoods.save()
        # 从购物车中删除
        cart.delete()
    data = {
        'msg': '下单成功',
        'status': 1,
        'identifier': order.identifier
    }
    return JsonResponse(data)


def orderdetail(request, identifier):
    order = Order.objects.get(identifier=identifier)
    return render(request, 'orderdetail.html', context={'order': order})


def orderlist(request, status):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    orders = Order.objects.filter(user=user).filter(status=status)
    return render(request, 'orderlist.html', {'orders': orders})


def mine(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    orders = Order.objects.filter(user=user)
    waitpay = orders.filter(status=0).count()
    paydone = orders.filter(status=1).count()
    data = {'user': user,
            'waitpay': waitpay,
            'paydone': paydone
            }
    return render(request, 'mine.html',data)


@csrf_exempt
def appnotify(request):
    if request.method == 'POST':
        print('xiu')
        from urllib.parse import parse_qs
        body_str = request.body.decode('utf-8')
        post_data = parse_qs(body_str)
        post_dir = {}
        for key, value in post_data.items():
            post_dir[key] = value[0]
        out_trade_no = post_dir['out_trade_no']
        # 更新状态
        Order.objects.filter(identifier=out_trade_no).update(status=1)
        return JsonResponse({'msg': 'success'})

def returnview(request):

    return redirect('mx:mine')


def pay(request):
    identifier = request.GET.get('identifier')
    order = Order.objects.get(identifier=identifier)
    sum = 0
    for ordergoods in order.ordergoods_set.all():
        sum += ordergoods.goods.price * ordergoods.num

    # 支付地址
    url = alipay.direct_pay(
        subject='比较贵的包包',  # 支付宝页面显示的标题
        out_trade_no=identifier,
        total_amount=str(sum),
        return_url='http://120.78.209.92/mx/result/'
    )

    # 拼接上支付网关
    alipayurl = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=url)

    return JsonResponse({'alipayurl': alipayurl, 'status': 1})


