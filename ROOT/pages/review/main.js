$(".ajaxstart").on("click", function () {
    var timer = setInterval(function () {
        $.ajax({url: "ajax.jsp?id=" + String(id), success: function(result){
        }});
    }, 10000);
});

$(".btn btn-gradient-success btn-sm").on("click",function(){
	var Json_Object=JSON.Parse($("this").attr("info"));
	for (i=0;i<Json_Object.length;i++){
		console.log(Json_Object[i].text);
		var jqueryDom = createScreenbullet(Json_Object[i].text);
		addInterval(jqueryDom);
		if (Json_Object[i].id > id){
			id = Json_Object[i].id;
		}
		
		$.ajax({url: "ajax.jsp?id=" + Json_Object[i].id+"&openid=" + Json_Object[i].openid+"&text="+Json_Object[i].text+"&reviewer="+Json_Object[i].reviewer, success: function(result){
			window.location.reload();
		}});
	}
});