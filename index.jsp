<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache">    
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">    
	<meta HTTP-EQUIV="expires" CONTENT="0">

    <title>阅读</title>
    <link rel="stylesheet" href="${basePath}/static/css/reset.css" type="text/css" />
    <link rel="stylesheet" href="${basePath}/static/css/index.css" type="text/css" />
    <link rel="stylesheet" href="${basePath}/static/css/foot.css" type="text/css" />
    <script src="${basePath}/static/js/jquery-2.2.4.js" type="text/javascript"></script>
	<script src="${basePath}/static/js/rem.js" type="text/javascript"></script>
	<script src="${basePath}/static/js/index.js" type="text/javascript" ></script>
</head>
<body>
    <div class="header">
        <img src="${basePath}/static/img/read.png">
        <span>阅读文章</span>
    </div>
    <!-- <h1 id="jsTest">ccc</h1> -->
    <!-- <h1 id="jsCookie" style="color:red"></h1> -->
    <!-- <h1 id="jsValue" style="color:blue">123</h1> -->
    <div class="main">
        <div class="main-read">
            <p>今日成功阅读</p>
            <h5 id="read">
            		<c:choose>
               			<c:when test="${readCount eq 0.0}">0</c:when>
               			<c:otherwise>
               				${readCount}
               			</c:otherwise>
               		</c:choose>
            </h5>
        </div>
        <div class="main-read">
            <p>今日阅读积分</p>
            <h5 id="points">
            	<c:choose>
               			<c:when test="${todyIntegral eq 0.0}">0</c:when>
               			<c:otherwise>
               				${todyIntegral}
               			</c:otherwise>
               		</c:choose>
            </h5>
        </div>
    </div>
    <div class="time" id="tishiyu">点击开始阅读，进入后读六秒以上，返回本页面</div>
    <!-- <div class="start-height"></div> -->
    <div class="start" id="start" onclick="start()">开始阅读</div>
    <!-- 底部 -->
    <div class="foot">
        <a href="${basePath}articleCtrl/index.do">
            <div class="foot-menu" style="border-right:1px solid #ccc;">
                <img class="foot-img" style="margin-top: -.05rem;" src="${basePath}/static/img/foot.png">
                <span style="color:#fe7501;">阅读文章</span>
            </div>
        </a>
        <a href="${basePath}registerCtrl/registerValid.do">
            <div class="foot-menu">
                <img class="foot-imgs" src="${basePath}/static/img/per.png">
                <span>个人中心</span>
            </div>
        </a>
    </div>
    <input id="refreshed" value="no" type="hidden"/>
    <input id="timmerId" style="display:none" value="no" />
    
