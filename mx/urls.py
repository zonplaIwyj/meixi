from django.conf.urls import url

from mx import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^cart/$', views.cart, name='cart'),
    url(r'^addcart/$', views.addcart, name='addcart'),
    url(r'^pluscart/$', views.pluscart, name='pluscart'),
    url(r'^subcart/$', views.subcart, name='subcart'),
    url(r'^removegood/$', views.removegood, name='removegood'),
    url(r'^goods/(\d+)/$', views.goods, name='goods'),
    url(r'^register/$', views.register, name='register'),
    url(r'^login/$', views.login, name='login'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^checkphone/$', views.checkphone, name='checkphone'),
    url(r'^checkself/$', views.checkself, name='checkself'),
    url(r'^checkall/$', views.checkall, name='checkall'),
    url(r'^makeorder/$', views.makeorder, name='makeorder'),  # 下单
    url(r'^orderlist/(\d+)/$', views.orderlist, name='orderlist'),
    url(r'^orderdetail/(.+)/$', views.orderdetail, name='orderdetail'),  # 订单详情
    url(r'^mine/$', views.mine, name='mine'),  # 订单详情
    url(r'^pay/$', views.pay, name='pay'),  # 支付
    url(r'^appnotify/$', views.appnotify, name='appnotify'),  # 支付完成后(服务器)
    url(r'^returnview/$', views.returnview, name='returnview'),  # 买家支付完成后回到AXF哪个页面(客户端)
]
