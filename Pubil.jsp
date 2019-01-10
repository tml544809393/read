<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>阅读</title>
    <link rel="stylesheet" href="${basePath }static/css/reset.css" type="text/css" />
    <link rel="stylesheet" href="${basePath }static/css/pubil.css" type="text/css" />
    <script src="${basePath }static/js/jquery-2.2.4.js"></script>
    <script src="${basePath }static/js/rem.js"></script>
    <script type="text/javascript" src="http://static.runoob.com/assets/qrcode/qrcode.min.js"></script>
</head>
<body>
    <h3>1、文字收徒</h3>
    <div class="header" id="texts">
        <p>👏👏👏源点阅读</p>
        <p>不需要下载☕☕☕☕</p>
        <p style="line-height:.35rem;">每个文章看6秒，每天轻松1至5元左右🚩🚩</p>
        <p>5元提现微信秒到💰💰💰💰</p>
        <p>👉👉👉点开链接开始赚钱</p>
        <p><a style="color: #6666C7;" href="${basePath }articleCtrl/index.do?mid=${wcObj.id }">${basePath }articleCtrl/index.do?mid=${wcObj.id }</a>
        </p>
        <p style="line-height:.35rem;">
        	👍👍👍👍👍免费平台哪家强😏源点阅读他最强💰💰💰💰💰
        </p>
        <textarea id="input">copy</textarea>
    </div>
    <button class="copy" onclick="copyText()">复制文字收徒文案发给好友</button>
    
    <h3>2、图片收徒方式</h3>
    <div class="friend">(长按保存下方图片发给还有收徒)</div>
    <div style="display:block;margin:auto;height:9rem;width:91%;"><canvas id="canvas" style="display:none"></canvas></div>
    <div id="qrcode" style="display:none;"></div>
    <div class="foot">
        <h4>收徒小技巧</h4>
        <p>1.邀请您的加家人、朋友、同学同事成功率最高</p>
        <p>2.分享到3个以上微信群/QQ群，成功收徒的几率<em>提升200%</em></p>
        <p>3.您的徒弟通过阅读 您也将会受到奖励</p>
    </div>
    <!-- <input id="text" type="text" value="${basePath }articleCtrl/index.do?mid=${wcObj.id }" style="display:none;" /> -->
</body>
</html>
<script>
     // 复制文本内容
 function copyText() {
      var text = document.getElementById("texts").innerText;
      var input = document.getElementById("input");
      input.value = text;
      input.select(); 
      document.execCommand("copy");
      alert("复制成功");
    } 

         // 动态获取二维码
  new QRCode('qrcode', {  
  text: '${basePath }articleCtrl/index.do?mid=${wcObj.id }', 
  width: 128,  
  height: 128,  
  colorDark : '#000000',  
  colorLight : '#ffffff',  
  correctLevel : QRCode.CorrectLevel.H  
}) 
    // 画布开始
  document.getElementById('canvas')  
    canvas.width = 341;  
    canvas.height = 512;  
    var ctx = canvas.getContext('2d');  
    var img = new Image();  
    img.src = '${basePath }static/img/banner.png';  
    function convertCanvasToImage(canvas) {
    var image = new Image();
    image.src = canvas.toDataURL("image/png");
    return image;
    }
    var mycans = $('canvas')[1];//二维码所在的canvas
    var codeimg = convertCanvasToImage(mycans)
    img.onload = function() { 
    var width = img.width / 2;  
    var height = img.height / 2;  
    ctx.drawImage(img, 0, 0, 350,500); 
    ctx.drawImage(codeimg, 115, 270, 120, 120);
    }
    // codeimg.src = canvas.toDataURL("image/png")
    // 动态二维码生成
    // var qrcode = new QRCode(document.getElementById("qrcode"), {
    //         width : 100,
    //         height : 100
    // });
    // function makeCode () {		
    //     var elText = document.getElementById("text");
    //     if (!elText.value) {
    //         alert("Input a text");
    //         elText.focus();
    //         return;
    //     }
    //     qrcode.makeCode(elText.value);
    // }
    // makeCode();
    // $("#text").
    //     on("blur", function () {
    //         makeCode();
    //     }).
    //     on("keydown", function (e) {
    //         if (e.keyCode == 13) {
    //             makeCode();
    //         }
	// });
   
</script>