//展开按钮旋转效果
$(".order_particulars img").click(function(){
	$(this).toggleClass("rotate_toggleclass")
	$(".order_particulars_cnt").slideToggle(200)
})
//环节信息收缩效果
$(".order_flow_ctn_R p").addClass("order_flow_ctn_R_p_toggleclass")
$(".order_flow_ctn_R .more_btn").click(function(){
	$(this).toggleClass("rotate_toggleclass2")
	$(this).siblings(".order_flow_ctn_R p").toggleClass("order_flow_ctn_R_p_toggleclass")
})

//目前环节的效果（展开）
$(".order_flow_ctn_R:eq(3) p").removeClass("order_flow_ctn_R_p_toggleclass")
$(".order_flow_ctn_R:eq(3) .more_btn").hide()
	
	


$(".order_flow_ctn_R:eq(0) *,.order_flow_ctn_L:eq(3)").css("color","#03b231")
$(".order_flow_ctn_R:eq(0) .flow_mark_img").attr("src","img/flow_mark_green.png")

//环节无信息是样式
$(".order_flow_ctn_L:eq(4), .order_flow_ctn_L:eq(5),.order_flow_ctn_L:eq(6),.order_flow_ctn_L:eq(7)").addClass("order_flow_ctn_L_null")
$(".order_flow_ctn_R:eq(4),.order_flow_ctn_R:eq(5),.order_flow_ctn_R:eq(6),.order_flow_ctn_R:eq(7)").addClass("order_flow_ctn_R_null").children(".more_btn,li").hide()
//最后一个环节的样式调整
$(".order_flow_ctn_R:last").css("border-color","#FFFFFF")
$(".order_flow_ctn1:last").css("padding-bottom","30px")


//催装提交
$(".header_btn2").click(function(){
	$(".expedite_install_box").show()
})
$(".e_i_c_submit_btn").click(function(){
	$(".e_i_succeedTips").show(300).siblings(".expedite_install_ctn").hide(100)
})
