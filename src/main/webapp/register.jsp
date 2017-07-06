<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
    body{
        background-color: #1cbb9b;
    }
    .login-box{
        position:relative;
        margin: 10px auto;
        width: 500px;
        height: 380px;
        background-color: #fff;
        padding: 10px;
        border-radius: 3px;
        -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.33);
        -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.33);
        box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.33);
    }
    .lb-header{
        position:relative;
        color: #00415d;
        margin: 5px 5px 10px 5px;
        padding-bottom:10px;
        border-bottom: 1px solid #eee;
        text-align:center;
        height:28px;
    }
    .lb-header a{
        margin: 0 25px;
        padding: 0 20px;
        text-decoration: none;
        color: #666;
        font-weight: bold;
        font-size: 15px;
        -webkit-transition: all 0.1s linear;
        -moz-transition: all 0.1s linear;
        transition: all 0.1s linear;
    }
    .lb-header .active{
        color: #029f5b;
        font-size: 18px;
    }
    .social-login{
        position:relative;
        float: left;
        width: 100%;
        height:auto;
        padding: 10px 0 15px 0;
        border-bottom: 1px solid #eee;
    }
    .social-login a{
        position:relative;
        float: left;
        width:calc(40% - 8px);
        text-decoration: none;
        color: #fff;
        border: 1px solid rgba(0,0,0,0.05);
        padding: 12px;
        border-radius: 2px;
        font-size: 12px;
        text-transform: uppercase;
        margin: 0 3%;
        text-align:center;
    }
    .social-login a i{
        position: relative;
        float: left;
        width: 20px;
        top: 2px;
    }
    .social-login a:first-child{
        background-color: #49639F;
    }
    .social-login a:last-child{
        background-color: #DF4A32;
    }
    .email-login,.email-signup{
        position:relative;
        float: left;
        width: 100%;
        height:auto;
        margin-top: 20px;
        text-align:center;
    }
    .u-form-group{
        width:100%;
        margin-bottom: 10px;
    }
    .u-form-group input[type="email"],
    .u-form-group input[type="password"]{
        width: calc(50% - 22px);
        height:45px;
        outline: none;
        border: 1px solid #ddd;
        padding: 0 10px;
        border-radius: 2px;
        color: #333;
        font-size:0.8rem;
        -webkit-transition:all 0.1s linear;
        -moz-transition:all 0.1s linear;
        transition:all 0.1s linear;
    }
    .u-form-group input:focus{
        border-color: #358efb;
    }
    .u-form-group button{
        width:50%;
        background-color: #1CB94E;
        border: none;
        outline: none;
        color: #fff;
        font-size: 14px;
        font-weight: normal;
        padding: 14px 0;
        border-radius: 2px;
        text-transform: uppercase;
    }
    .forgot-password{
        width:50%;
        text-align: left;
        text-decoration: underline;
        color: #888;
        font-size: 0.75rem;
    }
</style>
<style type="text/css">
    body {
        background-color: #f7f7f7;
        font-size: 13px;
        font-family: COURIER,arial,sans-serif;
    }
    h3 {
        width: 100%;
        overflow: hidden;
        height: 60px;
    }
    #main {
        font-size: 16px;
        margin-top: 150px;
        padding: 10px;
        text-align: center;
        line-height: 20px;
    }
</style>
<body>
<div id="main">
    <h1 id="head"> ... </h1> <br/>
</div>
<div class="login-box">
    <div class="lb-header">
        <a href="/login.jsp" id="login-box-link">登录</a>
        <a href="/register.jsp" class="active" id="signup-box-link">注册</a>
    </div>
    <div class="social-login">
        <a href="#">
            <i class="fa fa-facebook fa-lg"></i>
            Login in with facebook
        </a>
        <a href="#">
            <i class="fa fa-google-plus fa-lg"></i>
            log in with Google
        </a>
    </div>
    <form class="email-signup" action="/register" method="post">
        <div class="u-form-group">
            <input type="email" id="username" name="username" placeholder="Email"/>
        </div>
        <div class="u-form-group">
            <input type="password" id="password" name="password" placeholder="Password"/>
        </div>
        <div class="u-form-group">
            <input type="password" id="confirmPassword" placeholder="Confirm Password"/>
            <span id="info" style="color: Red;display: inline-block;"></span>
        </div>
        <div class="u-form-group">
           <button>注册</button>
        </div>
    </form>
