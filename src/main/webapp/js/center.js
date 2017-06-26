$(function(){
	$('.menu dt').click(function(){
		$(this).next('dd').toggle();
		$(this).find('span').toggleClass('open');
	});
	$('.menu dd em').click(function(){
		$(this).next('ul').toggle();
		$(this).find('span').toggleClass('open');
	});
	$('.menu dd li').click(function(){
		$('.menu dd li').removeClass('curr');
		$(this).addClass('curr');
	});
	$('#icSs').toggle(function(){
		$(".leftSide dl").hide();
		$(this).addClass('djH');
		$('.leftSide').css('width','0');
		$('#icSs').css('right','-15px');
		$('.rightSide').find('iframe').width($(document).width()-13);
		$('.rightSide').css('margin-left','0');
	}, function(){
		$(".leftSide dl").show();
		$(this).removeClass('djH');
		$('.leftSide').css('width','165px');
		$('#icSs').css('right','-11px');
		$('.rightSide').find('iframe').width($('.rightSide').find('iframe').width()-157); 
		$('.rightSide').css('margin-left','165px'); 
	}); 
	
	$('.option span').click(function(){
		var _index = $('.option span').index(this);
		$(this).addClass('on').siblings('span').removeClass('on');
		$('dl.menu').eq(_index).show().siblings('.menu').hide();
	});
	$('.option em').click(function(){
		$('.option span:not(:eq(0))').toggle();
	});
	$(".seeInfo").click(function(){
		openBox('gdBox','bclose');
	});
	//阀值预警table背景色
	$('.yjFr tr td').slice(0,12).css('color','#CE0C0C');
	$(".hhpTable tr,.bmTable tr,.tsrTable tr").find("td:eq(0),td:eq(1)").addClass('tdObg');
	$(".hhpTable th:eq(1),.bmTable th:eq(1),.tsrTable th:eq(1)").addClass('tdTwo');
	$(".hhpTable tr,.bmTable tr,.tsrTable tr").find("td:eq(1)").addClass('tdTwo');
	$(".hhpTable tr").find("td:eq(2),td:eq(6)").addClass('tdCss1');
	$(".hhpTable tr").find("td:eq(3),td:eq(7)").addClass('tdCss2');
	$(".hhpTable tr").find("td:eq(4),td:eq(8)").addClass('tdCss3');
	$(".hhpTable tr").find("td:eq(5),td:eq(9)").addClass('tdCss4');
	$('#hhpSz').click(function(){
		if($(this).is(':checked')){
			$('.hhpTable .szTxt').show();
		}else{
			$('.hhpTable .szTxt').hide();
		}
	});
	//	bmTable
	$(".bmTable tr").find("td:eq(2),td:eq(5),td:eq(8)").addClass('tdCss2');
	$(".bmTable tr").find("td:eq(3),td:eq(6),td:eq(9)").addClass('tdCss3');
	$(".bmTable tr").find("td:eq(4),td:eq(7),td:eq(10)").addClass('tdCss4');
	$('#bmSz').click(function(){
		if($(this).is(':checked')){
			$('.bmTable .szTxt').show();
		}else{
			$('.bmTable .szTxt').hide();
		}
	});
	//  tsrTable
	$(".tsrTable tr").find("td:eq(2)").addClass('tdObg');
	$(".tsrTable tr").find("td:eq(3)").addClass('tdCss2');
	$(".tsrTable tr").find("td:eq(4)").addClass('tdCss3');
	$(".tsrTable tr").find("td:eq(5)").addClass('tdCss4');
	$('#tsrSz').click(function(){
		if($(this).is(':checked')){
			$('.tsrTable .szTxt').show();
		}else{
			$('.tsrTable .szTxt').hide();
		}
	});
	$('.smBg').next('em').css('left','52%');
	$('.inBg').next('em').css('left','55%');
	$('.bigBg').next('em').css('left','60%');
	$('.tsrTable .smBg').next('em').css('left','51%');
	$('.tsrTable .inBg').next('em').css('left','52%');
	$('.tsrTable .bigBg').next('em').css('left','53%');
	$('.smBg,.inBg,.bigBg').mouseover(function(){
		if($('#hhpSz').is(':checked')){
			if($(this).next('em').is(':visible')){
				$(this).next('em').show();
				$(this).css('opacity','0.8');
			}else{
				$(this).next('em').hide();
				$(this).css('opacity','1');
			}
		}else if($('#bmSz').is(':checked')){
			if($(this).next('em').is(':visible')){
				$(this).next('em').show();
				$(this).css('opacity','0.8');
			}else{
				$(this).next('em').hide();
				$(this).css('opacity','1');
			}
		}else if($('#tsrSz').is(':checked')){
			if($(this).next('em').is(':visible')){
				$(this).next('em').show();
				$(this).css('opacity','0.8');
			}else{
				$(this).next('em').hide();
				$(this).css('opacity','1');
			}
		}else{
			$(this).next('em').show();
			$(this).css('opacity','0.8');
		}
	});
	$('.smBg,.inBg,.bigBg').mouseout(function(){
		if($('#hhpSz').is(':checked')){
			if($(this).next('em').is(':visible')){
				$(this).next('em').show();
				$(this).css('opacity','1');
			}else{
				$(this).next('em').hide();
				$(this).css('opacity','1');
			}
		}else if($('#bmSz').is(':checked')){
			if($(this).next('em').is(':visible')){
				$(this).next('em').show();
				$(this).css('opacity','1');
			}else{
				$(this).next('em').hide();
				$(this).css('opacity','1');
			}
		}else if($('#tsrSz').is(':checked')){
			if($(this).next('em').is(':visible')){
				$(this).next('em').show();
				$(this).css('opacity','1');
			}else{
				$(this).next('em').hide();
				$(this).css('opacity','1');
			}
		}else{
			$(this).next('em').toggle();
			$(this).css('opacity','1');
		}
	});
	$('.bInfo dl dt').click(function(){
		$(this).next('dd').toggle();$(this).find('i').toggleClass('addI');
	})
	$('.bfo dl dt').click(function(){
		$(this).next('dd').toggle();$(this).find('i').toggleClass('addI');
	})
})
//弹出层
function openBox(_sbox,_cbtn){
	//添加半透明遮罩背景层
	if(0 == $('#mask').length){$('body').append('<div id="mask" style="position:absolute;top:0;left:0;background:#333;width:100%;filter:alpha(opacity=80);opacity:0.8;"></div>');}
	//显示层
	$('#mask,#'+_sbox).show();
	//定位弹出层
	var domHtml = $('html')[0];// domHtml = document.documentElement
	var domBody = $('body')[0];// domBody = document.body
	$('#'+_sbox).css({position : 'absolute',zIndex : '9999'});
	$('#'+_sbox).css('top',Math.floor(domHtml.clientHeight / 2)-Math.floor($('#'+_sbox)[0].offsetHeight / 2)+Math.max(domHtml.scrollTop,domBody.scrollTop)+'px');
	$('#'+_sbox).css('left',Math.floor(domHtml.clientWidth / 2)-Math.floor($('#'+_sbox)[0].offsetWidth / 2)+Math.max(domHtml.scrollLeft,domBody.scrollLeft)+'px');
	//设置半透明遮罩背景层高度
	$('#mask').css('height',Math.max(Math.ceil(domHtml.clientHeight),Math.max(domHtml.scrollHeight,domBody.scrollHeight))+'px');
	
	//点击关闭
	$('.'+_cbtn+',#'+_cbtn).click(function(){
		$('#mask,#'+_sbox).hide();
	});
}