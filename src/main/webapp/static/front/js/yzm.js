// JavaScript Document
function validateCode()
{
 var inputCode=document.getElementById("inputCode").value;
 if(inputCode.length <= 0)
 {
  alert("请输入验证码！");
 }
 else if(inputCode.toUpperCase() != code.toUpperCase())
 {
   alert("验证码输入有误！");
 }
 else
 {
  alert("验证码正确！");
 }
}