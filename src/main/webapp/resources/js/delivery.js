$(".delivery1_btn").click(function(){
    $(".delivery").val("배송중");
    run();
});
$(".delivery2_btn").click(function(){
    $(".delivery").val("배송완료");
    run();
});
run = () => {
    $("deliveryForm").submit();
}