var getCode = document.getElementsByClassName('forget-getCode')[0];
var forget = document.getElementsByClassName('forget-btn')[0];
var tel = document.getElementsByClassName('forget-tel')[0];
var pwd = document.getElementsByClassName('forget-pwd')[0];
var confirm = document.getElementsByClassName('forget-confirm')[0];
var code = document.getElementsByClassName('forget-inputCode')[0];
var telTips = document.getElementsByClassName('tel-tips')[0];
var pwdTips = document.getElementsByClassName('pwd-tips')[0];
var codeTips = document.getElementsByClassName('code-tips')[0];
var timer = null;
var seconds = 60;
var flag = false;

function tipsDisappear() {
   tel.onfocus = function () {
       telTips.style.display = 'none';
   }
   pwd.onfocus = function () {
       pwdTips.style.display = 'none';
   }
   confirm.onfocus = function () {
       pwdTips.style.display = 'none';
   }
   code.onfocus = function () {
       codeTips.style.display = 'none';
   }
}

function codeTime() {
   getCode.onclick = function () {
      if(flag) {
          return;
      }
      var mobile = tel.value.replace(/\s*/g,"");
      if(ifNum(mobile)) {
         if(mobile.length === 11){
             console.log(true);
             sendCodeAjax(mobile)
         }else{
             telTips.style.display = 'block';
             return;
         }
      }else{
         telTips.style.display = 'block';
         return;
      }
      // 此处应发ajax请求，看是否发送出验证码
      setTimeout(function () {
          clearInterval(timer);
          _this.innerText = '点击获取验证码'
          seconds = 60;
          flag = false;
      }, 60000);
      var _this = this;
      flag = true;
      _this.innerText = seconds + '秒后重新发送验证码';
      timer = setInterval(function () { 
          seconds--;
          _this.innerText = seconds + '秒后重新发送验证码';
      }, 1000)
   }
}

function forgetPwd() {
   forget.onclick = function () {
      var obj = {
          tel : tel.value,
          pwd : pwd.value,
          confirm : confirm.value,
          code : code.value
      }
      obj = replaceSpace(obj);
      console.log(obj)
      for(var i in obj){
          if(obj[i] === ''){
              alert('输入内容不可为空');
              return;
          }
          if(!ifReg(obj[i])){
              alert('不可输入非数字，大小写字母以外任何符号以及汉字');
              return;
          }
      }
      if(ifNum(obj.tel)) {
          if(obj.tel.length !== 11){
              telTips.style.display = 'block';
              return;
          }
      }else{
          telTips.style.display = 'block';
          return;
      }
      if(obj.pwd !== obj.confirm){
          pwdTips.style.display = 'block';
          return;
      }
      if(ifNum(obj.code)) {
          if(obj.code.length !== 6){
              codeTips.style.display = 'block';
              return;
          }
      }else{
          codeTips.style.display = 'block';
          return;
      }
      console.log(1)
      sendForgetAjax(obj)
      // 发送ajax
    } 
}
function sendCodeAjax(mobile) {
    $.ajax({
        url : 'http://39.107.70.188:6116/user/sendsms/' + mobile,
        type : 'post',
        dataType : 'json',
        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
        success : function (res) {
            if(res.flag){
                alert('验证码已发送');
            }else{
                alert('验证码发送失败，60s以后再试');
            }
        }
    }) 
}

function sendForgetAjax(obj) {
   console.log(obj);
   var codeValue = code.value;
   var user = {

   }
   user.mobile = obj.tel;
   user.password = obj.pwd;
   user = JSON.stringify(user);
   $.ajax({
       url : 'http://39.107.70.188:6116/user/updatepassword/' + codeValue,
       type : 'post',
       data : user,
       contentType : 'application/json; charset=UTF-8',
       dataType : 'json',
       success : function (res) {
           if(res.flag) {
               if(alert('修改成功，点击确定后返回主页')) {
                   window.location.href = './index.html';
               }
           }else{
               alert('手机号输入有误或验证码输入有误，请重试！');
               return false;
           }
       }
   })
}

function init() {
   backToPrevious(); 
   forgetPwd();
   codeTime();
   tipsDisappear();
}
init();