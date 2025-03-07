//버전을 탄다 상위버전을 쓰려면 거기에 맞는 설정을 찾아야 함
var ckeditor_config = {
resize_enaleb : false,
enterMode : CKEDITOR.ENTER_BR,
shiftEnterMode : CKEDITOR.ENTER_P,
filebrowserUploadUrl : "/admin/goods/ckUpload"
}
CKEDITOR.replace("gdsDes", ckeditor_config);