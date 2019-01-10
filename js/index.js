/**
 * cookie 设置
*/
function setCookie(cname, cvalue, expiredays, path, secure){
    console.log("setCookie");
    var str = cname + "=" + encodeURIComponent(cvalue);
    if(expiredays){
        var date = new Date();
        date.setTime(date.getTime() + expiredays * 24 * 60 * 60 * 1000);
        str += "; expires=" + date.toUTCString();
    }
    str += document.domain ? "; domain=" + document.domain : "";
    str += "; path=" + (path ? path : "/");
    str += secure ? "; secure" : "";
    document.cookie = str;
}
/**
 * cookie 获取
*/
function getCookie(cname){
    var tempArr = document.cookie.split("; ");
    for(var i=0; i<tempArr.length; i++){
        var arr = tempArr[i].split('=');
        if(arr[0] == cname){
            return arr[1];
        }
    }
    return null;
}
// 
var timmer;
$(document).ready(function(){
    stopSwitch();
    point();
    console.log("val:"+$("#timmerId").val());
    if($("#timmerId").val() == "yes"){
        timmer = interval(timmer);
    }
    
	var beginTime = getCookie("comeTime");
	var endTime = Date.parse(new Date());
	if((endTime/1000 - beginTime/1000) >= 6){
        var valid =
            `
            <img src="img/true.png">
            <span>有效阅读</span>
            `
        $(".header").html(valid)
        //   alert("大于6秒为有效阅读");
	}else{
        var invalid =
            `
            <img src="img/false.png">
            <span>无效阅读</span>
            `
        $(".header").html(invalid)
		  alert("小于6秒阅读无效");
	}
});

function interval(parm){
        clearInterval(timmer)
        return setInterval(() => { start() }, 3000);
}
// 累计阅读积分
    function point(){
        $.ajax({
            url: "http://192.168.0.206:8080/ReadArticle/integralCtrl/add.do",
            type: "post",
            data:{},
            dataType:"json",
            success(data){
                console.log(data)
                $("#read").html(data.readCount)
                $("#points").html(data.todayIntegral)
            }
        })
    }
// 累计阅读积分结束
//  停止阅读开关
function stopSwitch(){
    console.log("stopSwitch")
    var val = $("#timmerId").val();
    if(val == "yes" ){
        $("#start").html("停止阅读")
        $("#start").attr("onclick","stops()")
     }
}
function stops(){
    clearInterval(timmer)
    $(".start").html("开始阅读")
    $(".start").attr("onclick","start()")
}
//  停止阅读开关结束
   function start(){
    $.ajax({
            url: "http://192.168.0.206:8080/ReadArticle/articleCtrl/nextArticle.do",
            type: "post",
            dataType:"json",
            success(data){
                console.log(data.result)
                if(data.result == 1){
                    setCookie("comeTime",Date.parse(new Date()));
                    interval(timmer);
                    $("#timmerId").val("yes");
                    stopSwitch()
                    window.location.href=data.mess
                    
                }
                
            }
        })
       
   }
    
        
    