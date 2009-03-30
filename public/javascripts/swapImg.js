////////////////////////////////////////////////
//
// swapImg.js
//
////////////////////////////////////////////////

$(function(){
  $(".hover").hover(function(){
	var cont = $(this).attr("src");
	if ((/\d\.(jpg|gif|png)/).test(cont)){
	cont = cont.replace(/(\.)(jpg|gif|png)/,"hover.$2");	
	}else{
	cont = cont.replace(/(\.)(jpg|gif|png)/,"Hover.$2");
	}
	$(this).attr("src",cont)
}, function(){
	var cont = $(this).attr("src");
	cont = cont.replace(/(Hover|hover)\./,".");
	$(this).attr("src",cont)
}); 
});
