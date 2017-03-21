//登陆
function login() {
    window.location.href = "/Front/Product/Buyer/tologin?returnUrl="+window.location.href;
}
//删除购物车中的商品
function delProduct(skuId) {
    window.location.href='/Front/Product/Buyer/indexdelete?SkuId='+skuId;
}
//跳转到我的订单
function myOrder() {
    window.location.href="/Front/order/toOrders?returnUrl="+window.location.href;
}
//退出
function logout() {
    window.location.href="/Front/Product/Buyer/out";

}