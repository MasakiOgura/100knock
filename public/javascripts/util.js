////////////////////////////////////////////////
//
// util.js[ver1.1 080618]
//
////////////////////////////////////////////////

var util = {
	preloader: {
		loadedImages: [],
		load: function (url){
			var img = this.loadedImages;
			var l = img.length;
			img[l] = new Image();
			img[l].src = url;
		}
	}
};


$(function(){
$('.hover').each(function(){					  
	this.originalSrc = $(this).attr('src');
		if ((/\d\.(jpg|gif|png)/).test(this.originalSrc)){
			this.rolloverSrc = this.originalSrc.replace(/(\.)(jpg|gif|png)/,"hover.$2");	
		}else{
			this.rolloverSrc = this.originalSrc.replace(/(\.)(jpg|gif|png)/,"Hover.$2");
		}	
	util.preloader.load(this.rolloverSrc);
});

$(".hover").hover(function(){
	$(this).attr('src',this.rolloverSrc);
}, function(){
	$(this).attr('src',this.originalSrc);
});	

$("div.wrap").wrapInner('<div class="inner"></div>');			   
$("h1.wrap,h2.wrap,h3.wrap,h4.wrap,li.wrap,dt.wrap,dd.wrap").wrapInner('<span class="inner"></span>');

$('a.bl').click(function(){
window.open(this.href, '_blank');
return false;
});
});
