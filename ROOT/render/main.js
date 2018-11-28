// 弹幕定时器
var timers = [];
// 控制弹幕显隐变量
var isShow = true;
// 监听发送按钮
$(".send").on("click", function () {
    // 创建弹幕
    var jqueryDom = createScreenbullet($("#screenBulletText").val());
    // 添加定时任务
    addInterval(jqueryDom);
});
// 监听关闭弹幕按钮
$(".full").on("click", function () {
    var elem = document.getElementById("danmu"); 
	//show full screen 
	elem.webkitRequestFullScreen(); 
   
});
// 新建一个弹幕
function createScreenbullet(text) {
    var jqueryDom = $("<div class='bullet'>" + text + "</div>");
    var fontColor = "rgb(" + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + ")";
    var fontSize = 72 + "px";
    var left = ($(".screen_container").width() + Math.floor(Math.random() * 1920)) + "px";
    var top = Math.floor(Math.random() * 1080) + "px";
    top = parseInt(top) > 1000 ? "352px" : top;
    jqueryDom.css({
        "position": 'absolute',
        "color": fontColor,
        "font-size": fontSize,
        "left": left,
        "top": top,
        "opacity": 0.8,
        "height": 50
    });
    $(".screen_container").append(jqueryDom);
    return jqueryDom;
}
// 为弹幕添加定时任务
function addInterval(jqueryDom) {
    var left = jqueryDom.offset().left - $(".screen_container").offset().left;
    var timer = setInterval(function () {
        left--;
        jqueryDom.css("left", left + "px");
        if (jqueryDom.offset().left + jqueryDom.width() < $(".screen_container").offset().left) {
            jqueryDom.remove();
            clearInterval(timer);
        }
    }, 10);
    timers.push(timer);
}