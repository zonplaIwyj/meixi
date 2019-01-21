from django.db import models


# Create your models here.
class Slide(models.Model):
    img = models.CharField(max_length=256)


class User(models.Model):
    phone = models.CharField(max_length=30, unique=True)
    password = models.CharField(max_length=256)
    token = models.CharField(max_length=256)


class Good(models.Model):
    img = models.CharField(max_length=256)
    name = models.CharField(max_length=256)
    des = models.CharField(max_length=256)
    gray = models.FloatField(default=1.0)
    price = models.FloatField()


class Cart(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(Good)
    num = models.IntegerField(default=1)
    isselect = models.BooleanField(default=True)

class Order(models.Model):
    user = models.ForeignKey(User)
    # 状态  -2退款 -1过期 0未付款 1已付款 2已发货 3未评价 4已评价
    status = models.IntegerField(default=0)
    # 创建时间
    createtime = models.DateTimeField(auto_now_add=True)
    # 订单号
    identifier = models.CharField(max_length=256)
class Ordergoods(models.Model):
    # 订单
    order = models.ForeignKey(Order)
    # 商品
    goods = models.ForeignKey(Good)
    # 商品规格
    num = models.IntegerField()