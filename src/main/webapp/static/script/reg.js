function checkname() {
    var nameObj = document.getElementById("name");
    if (nameObj.value.trim() == "" || nameObj.value.trim() == null) {
        document.getElementById("cname").innerHTML = "账号不允许为空";
        return false;
    } else {
        document.getElementById("cname").innerHTML = "";
        return true;
    }
}

function checkpwd() {
    var pwdObj = document.getElementById("pwd");

    if (pwdObj.value.trim() == "" || pwdObj.value.trim() == null) {
        document.getElementById("cpwd").innerHTML = "密码不允许为空";
        return false;
    } else {
        document.getElementById("cpwd").innerHTML = "";
        return true;
    }

}

function checkrpwd() {
    var rpwdObj = document.getElementById("rpwd");
    var pwdObj = document.getElementById("pwd");
    if (pwdObj.value.trim() != rpwdObj.value.trim()) {
        document.getElementById("crpwd").innerHTML = "两次密码不相同";
        return false;
    } else {
        document.getElementById("crpwd").innerHTML = "";
        return true;
    }
}

function checktel() {
    var telObj = document.getElementById("tel");
    var reg = /^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/; // 手机号码13，14，15，18开头
    if (!reg.test(telObj.value.trim())) {
        document.getElementById("ctel").innerHTML = "手机号码格式不正确";
        return false;
    } else {
        document.getElementById("ctel").innerHTML = "";
        return true;
    }
}

function checkAll() {
    return checkname() && checkpwd() && checkrpwd() && checktel();
}