
$(function(){
	
	document.body.addEventListener('touchstart', function () { }); 
	
$(".clear_btn").click(function(){
  $(this).siblings("input").val("").focus();
})

  $(".add_photo_imgbtn").click(function(){  //点击"添加图片"同时点击隐藏的"选择文件"的input
  	$("#photo_select").trigger("click");
  })



$(".fault_information li a").click(function(){  //设置3中产品故障相应的故障类型在select文本框内
	$(this).addClass("fault_information_ctn_addclass").siblings().removeClass("fault_information_ctn_addclass");
	var n=$(this).index();
    var select_Text1 = $("#type_qeustion1").html();
    var select_Text2 = $("#type_qeustion2").html();   
    var select_Text3 = $("#type_qeustion3").html();
    
	if(n==0){
		     $(".fault_type #type_qeustion_default").html(select_Text1);
	       };
	if(n==1){
		     $(".fault_type #type_qeustion_default").html(select_Text2);
	       };	
	if(n==2){
		     $(".fault_type #type_qeustion_default").html(select_Text3);
	       };	
})

$(".tips_box").hide();

$(".submit_btn").click(function(){
	$(".tips_box").fadeIn(300);
	setTimeout(function(){
		$(".tips_box").fadeOut(200);
	
	},1500);

})

})