</body>
</html>
<!-- js-cookie[https://github.com/js-cookie/js-cookie] -->
<script> 
 !function(e){var n=!1;if("function"==typeof define&&define.amd&&(define(e),n=!0),"object"==typeof exports&&(module.exports=e(),n=!0),!n){var o=window.Cookies,t=window.Cookies=e();t.noConflict=function(){return window.Cookies=o,t}}}(function(){function g(){for(var e=0,n={};e<arguments.length;e++){var o=arguments[e];for(var t in o)n[t]=o[t]}return n}return function e(l){function C(e,n,o){var t;if("undefined"!=typeof document){if(1<arguments.length){if("number"==typeof(o=g({path:"/"},C.defaults,o)).expires){var r=new Date;r.setMilliseconds(r.getMilliseconds()+864e5*o.expires),o.expires=r}o.expires=o.expires?o.expires.toUTCString():"";try{t=JSON.stringify(n),/^[\{\[]/.test(t)&&(n=t)}catch(e){}n=l.write?l.write(n,e):encodeURIComponent(String(n)).replace(/%(23|24|26|2B|3A|3C|3E|3D|2F|3F|40|5B|5D|5E|60|7B|7D|7C)/g,decodeURIComponent),e=(e=(e=encodeURIComponent(String(e))).replace(/%(23|24|26|2B|5E|60|7C)/g,decodeURIComponent)).replace(/[\(\)]/g,escape);var i="";for(var c in o)o[c]&&(i+="; "+c,!0!==o[c]&&(i+="="+o[c]));return document.cookie=e+"="+n+i}e||(t={});for(var a=document.cookie?document.cookie.split("; "):[],s=/(%[0-9A-Z]{2})+/g,f=0;f<a.length;f++){var p=a[f].split("="),d=p.slice(1).join("=");this.json||'"'!==d.charAt(0)||(d=d.slice(1,-1));try{var u=p[0].replace(s,decodeURIComponent);if(d=l.read?l.read(d,u):l(d,u)||d.replace(s,decodeURIComponent),this.json)try{d=JSON.parse(d)}catch(e){}if(e===u){t=d;break}e||(t[u]=d)}catch(e){}}return t}}return(C.set=C).get=function(e){return C.call(C,e)},C.getJSON=function(){return C.apply({json:!0},[].slice.call(arguments))},C.defaults={},C.remove=function(e,n){C(e,"",g(n,{expires:-1}))},C.withConverter=e,C}(function(){})});
</script>
<script type="text/javascript">
var timmer;
var fla = 0;
$(document).ready(function(){
	window.onpageshow = function (e) { if (e.persisted) { window.location.reload(true) } }
    
    stopSwitch();
    if($("#timmerId").val() == "yes"){
        timmer = interval(timmer);
        fla = 1;
    }
    
    var cookie = Cookies.get("comeTime");
    // $("#jsTest").html("fff"+JSON.stringify(cookie)); 
    // $("#jsCookie").html(JSON.stringify(document.cookie))
    if(cookie){
        var arr = cookie.split("_");
    	var beginTime = arr[0];
    	var endTime = Date.parse(new Date());  
    	if(beginTime != null && beginTime != 'null'){ 
    		if((endTime/1000 - beginTime/1000) >= 6){  
                var valid ="<img src='${basePath}/static/img/true.png'><span>有效阅读</span>";
        		$(".header").html(valid)
        		//大于6秒调用接口加积分
        			point("add",arr[1]);
        		if(fla > 0){
        		}
        	}else{
        		console.log("无效阅读");
        		var invalid ="<img src='${basePath}/static/img/false.png'><span>无效阅读</span>"
        		$(".header").html(invalid);
        		$("#tishiyu").html("您阅读的太快，请阅读6秒以上");
        		point("get",arr[1]);
        	}
    	}
    }else{
    	var valid ="<img src='${basePath}/static/img/read.png'><span>阅读文章</span>"
    	$(".header").html(valid);
    }
});

  
function interval(parm){
        clearInterval(timmer)
        return setInterval(function(){ start() }, 4000);
}

//  停止阅读开关
function stopSwitch(){
    var val = $("#timmerId").val();
    if(val == "yes" ){
        $("#start").html("停止阅读")
        $("#start").attr("onclick","stops()")
    }
}

function stops(){
    // clearCookie("comeTime");
    Cookies.remove('comeTime');
    clearInterval(timmer)
    var valid ="<img src='${basePath}/static/img/read.png'><span>阅读文章</span>"
    $("#tishiyu").html("点击开始阅读，进入后读六秒以上，返回本页面");
    $(".header").html(valid);
    $(".start").html("开始阅读");
    $(".start").attr("onclick","start()")
}
//  停止阅读开关结束
function start(){
    $.ajax({
            url:"${basePath}articleCtrl/nextArticle.do",
            type: "post",
            dataType:"json",
            success:function(data){
                if(data.result == 1){
                    var id = data.articleObj.id;
                    var articleUrl = data.articleObj.articleUrl;
                    Cookies.set("comeTime",Date.parse(new Date())+"_"+id)
                    // setCookie("comeTime",Date.parse(new Date())+"_"+id);
                    // $("#timmerId").show();
                    $("#timmerId").val("yes");
                    timmer = interval(timmer);
                    stopSwitch();
                    window.location.href=articleUrl;
                }else if(data.result == 0){
                	var end = Date.parse(new Date()) + (30*60*1000);
                	Cookies.set("timing",end);
                	stops();
                	$("#tishiyu").html("下一批文章将在<em>30</em>分钟后到来");
                }
            }
        })
}

function point(opt,id){
	   $.ajax({
		   url: "${basePath}integralCtrl/add.do",
		   type: "post",
		   data:{channel:"阅读",opt:opt,id:id},
		   dataType:"json",
		   success:function(data){
            //    $("#jsTest").html(JSON.stringify(data));
			   if(data){
				   if(opt == "add"){
					   $("#read").html(data.readCount);
					   $("#points").html(data.todayIntegral);
					   timmer = interval(timmer);
				   }else if(opt == "get"){
					   $("#read").html(data.readCount);
					   $("#points").html(data.todayIntegral);
				   }
			   }else{
				   stops();
			   }
		   }
	   });
}
</script>