</div>
<script src="/js/naive.js"></script>
</body>
<script>
    $("#signup-box-link").click(function(){
        $(".email-login").fadeOut(100);
        $(".email-signup").delay(100).fadeIn(100);
        $("#login-box-link").removeClass("active");
        $("#signup-box-link").addClass("active");
    });
    $("#login-box-link").click(function(){
        $(".email-login").delay(100).fadeIn(100);
        $(".email-signup").fadeOut(100);
        $("#login-box-link").addClass("active");
        $("#signup-box-link").removeClass("active");
    });

    // 判断两次输入的密码是否一致
    $('#confirmPassword').keyup(function checkPasswords() {
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();
        if(!confirmPassword || confirmPassword.length < password.length){
            $("#info").html("");
            return;
        }
        if (password != confirmPassword){
            $("#info").html("密码不匹配");
            document.getElementById("confirmPassword").focus();
            return;
        }
    });
    $('#confirmPassword').onblur=function(){
        if(!confirmPassword || confirmPassword.length < password.length){
            $("#info").html("");
            return;
        }
    };




//    function findStr(str,n){
//        var temp=0;
//        for(var i=0;i<str.length;i++){
//            if(str.charAt(i)==n){
//                temp++;
//            };
//        };
//        return temp;
//    };
//    window.onload=function() {
//        var userName=document.getElementById("userName");
//        var psd=document.getElementById("psd");
//        var psd1=document.getElementById("psd1");
//        var unmInfo=document.getElementsByClassName('unmInfo')[0];
//        var count=document.getElementsByClassName('count')[0];
//        var psdInfo=document.getElementsByClassName('psdInfo')[0];
//        var psd1Info=document.getElementsByClassName('psd1Info')[0];
//        var fl=document.getElementsByClassName("fl")[0];
//        var name_length=0;
//        var reg=/[^\w\u4e00-\u9fa5]/g;
//        var re_n=/[^\d]/g;
//        var re_t=/[^a-zA-Z]/g
//        userName.onfocus=function(){
//            unmInfo.style.display="inline-block";
//            unmInfo.innerHTML='<i class="warn"></i> 5-25个字符，一个汉字两个字符，推荐使用中文会员名。'
//        }
//        userName.onkeyup=function(){
//            count.style.visibility="visible";
//            name_length=getLength(this.value);
//            count.innerHTML=name_length+"个字符";
//            if(name_length==0){
//                count.style.visibility="hidden";
//            }
//        }
//        userName.onblur=function(){
//            if(reg.test(this.value)){
//                unmInfo.innerHTML='<i class="cuo"></i>含有非法字符';
//            }else if(this.value==""){
//                unmInfo.innerHTML='<i class="cuo"></i>不能为空';
//            }else if(name_length>25){
//                unmInfo.innerHTML='<i class="cuo"></i>长度超过25个字符';
//            }else if(name_length<6){
//                unmInfo.innerHTML='<i class="cuo"></i>长度少于6个字符';
//            }else{
//                unmInfo.innerHTML='<i class="right"></i>OK!';
//            }
//        }
//
//        psd.onfocus=function(){
//            psdInfo.style.display="inline-block";
//            psdInfo.innerHTML='<i class="warn"></i> 6-16个字符，请使用字母加数字或者符号，不能单独使用字母 数字或者字符。';
//        }
//        psd.onkeyup=function(){
//            if(this.value.length>5){
//                fl.className="active";
//                psd1.removeAttribute("disabled");
//                psd1Info.style.display="inline-block";
//                psd1Info.innerHTML='<i class="warn"></i> 再输入一次';
//            }else{
//                fl.className="";
//                psd1.setAttribute("disabled","disabled");
//                psd1Info.style.display="none";
//                psd1.value="";
//            }
//            if(this.value.length>10){
//                fl.className="active1";
//            }else{
//                fl.className="";
//                psd1.value="";
//            }
//
//        }
//        psd.onblur=function(){
//            var m=findStr(this.value,this.value[0]);
//            if(this.value==""){
//                psdInfo.innerHTML='<i class="cuo"></i> 不能为空';
//            }else if(m==this.value.length){
//                console.log(1);
//                psdInfo.innerHTML='<i class="cuo"></i> 不能有相同字符';
//            }else if(this.value.length<6||this.value.length>16){
//                psdInfo.innerHTML='<i class="cuo"></i> 长度应为6-16个字符';
//            }else if(!re_n.test(this.value)){
//                psdInfo.innerHTML='<i class="cuo"></i> 不能全为数字';
//            }else if(!re_t.test(this.value)){
//                psdInfo.innerHTML='<i class="cuo"></i> 不能全为字母';
//            }else{
//                psdInfo.innerHTML='<i class="right"></i> OK';
//            }
//        }

        psd1.onblur=function(){
            if(this.value!=psd.value){
                psd1Info.innerHTML='<i class="cuo"></i> 两次输入的密码不一致';
            }else{
                psd1Info.innerHTML='<i class="right"></i> OK';
            }
        }
    }
    function getLength(str){
        return str.replace(/[^\x00-xff]/g,"xx").length;
    }

</script>
</html>