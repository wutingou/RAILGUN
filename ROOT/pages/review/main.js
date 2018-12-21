$(".ajaxstart").on("click", function () {
    var timer = setInterval(function () {
        $.ajax({url: "ajax.jsp?id=" + String(id), success: function(result){
        }});
    }, 10000);
});

$("#accept").on("click",function(){
	var Json_Object=JSON.Parse($("this").attr("info"));
	for (i=0;i<Json_Object.length;i++){
		$.ajax({url: "ajax.jsp?status=accept&id=" + Json_Object[i].id+"&openid=" + Json_Object[i].openid+"&text="+Json_Object[i].text+"&reviewer="+Json_Object[i].reviewer, success: function(result){
			window.location.reload();
		}});
	}
});

$("#reject").on("click",function(){
	var Json_Object=JSON.Parse($("this").attr("info"));
	for (i=0;i<Json_Object.length;i++){
		$.ajax({url: "ajax.jsp?status=reject&id=" + Json_Object[i].id+"&openid=" + Json_Object[i].openid+"&text="+Json_Object[i].text+"&reviewer="+Json_Object[i].reviewer, success: function(result){
			window.location.reload();
		}});
	}
});