<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<script type="text/javascript">
//전체 클릭시
function all(data) {
	let arr = '${bool}'
	
	$(".img").attr('style','none');
	$(".p").attr('href',"javascript:all('p')");
	$(".s").attr('href',"javascript:all('s')");
	$(".c").attr('href',"javascript:all('c')");
	$.ajax("storejson.do?order="+data, {
		type: "get",
		dataType : "json",
		traditional : true,
		success : function(data){
			$("#all").attr('style','border-color: #3fe8d9');
			let add = "";
			$.each(data, function(index, value){
				add += '<div class="col-9 col-sm-6 col-md-4 col-lg-4">';
				add += '<div class="single-product-area mb-30">';
				add += '<div class="product_image">';
				add += '<img id="img" class="normal_img" src="imgs/' + this.storeImg+'" alt="" style="height: 220px;">';
                	if(arr.indexOf(this.storeIdx) != -1){
                    add += '<div class="product_wishlist">';
                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
                    add += '</div>';
               	} else if(arr.indexOf(this.storeIdx) == -1){
               		add += '<div class="product_wishlist">';
                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
                    add += '</div>';
               	} 
               	add += '</div>';
                add += '<div class="product_description">';
                add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
                add += '<h6 id="price" class="product-price">' + this.storePrice+'원</h6> ';
                add += '</div>';
                add += '</div>';
                add += '</div>';
			});
			$("#aaa").html(add);
			
		},
		error : function(){
			alert("실패~~");
		}
	});
	
}

function category(data,data1) {
	let arr = '${bool}';
	$(".img").attr('style','none');
	
	if(data == '푸드'){
		$(".p").attr('href',"javascript:category('푸드','p')");
		$(".s").attr('href',"javascript:category('푸드','s')");
		$(".c").attr('href',"javascript:category('푸드','c')");
		$("img[name=food]").attr('style','border-color: #3fe8d9');
	} else if(data == '반려'){
		$(".p").attr('href',"javascript:category('반려','p')");
		$(".s").attr('href',"javascript:category('반려','s')");
		$(".c").attr('href',"javascript:category('반려','c')");
		$("img[name=pet]").attr('style','border-color: #3fe8d9');
	} else if(data == '여행'){
		$(".p").attr('href',"javascript:category('여행','p')");
		$(".s").attr('href',"javascript:category('여행','s')");
		$(".c").attr('href',"javascript:category('여행','c')");
		$("img[name=trip]").attr('style','border-color: #3fe8d9');
	} else if(data == '패션'){
		$(".p").attr('href',"javascript:category('패션','p')");
		$(".s").attr('href',"javascript:category('패션','s')");
		$(".c").attr('href',"javascript:category('패션','c')");
		$("img[name=fashion]").attr('style','border-color: #3fe8d9');
	} else if(data == '테크'){
		$(".p").attr('href',"javascript:category('테크','p')");
		$(".s").attr('href',"javascript:category('테크','s')");
		$(".c").attr('href',"javascript:category('테크','c')");
		$("img[name=tech]").attr('style','border-color: #3fe8d9');
	} else if(data == '뷰티'){
		$(".p").attr('href',"javascript:category('뷰티','p')");
		$(".s").attr('href',"javascript:category('뷰티','s')");
		$(".c").attr('href',"javascript:category('뷰티','c')");
		$("img[name=beauty]").attr('style','border-color: #3fe8d9');
	} else if(data == '리빙'){
		$(".p").attr('href',"javascript:category('리빙','p')");
		$(".s").attr('href',"javascript:category('리빙','s')");
		$(".c").attr('href',"javascript:category('리빙','c')");
		$("img[name=baby]").attr('style','border-color: #3fe8d9');
	}
	$.ajax("storejson1.do?storeCategory="+data+"&order="+data1 , {
		type: "get",
		dataType : "json",
		success : function(data){
			
			console.log(data);
			let add = "";
			$.each(data, function(index, obj){
				add += '<div class="col-9 col-sm-6 col-md-4 col-lg-4">';
				add += '<div class="single-product-area mb-30">';
				add += '<div class="product_image">';
				add += '<img id="img" class="normal_img" src="imgs/' + this.storeImg+'" alt="" style="height: 190px;">';
                	if(arr.indexOf(this.storeIdx) != -1){
                    add += '<div class="product_wishlist">';
                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
                    add += '</div>';
               	} else if(arr.indexOf(this.storeIdx) == -1){
               		add += '<div class="product_wishlist">';
                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
                    add += '</div>';
               	} 
               	add += '</div>';
                add += '<div class="product_description">';
                add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
                add += '<h6 id="price" class="product-price">' + this.storePrice+'원</h6> ';
                add += '</div>';
                add += '</div>';
                add += '</div>';
			});
			$("#aaa").html(add);
			
		},
		error : function(){
			alert("실패~~");
		}
	});
	
}
</script>
